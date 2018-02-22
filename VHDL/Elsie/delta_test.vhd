----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    15:06:44 02/16/2018 
-- Design Name: 
-- Module Name:    delta_test - Behavioral 
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

entity delta_test is
    Port ( d : in  STD_LOGIC_VECTOR (7 downto 0);
           q : out  STD_LOGIC_VECTOR (7 downto 0);
           clk : in  STD_LOGIC;
           reset : in  STD_LOGIC);
end delta_test;

architecture Behavioral of delta_test is
-- define the delt and inverse delta components that will be used in this test
	component delta_mat is
    Port ( d : in  STD_LOGIC_VECTOR (7 downto 0);
           q : out  STD_LOGIC_VECTOR (7 downto 0);
           clk : in  STD_LOGIC;
           reset : in  STD_LOGIC);
end component;

	component inv_delta is
    Port ( d : in  STD_LOGIC_VECTOR (7 downto 0);
           q : out  STD_LOGIC_VECTOR (7 downto 0);
           clk : in  STD_LOGIC;
           reset : in  STD_LOGIC);
end component;
--define an intermediate signal to be used in between 
 signal b : STD_LOGIC_VECTOR (7 downto 0);

begin
--module to test that the delta and inverse delta functions are working
		--insert inputs into delta matrix first 
		dlt : delta_mat
		Port map( d => d,
           q => b,
           clk => clk,
           reset =>clk );
			 
		-- Pass the output of the delta into the inv_delta matrix 
		inv_dlt : inv_delta
		Port map( d => b,
           q => q,
           clk => clk,
           reset =>clk );
	

end Behavioral;

