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

entity top_level_noUART is
    Port ( clk  : in std_logic;
	 		  --Nrst : in std_logic; -- active low for Xess boards
			  rst  : in std_logic; -- active high for Digilent board
				AES_key : in STD_LOGIC_VECTOR (127 downto 0);
				AES_input_data  : in STD_LOGIC_VECTOR (127 downto 0);
				AES_output_data  : out STD_LOGIC_VECTOR (127 downto 0);
				AES_KeyReady : in std_logic;
				AES_InputDataReady : in std_logic;
				AES_OutputDataReady : out std_logic;
				inv : in std_logic;
				led_sel : in std_logic;
				led : out std_logic_vector (7 downto 0)
				);
end top_level_noUART;

architecture RTL of top_level_noUART is


------------------------------------------------------------------------
-- Constant for clock rate (must be set correctly for correct baud rate)
------------------------------------------------------------------------

	constant Clock_Frequency_Hz : integer := 100000000; -- 100 MHz

------------------------------------------------------------------------
-- Component Declarations
------------------------------------------------------------------------


	
	component AES_core_interface is
    Port ( clk,rst : in std_logic;
           AES_key : in std_logic_vector(127 downto 0);
           AES_input_data : in std_logic_vector(127 downto 0);
           AES_output_data : out std_logic_vector(127 downto 0);
           AES_KeyReady : in std_logic;
           AES_InputDataReady : in std_logic;
           AES_OutputDataReady : out std_logic;
			  
           AES_Core_KeyInReady : in std_logic;
			  AES_Core_KeyInEn	 : out std_logic;
			  AES_Core_KeyIn	 : out std_logic_vector(7 downto 0);
			  
           AES_Core_DataInReady : in std_logic;
			  AES_Core_DataInEn	 : out std_logic;
			  AES_Core_DataIn	 : out std_logic_vector(7 downto 0);
			  
           AES_Core_DataOutReady : in std_logic;
			  AES_Core_DataOut	 : in std_logic_vector(7 downto 0)	  
			  
			  );
	end component;


	component AES_core is
		 Port ( dataIn : in  STD_LOGIC_VECTOR (7 downto 0);
				  keyIn : in  STD_LOGIC_VECTOR (7 downto 0);
				  inv : in  STD_LOGIC;
				  clk : in  STD_LOGIC;
				  rst : in  STD_LOGIC;
				  keyInEn : in  STD_LOGIC;
				  dataInEn : in  STD_LOGIC;
				  keyInReady : out  STD_LOGIC;
				  dataInReady : out  STD_LOGIC;
				  q : out  STD_LOGIC_VECTOR (7 downto 0);
				  qReady : out  STD_LOGIC);
	end component;

------------------------------------------------------------------------
-- Signal Declarations
------------------------------------------------------------------------

   signal  AES_Core_KeyInReady , AES_Core_KeyInEn  , AES_Core_DataInReady  , AES_Core_DataInEn  , AES_Core_DataOutReady  : std_logic;
   signal  AES_Core_KeyIn , AES_Core_DataIn, AES_Core_DataOut  : std_logic_vector(7 downto 0);
			  
	signal AES_LED : std_logic_vector(7 downto 0) := "00000000";
	signal LEDUART : std_logic_vector(7 downto 0) := "00000000";
	--signal rst : std_logic; -- required for active low input on Xess boards

------------------------------------------------------------------------
-- Module Implementation
------------------------------------------------------------------------
begin

	--rst <= not Nrst; -- Required on Xess boards as push buttons are active low

   -- Instantiate the serial I/O interface

               

	-- Intantiate the wrapper for the AES Unit Under Test

	AES_Core_interface0: AES_core_interface port map (
			  clk => clk ,
			  rst => rst ,
           AES_key => AES_key ,
           AES_input_data => AES_input_data ,
           AES_output_data => AES_output_data ,
           AES_KeyReady => AES_KeyReady ,
           AES_InputDataReady => AES_InputDataReady ,
           AES_OutputDataReady => AES_OutputDataReady ,
			  
           AES_Core_KeyInReady => AES_Core_KeyInReady ,
			  AES_Core_KeyInEn	 => AES_Core_KeyInEn ,
			  AES_Core_KeyIn	 => AES_Core_KeyIn ,
			  
           AES_Core_DataInReady => AES_Core_DataInReady ,
			  AES_Core_DataInEn	 => AES_Core_DataInEn ,
			  AES_Core_DataIn	 => AES_Core_DataIn ,
			  
           AES_Core_DataOutReady => AES_Core_DataOutReady ,
			  AES_Core_DataOut	 => AES_Core_DataOut
				);
				
	core0 : AES_core 
		 Port map ( 
				  dataIn => AES_Core_DataIn,
				  keyIn => AES_Core_KeyIn,
				  inv => inv,
				  clk => clk,
				  rst => rst,
				  keyInEn => AES_Core_KeyInEn,
				  dataInEn => AES_Core_DataInEn,
				  keyInReady => AES_Core_KeyInReady,
				  dataInReady => AES_Core_DataInReady,
				  q => AES_Core_DataOut,
				  qReady => AES_Core_DataOutReady
				  );

	LED <= AES_LED when LED_sel = '0' else
			LEDUART;
	
	AES_LED(0) <= AES_Core_KeyInEn;
	AES_LED(1) <= AES_Core_KeyInReady;
	AES_LED(2) <= AES_Core_DataInEn;
	AES_LED(3) <= AES_Core_DataInReady;
	AES_LED(7) <= '1';
				
end RTL;
