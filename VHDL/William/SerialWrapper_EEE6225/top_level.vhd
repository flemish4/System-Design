library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

--  Uncomment the following lines to use the declarations that are
--  provided for instantiating Xilinx primitive components.
--library UNISIM;
--use UNISIM.VComponents.all;

------------------------------------------------------------------------
-- Top level module.  Synthesise this one.  Dont forget to use correct
-- user constraints file for the target board.  Remember to adjust the
-- Clock_Frequency_Hz constant below to correct value for your
-- development board.
------------------------------------------------------------------------
-- Version: 1.01, Apr 2016
-- Written: T. Good, University of Sheffield
------------------------------------------------------------------------

entity top_level is
    Port ( clk  : in std_logic;
	 		  --Nrst : in std_logic; -- active low for Xess boards
			  rst  : in std_logic; -- active high for Digilent board
	 		  LED  : out std_logic_vector(7 downto 0);
           RXD  : in std_logic;
           TXD  : out std_logic);
end top_level;

architecture RTL of top_level is


------------------------------------------------------------------------
-- Constant for clock rate (must be set correctly for correct baud rate)
------------------------------------------------------------------------

	constant Clock_Frequency_Hz : integer := 100000000; -- 100 MHz

------------------------------------------------------------------------
-- Component Declarations
------------------------------------------------------------------------

	component serial_io
	 Generic ( Clock_Frequency_Hz : integer );
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
	end component;

	
	component AES_UUT is
    Port ( clk,rst : in std_logic;
           AES_encode : in std_logic;
           AES_key : in std_logic_vector(127 downto 0);
           AES_input_data : in std_logic_vector(127 downto 0);
           AES_output_data : out std_logic_vector(127 downto 0);
           AES_KeyReady : in std_logic;
           AES_InputDataReady : in std_logic;
           AES_OutputDataReady : out std_logic);
	end component;

------------------------------------------------------------------------
-- Signal Declarations
------------------------------------------------------------------------

   signal AES_encode : std_logic;
   signal AES_key, AES_input_data, AES_output_data : std_logic_vector(127 downto 0);
   signal AES_KeyReady, AES_InputDataReady, AES_OutputDataReady : std_logic;

	--signal rst : std_logic; -- required for active low input on Xess boards

------------------------------------------------------------------------
-- Module Implementation
------------------------------------------------------------------------
begin

	--rst <= not Nrst; -- Required on Xess boards as push buttons are active low

   -- Instantiate the serial I/O interface
	

	Interface: serial_io generic map ( Clock_Frequency_Hz )
	 port map ( clk=>clk, rst=>rst,
         		serialTxD => TXD, serialRxD => RXD,
					LED => LED,
          		AES_encode => AES_encode,
					AES_key => AES_key,
					AES_input_data => AES_input_data,
					AES_output_data => AES_output_data,
					AES_KeyReady => AES_KeyReady,
					AES_InputDataReady => AES_InputDataReady,
					AES_OutputDataReady => AES_OutputDataReady);

	-- Intantiate the wrapper for the AES Unit Under Test

	UUT: AES_UUT port map (
							clk, rst,
							AES_encode, AES_key,
							AES_input_data, AES_output_data,
							AES_KeyReady, AES_InputDataReady, AES_OutputDataReady );

end RTL;
