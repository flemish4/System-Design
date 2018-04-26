library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

--  Uncomment the following lines to use the declarations that are
--  provided for instantiating Xilinx primitive components.
--library UNISIM;
--use UNISIM.VComponents.all;

------------------------------------------------------------------------
-- This module provides support for a serial I/O entry of key and data
-- to the AES core under test.  The baud rate is fixed at 9600/8N1.
-- Three commands are supported (all in uppercase):
-- K<hexadecimal_string_32_long><lf> to input the (K)ey.
-- D<hexadecimal_string_32_long><lf> to input cypher text and (D)ecrypt.
-- E<hexadecimal_string_32_long><lf> to input plain text and (E)ncrypt.
-- The result is prefixed with the opposite letter permitting cascading
-- of boards (note: the key would never be sent over such a link).
-- Example:	K2B7E151628AED2A6ABF7158809CF4F3C
-- 			D3925841D02DC09FBDC118597196A0B32
-- returns: E3243F6A8885A308D313198A2E0370734
------------------------------------------------------------------------
-- Version: 1.01, Apr 2016
-- Written: T. Good, University of Sheffield
------------------------------------------------------------------------


entity serial_io is
	 Generic( Clock_Frequency_Hz : integer );
    Port ( rst,clk : in std_logic;

	 		  -- Serial Interface
           serialTxD : out std_logic;
           serialRxD : in std_logic;

			  -- Debugging Interface
			  LED : out std_logic_vector(7 downto 0);

			  -- AES core Interface
           AES_encode : out std_logic;
           AES_key : out std_logic_vector(127 downto 0);
           AES_input_data : out std_logic_vector(127 downto 0);
           AES_output_data : in std_logic_vector(127 downto 0);
           AES_KeyReady,AES_InputDataReady : out std_logic;
           AES_OutputDataReady : in std_logic);
end serial_io;


architecture RTL of serial_io is

------------------------------------------------------------------------
-- Component Declarations
------------------------------------------------------------------------

	component uart is
	 Generic ( Clock_Frequency_Hz : integer );
    Port ( clk,rst : in std_logic;
	 		  TxD : out std_logic;
           RxD : in std_logic;
           TxDataByte : in  std_logic_vector(7 downto 0);
           RxDataByte : out std_logic_vector(7 downto 0);
			  TxDataStrobe,RxDataStrobe : std_logic;           
           --TxBufferFull : out std_logic;
           RxDataReady : out std_logic);
	end component;


	component HexChar2Nibble
    Port ( D : in std_logic_vector(7 downto 0);
           Q : out std_logic_vector(3 downto 0);
			  valid : out std_logic);
	end component;

	component Nibble2HexChar
    Port ( D : in std_logic_vector(3 downto 0);
           Q : out std_logic_vector(7 downto 0));
	end component;

	component sreg_nibble_in
    Port ( rst,clk : in std_logic;
           D : in std_logic_vector(3 downto 0);
           Q : out std_logic_vector(127 downto 0);
           shift_nibble : in std_logic);
	end component;

	component sreg_nibble_out
    Port ( rst,clk : in std_logic;
           D : in std_logic_vector(127 downto 0);
           Q : out std_logic_vector(3 downto 0);
           shift_nibble,ld_word : in std_logic);
	end component;


------------------------------------------------------------------------
--  Local Type / constant Declarations
------------------------------------------------------------------------

	constant charK  : std_logic_vector(7 downto 0) := X"4B";
	constant charD  : std_logic_vector(7 downto 0) := X"44";
	constant charE  : std_logic_vector(7 downto 0) := X"45";
	constant charLF : std_logic_vector(7 downto 0) := X"0D";

	type InputState is (stWaitCmd, stReadChar,
							  stKeyCmd,   stLoadingKey, stKeyRead,	stKeyDone,
							  stInputCmd, stLoadingInput, stInputRead, stInputDone);

	type OutputState is (stPassThro, stPassThroTx,
							   stOutputCmd, stFirstWait,
								stSendDchar, stSendDcharWait,
								stSendEchar, stSendEcharWait,
								stSendNibble, stSendNibbleWait,
								stSendLFchar, stSendLFcharWait);

	type OutputSource is (muxInput, muxAES, muxCharE, muxCharD, muxCharLF);

