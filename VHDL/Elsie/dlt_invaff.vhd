----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    16:31:37 02/25/2018 
-- Design Name: 
-- Module Name:    dlt_invaff - Behavioral 
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

entity dlt_invaff is
    Port ( d : in  STD_LOGIC_VECTOR (7 downto 0);
           q : out  STD_LOGIC_VECTOR (7 downto 0);
           clk : in  STD_LOGIC;
           reset : in  STD_LOGIC);
end dlt_invaff;

architecture Behavioral of dlt_invaff is
-- define the delt and inverse affine components that will be used in this test
	component delta_mat is
    Port ( d : in  STD_LOGIC_VECTOR (7 downto 0);
           q : out  STD_LOGIC_VECTOR (7 downto 0);
           clk : in  STD_LOGIC;
           reset : in  STD_LOGIC);
end component;

	component inv_affine is
		 Port ( d : in  STD_LOGIC_VECTOR (7 downto 0);
				  q : out  STD_LOGIC_VECTOR (7 downto 0);
				  clk : in  STD_LOGIC;
				  reset : in  STD_LOGIC);
	end component;
--define an intermediate signal to be used in between 
	signal i : STD_LOGIC_VECTOR (7 downto 0);
	
begin	  
	--First, performthe inverse affine transformation 
		in_aff : inv_affine 
		Port map( d => d,
           q => i,
           clk => clk,
           reset =>reset );
			  
	--Load the output into the delta matrix 
		dlt : delta_mat
		Port map( d => i,
           q => q,
           clk => clk,
           reset =>reset );

end Behavioral;

