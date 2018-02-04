----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    16:36:54 01/24/2018 
-- Design Name: 
-- Module Name:    key_counter_v2 - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
library UNISIM;
use UNISIM.VComponents.all;

entity key_counter_v2 is
	generic ( Ncycles : integer := 2);
    Port ( rst : in  STD_LOGIC;
           start : in  STD_LOGIC;
           inv : in  STD_LOGIC;
           clk : in  STD_LOGIC;
			  SRLEnable : out STD_LOGIC;
			  addrEnable : out STD_LOGIC;
			  runAll  : out STD_LOGIC;
			  RConEn  : out STD_LOGIC;
			  RConSel : out STD_LOGIC;
			  FRowSel : out STD_LOGIC;
			  invDelSel : out STD_LOGIC
			  );
end key_counter_v2;

architecture Behavioral of key_counter_v2 is
signal 	enable 			: std_logic := '0';
signal   SRLEnableR		: std_logic := '0';
signal 	addrEnableR		: std_logic := '0';
signal 	enableStart 	: std_logic; -- REVISIT : This may be hacky?
constant NaddrI 			: integer := Ncycles -1;
constant FaddrI 			: integer := 5 - Ncycles - 3; -- F - FiveAddr
constant TaddrI 			: integer := 12 - Ncycles - 2; -- T - TwelveAddr
constant FNaddrI 			: integer := Ncycles - 1; -- N cycles delay but shorten signal by 1
constant InvFNaddrI 			: integer := Ncycles ; -- N cycles delay but shorten signal by 1
constant Naddr  	  		: std_logic_vector (3 downto 0) := std_logic_vector(to_unsigned(NaddrI, 4));
constant Faddr  			: std_logic_vector (3 downto 0) := std_logic_vector(to_unsigned(FaddrI, 4));
constant Taddr 	  		: std_logic_vector (3 downto 0) := std_logic_vector(to_unsigned(TaddrI, 4));
constant FNaddr			: std_logic_vector (3 downto 0) := std_logic_vector(to_unsigned(FNaddrI, 4));
constant InvFNaddr		: std_logic_vector (3 downto 0) := std_logic_vector(to_unsigned(InvFNaddrI, 4));
signal delAddr1			: std_logic_vector (3 downto 0);
signal delAddrDel			: std_logic_vector (3 downto 0);
signal 	s0SelOut  		: std_logic;
signal 	s1SelOut  		: std_logic;
signal 	s1EndOut  		: std_logic;
signal 	addrEnDel  		: std_logic;
signal 	endCond  		: std_logic;
signal 	delQ15  			: std_logic;
signal 	FRowSelW  		: std_logic;
signal 	SRLEnableW  	: std_logic;
constant 	SRLCECount  	: std_logic := '1';
--signal 	RConSelR			: std_logic := '0';
begin	
	-- Handle the enable switch - one cycle of start will enable the clock until reset or end
	process (clk) begin
		if rising_edge(clk) then
			if start = '1' then
				enable <= '1';
			elsif  rst = '1' or endCond = '1' then
				enable <= '0';
			else
				enable <= enable;
			end if;
		end if;
	end process;
	
	-- Handle the Addr enable switch 
	process (clk) begin
		if rising_edge(clk) then
			if enableStart = '1' then
				if inv = '0' then
					if start = '1' then
						addrEnableR <= '1';
					else
						if s1SelOut = '1' then
							addrEnableR <= '0';
						else 
							addrEnableR <= addrEnableR;
						end if;
					end if;
				else -- inv = '1'
					if s1SelOut = '1' then
						addrEnableR <= '1';
					elsif s1EndOut = '1' then
						addrEnableR <= '0';
					else
						addrEnableR <= addrEnableR;
					end if;
				end if;
						
			else -- If not enabled - not running
				addrEnableR <= '0';
			end if;
		end if;
	end process;	
	
	-- Handle the SRL enable switch 
	process (clk) begin
		if rising_edge(clk) then
			if enableStart = '1' then
				if inv = '0' then
					if s0SelOut = '1' then
						SRLEnableR <= '1';
					else 
						SRLEnableR <= SRLEnableR;
					end if;
				else
					if start = '1' or addrEnDel ='1' then
						SRLEnableR <= '1';
					elsif addrEnableR = '1' and fRowSelW = '0' then
						SRLEnableR <= '0';
					else
						SRLEnableR <= SRLEnableR;
					end if;
				end if;
			else -- If not enabled - not running
				SRLEnableR <= '0';
			end if;
		end if;
	end process;	

	
	-- Handle the RCon mux enable switch 