------------------------------------------------------------------------
-- Signal Declarations
------------------------------------------------------------------------

	signal dbInSig	:	std_logic_vector(7 downto 0);
	signal dbOutSig:	std_logic_vector(7 downto 0);
	signal rdaSig	:	std_logic;
	--signal tbfSig	:	std_logic;
	signal rdSig	:	std_logic;
	signal wrSig	:	std_logic;

	signal iAESencode : std_logic;
	signal setAESencode,clearAESencode : std_logic;

	signal NibbleIn,NibbleOut : std_logic_vector(3 downto 0);
	signal ValidNibbleIn : std_logic;
	signal dbAESchar : std_logic_vector( 7 downto 0);
	signal ShiftKey,ShiftInput,ShiftOutput : std_logic;
	signal ResetInput, ResetKey : std_logic;

	signal CurrentInputState,NextInputState   : InputState;
	signal CurrentOutputState,NextOutputState : OutputState;
	signal MuxSel : OutputSource;

	constant InitNibbleCount : integer := 32;
	signal   NibbleCounter : integer range 0 to InitNibbleCount;
	signal   InitNibbleCounter,DecNibbleCounter : std_logic;

	constant TransmitCharacterRate_Hz : integer := 500;
	constant InitTxDelayCount : integer := (Clock_Frequency_Hz / TransmitCharacterRate_Hz)-1;
	signal   LongCounter : integer range 0 to InitTxDelayCount;
	signal   InitLongCounter,DecLongCounter : std_logic;
	

