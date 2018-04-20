----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    11:50:17 04/19/2018 
-- Design Name: 
-- Module Name:    AES_core_interface - Behavioral 
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
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity AES_core_interface is
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
end AES_core_interface;

architecture Behavioral of AES_core_interface is
component IF_shift_reg is
    Port ( D : in  STD_LOGIC_VECTOR (127 downto 0);
           Q : out  STD_LOGIC_VECTOR (7 downto 0);
           clk : in  STD_LOGIC;
           rst : in  STD_LOGIC;
           DReady : in  STD_LOGIC;
           QReady : in  STD_LOGIC;
           QEn : out  STD_LOGIC;
           IFReady : in  STD_LOGIC;
           keyInSRReady : out  STD_LOGIC);
end component;
component IF_output_SR is
    Port ( D : in  STD_LOGIC_VECTOR (7 downto 0);
           Q : out  STD_LOGIC_VECTOR (127 downto 0);
           clk : in  STD_LOGIC;
           rst : in  STD_LOGIC;
           DReady : in  STD_LOGIC;
           QReady : out  STD_LOGIC
			  );
end component;
component IF_dataIn_SR is
    Port ( D : in  STD_LOGIC_VECTOR (127 downto 0);
           Q : out  STD_LOGIC_VECTOR (7 downto 0);
           clk : in  STD_LOGIC;
           rst : in  STD_LOGIC;
           DReady : in  STD_LOGIC;
           QReady : in  STD_LOGIC;
           QEn : out  STD_LOGIC;
           IFReady : in  STD_LOGIC;
           dataInSRReady : out  STD_LOGIC);
end component;
signal dataInSRReady : STD_LOGIC := '0';
signal keyInSRReady : STD_LOGIC := '0';
signal IFReady : STD_LOGIC := '0';

begin
	-- keyStore shift register , parallel load, serial bytes out
	keyStore : IF_shift_reg
		 Port map ( D => AES_key,
				  Q => AES_Core_KeyIn,
				  clk => clk,
				  rst => rst,
				  DReady => AES_KeyReady,
				  QReady => AES_Core_KeyInReady,
				  QEn => AES_Core_KeyInEn,
				  keyInSRReady => keyInSRReady,
				  IFReady => IFReady
				  );
				  
	-- dataInStore shift register , parallel load, serial bytes out
	dataInStore : IF_dataIn_SR
		 Port map ( D => AES_input_data,
				  Q => AES_Core_DataIn,
				  clk => clk,
				  rst => rst,
				  DReady => AES_InputDataReady,
				  QReady => AES_Core_DataInReady,
				  QEn => AES_Core_DataInEn,
				  dataInSRReady => dataInSRReady,
				  IFReady => IFReady );
	
	dataOutStore : IF_output_SR
		 Port map ( D => AES_Core_DataOut,
				  Q => AES_output_data,
				  clk => clk,
				  rst => rst,
				  DReady => AES_Core_DataOutReady,
				  QReady => AES_OutputDataReady
				  );
	IFReady <= keyInSRReady and dataInSRReady;
end Behavioral;