--	process (clk) begin
--		if rising_edge(clk) then
--			if start = '1' then
--				RConSelR <= '1';
--			elsif SRLEnableR = '1' then
--				RConSelR <= '0';
--			else
--				RConSelR <= RConSelR;
--			end if;
--		end if;
--	end process;
		
	SRLC16E_0 : SRLC16E
		generic map (
			INIT => X"0000")
		port map (
			Q => s0SelOut, -- SRL data output
			--Q15 => Q15(i), -- Carry output -- unused
			A0 => Naddr(0), -- Select[0] input
			A1 => Naddr(1), -- Select[1] input
			A2 => Naddr(2), -- Select[2] input
			A3 => Naddr(3), -- Select[3] input
			CE => SRLCECount, -- Clock enable input
			CLK => CLK, -- Clock input
			D => start -- SRL data input
		);		
	SRLC16E_1 : SRLC16E
		generic map (
			INIT => X"0000")
		port map (
			Q => s1SelOut, -- SRL data output
			Q15 => s1EndOut, -- Carry output (connect to next SRL)
			A0 => delAddr1(0), -- Select[0] input
			A1 => delAddr1(1), -- Select[1] input
			A2 => delAddr1(2), -- Select[2] input
			A3 => delAddr1(3), -- Select[3] input
			CE => SRLCECount, -- Clock enable input
			CLK => CLK, -- Clock input
			D => s0SelOut -- SRL data input
		);	
	SRLC16E_5Delay : SRLC16E
		generic map (
			INIT => X"0000")
		port map (
			Q => addrEnDel, -- SRL data output
			Q15 => delQ15, -- Carry output (connect to next SRL)
			A0 => delAddrDel(0), -- Select[0] input
			A1 => delAddrDel(1), -- Select[1] input
			A2 => delAddrDel(2), -- Select[2] input
			A3 => delAddrDel(3), -- Select[3] input
			CE => SRLCECount, -- Clock enable input
			CLK => CLK, -- Clock input
			D => addrEnableR -- SRL data input
		);

		
	FRowSelW	<= s0SelOut or addrEnDel when inv = '0' else --s0SelOut or addrEnDel when inv = '0' else
					addrEnDel and enable;
	FRowSel <= FRowSelW;
	invDelSel <= not FRowSelW;
	
	enableStart <= enable or start;	
	runAll <= enableStart;
--	SRLStart <= '1' when s0SelOut = '1' else
--				  '0'; -- Start when counter = Ncycles
--	addrStop <= '1' when s1SelOut = '1' else
--				  '0'; -- stop address when counter =5
	addrEnable <= addrEnableR or start when inv = '0' else
						addrEnableR or s1EndOut;			  
	SRLEnableW <= (SRLEnableR or s0selout) and enable when inv ='0' else
						(SRLEnableR or s0selout or frowselw) and enable;	
	SRLEnable <= SRLEnableW	;	
	RConEn     <= s0SelOut;
	RConSel		<= s0SelOut when inv = '0' else
						s1EndOut;
	
	delAddr1 <= Faddr when inv = '0' else
					Taddr;
	delAddrDel <= FNaddr when inv = '0' else
						invFNaddr;
	endCond <= delQ15 when inv = '0' else 
					s1EndOut;
					
					
end Behavioral;