------------------------------------------------------------------------
-- Module Implementation
------------------------------------------------------------------------
begin

	-- Serial Communications UART

	UARTunit: uart generic map ( Clock_Frequency_Hz )
				      port map  ( clk=>clk, rst=>rst,
										TxD => serialTXD,
										RxD => serialRXD,
										TxDataByte => dbOutSig,
										RxDataByte => dbInSig,
										TxDataStrobe => wrSig,
										RxDataStrobe => rdSig,
										--TxBufferFull => tbfSig,
										RxDataReady  => rdaSig);

	-- Character to nibble conversion

	BitsFromHex: HexChar2Nibble port map ( D => dbInSig,
							 Q => NibbleIn, valid => ValidNibbleIn);

	BitsToHex:   Nibble2HexChar port map ( D => NibbleOut, Q => dbAESchar );

	-- Shift Registers for key, input and output

	KeyReg:	sreg_nibble_in port map
				( rst=>ResetKey, clk=>clk, shift_nibble=>ShiftKey,
				  D=>NibbleIn,Q=>AES_key);

	InputReg: sreg_nibble_in port map
				( rst=>ResetInput, clk=>clk, shift_nibble=>ShiftInput,
				  D=>NibbleIn,Q=>AES_input_data);

	OutputReg: sreg_nibble_out port map
				( rst=>rst, clk=>clk, shift_nibble=>ShiftOutput,
				  D=>AES_output_data, ld_word=>AES_OutputDataReady,
				  Q=>NibbleOut);

   -- Resources for input control state machine (S-R latch for iAESencode to avoid gated clocks)

	process (clk)
	   begin
			if rising_edge(clk) then
				if rst = '1' or clearAESencode = '1' then
					iAESencode <= '0';
				elsif setAESencode = '1' then
					iAESencode <= '1';
				end if;
			end if;
	end process;

	AES_encode <= iAESencode;

	-- Input Control State Machine

	process (clk)
		begin
			if rising_edge(clk) then
				if rst = '1' then
					CurrentInputState <= stWaitCmd;
				else
					CurrentInputState <= NextInputState;
				end if;
			end if;
	end process;

	process (CurrentInputState, rdaSig, dbInSig, ValidNibbleIn ) begin
		NextInputState <= CurrentInputState;
		ShiftInput <= '0'; ShiftKey <= '0';
		ResetInput <= '0'; ResetKey <= '0';
		AES_InputDataReady <= '0'; AES_KeyReady <= '0';
		setAESencode <= '0'; clearAESencode <= '0';
		rdSig <='0';

		LED(7)<='0'; LED(6)<='0'; LED(0)<='0';

		case CurrentInputState is

			when 	stWaitCmd =>
					LED(0)<='1';
					if rdaSig = '1' then
						NextInputState <= stReadChar;
					end if;

			when  stReadChar =>
					rdSig <= '1';
					if dbInSig = charK then
							NextInputState <= stKeyCmd;
					elsif dbInSig = charE then
							setAESencode<='1';
							NextInputState <= stInputCmd;
					elsif dbInSig = charD then
							clearAESencode<='1';
							NextInputState <= stInputCmd;
					else
							NextInputState <= stWaitCmd;
					end if;

			when  stKeyCmd =>
					ResetKey <= '1';
					NextInputState <= stLoadingKey;
			
			when  stLoadingKey =>
					LED(7)<='1';
					if rdaSig = '1' then
						if dbInSig = charLF then
							NextInputState <= stKeyDone;
						elsif ValidNibbleIn = '1' then
							NextInputState <= stKeyRead;
						end if;
					end if;

			when  stKeyRead =>
					rdSig <= '1';
					ShiftKey <= '1';
					NextInputState <= stLoadingKey;
		
			when stKeyDone =>
					rdSig <= '1';
					AES_KeyReady <= '1';
					NextInputState <= stWaitCmd;

			when  stInputCmd =>
					rdSig <= '1';
					ResetInput <= '1';
					NextInputState <= stLoadingInput;
			
			when  stLoadingInput =>
					LED(6)<='1';
					if rdaSig = '1' then
						if dbInSig = charLF then
							NextInputState <= stInputDone;
						elsif ValidNibbleIn = '1' then
							NextInputState <= stInputRead;
						end if;
					end if;

			when  stInputRead =>
					rdSig <= '1';
					ShiftInput <= '1';
					NextInputState <= stLoadingInput;

			when  stInputDone =>
					rdSig <= '1';
					AES_InputDataReady <= '1';
					NextInputState <= stWaitCmd;

		end case;
	end process;


	-- Output Control Resources (2 x counters and 1 x multiplexer)

--	process (clk, InitLongCounter) 
--	begin
--   	if InitLongCounter='1' then -- asynchronous reset
--	      LongCounter <= InitTxDelayCount;
--	   elsif rising_edge(clk) then
--      	if DecLongCounter='1' then
--	         LongCounter <= LongCounter - 1;
--      	end if;
--   	end if;
--	end process;
--
--
-- 	process (clk, InitNibbleCounter) 
--	begin
--   	if InitNibbleCounter='1' then 
--	      NibbleCounter <= InitNibbleCount;
--	   elsif rising_edge(clk) then
--      	if DecNibbleCounter='1' then
--	         NibbleCounter <= NibbleCounter - 1;
--      	end if;
--   	end if;
--	end process;


	process (clk) 
	begin
   	if rising_edge(clk) then
			if InitLongCounter='1' then -- asynchronous reset
				LongCounter <= InitTxDelayCount;
			elsif DecLongCounter='1' then
	         LongCounter <= LongCounter - 1;
      	end if;
   	end if;
	end process;


 	process (clk) 
	begin
		if rising_edge(clk) then
			if InitNibbleCounter='1' then 
				NibbleCounter <= InitNibbleCount;
			elsif DecNibbleCounter='1' then
	         NibbleCounter <= NibbleCounter - 1;
      	end if;
   	end if;
	end process;


	process (MuxSel, dbInSig, dbAESchar)
	begin
   	case MuxSel is
      	when muxInput  => dbOutSig <= dbInSig;
      	when muxAES    => dbOutSig <= dbAESchar;
      	when muxCharE  => dbOutSig <= CharE;
      	when muxCharD  => dbOutSig <= CharD;
			when muxCharLF => dbOutSig <= CharLF;
      	when others => null;
   	end case;
	end process;
 

	-- Output Control State Machine

	process (clk)
		begin
			if rising_edge(clk) then
				if rst = '1' then
					CurrentOutputState <= stPassThro;
				else
					CurrentOutputState <= NextOutputState;
				end if;
			end if;
	end process;


	process (CurrentOutputState, dbInSig, rdaSig, NibbleCounter, LongCounter,
				 dbAESchar,	AES_OutputDataReady, iAESencode  )
	begin
		NextOutputState <= CurrentOutputState;
		ShiftOutput <= '0';
		wrSig <= '0';
		LED(5) <= '0';
		LED(4) <= '0';
		LED(3) <= '0';
		--LED(2) <= '0';
		LED(1) <= '0';

		InitNibbleCounter <= '0';  DecNibbleCounter <= '0';
		InitLongCounter   <= '0';  DecLongCounter   <= '0';
	
		case CurrentOutputState is
			when stPassThro =>
					LED(4) <='1';
					MuxSel <= muxInput;
					if AES_OutputDataReady = '1' then
						NextOutputState <= stOutputCmd;
					elsif rdaSig = '1' then
						NextOutputState <= stPassThroTx;
					end if;
					
			when stPassThroTx =>
					MuxSel <= muxInput;
					wrSig <= '1';
					NextOutputState <= stPassThro;
					
			-- Start of command init & wait
			when stOutputCmd =>
					LED(1)<='1';
					MuxSel <= muxCharLF;
					InitLongCounter <= '1';
					InitNibbleCounter <= '1';
					NextOutputState <= stFirstWait;

			when stFirstWait =>
					LED(1)<='1';
					MuxSel <= muxCharLF;
					DecLongCounter <= '1';
					if LongCounter = 0 then
						if iAESencode = '1' then
							NextOutputState <= StSendDchar;
						else 
							NextOutputState <= StSendEchar;
						end if;
					end if;

			-- "D" character send & wait
			when stSendDchar =>
					wrSig <= '1';
					MuxSel <= muxCharD;
					InitLongCounter <= '1';
					NextOutputState <= stSendDcharWait;

			when  stSendDcharWait =>
					--LED(2)<='1';
					MuxSel <= muxCharD;
					DecLongCounter <= '1';
					if LongCounter = 0 then
						NextOutputState <= StSendNibble;
					end if;

			-- "E" character send & wait
			when stSendEchar =>
					wrSig <= '1';
					MuxSel <= muxCharE;
					InitLongCounter <= '1';
					NextOutputState <= stSendEcharWait;

			when  stSendEcharWait =>
					--LED(2)<='1';
					MuxSel <= muxCharE;
					DecLongCounter <= '1';
					if LongCounter = 0 then
						NextOutputState <= StSendNibble;
					end if;

			-- Nibble send & wait
			when stSendNibble =>
					wrSig <= '1';
					MuxSel <= muxAES;
					--if (NibbleCounter /= InitNibbleCount) then
						ShiftOutput <= '1';
					--end if;
					DecNibbleCounter <= '1';
					InitLongCounter <= '1';
					NextOutputState <= stSendNibbleWait;

			when stSendNibbleWait =>
					LED(3)<='1';
					MuxSel <= muxAES;
					DecLongCounter <= '1';
					if LongCounter = 0 then
						if NibbleCounter = 0 then
							NextOutputState <= StSendLFchar;
						else
							NextOutputState <= stSendNibble;
						end if;
					end if;

			-- Send LF char & wait
			when stSendLFchar =>
					wrSig <= '1';
					MuxSel <= muxCharLF;
					InitLongCounter <= '1';
					NextOutputState <= stPassThro;

			when  stSendLFcharWait =>
					--LED(2)<='1';
					MuxSel <= muxCharLF;
					DecLongCounter <= '1';
					if LongCounter = 0 then
						NextOutputState <= StPassThro;
					end if;

		end case;
	end process;

	LED(2) <= rst;	


end RTL;
