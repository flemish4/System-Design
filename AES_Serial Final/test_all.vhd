----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    16:52:59 02/18/2018 
-- Design Name: 
-- Module Name:    test_all - Behavioral 
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

entity test_all is
    Port ( d : in  STD_LOGIC_VECTOR (7 downto 0);
           q : out  STD_LOGIC_VECTOR (7 downto 0);
           clk : in  STD_LOGIC;
           reset : in  STD_LOGIC);
end test_all;

architecture Behavioral of test_all is
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

component aff_tran is
    Port ( d : in  STD_LOGIC_VECTOR (7 downto 0);
           q : out  STD_LOGIC_VECTOR (7 downto 0);
           clk : in  STD_LOGIC;
           reset : in  STD_LOGIC);
end component;

component mux_inv is
    Port ( d : in  STD_LOGIC_VECTOR (7 downto 0);
           q : out  STD_LOGIC_VECTOR (7 downto 0);
           clk : in  STD_LOGIC;
           reset : in  STD_LOGIC);
end component;

--define an intermediate signal to be used in between 
	signal del : STD_LOGIC_VECTOR (7 downto 0);
	signal mi : STD_LOGIC_VECTOR (7 downto 0);
	signal in_del : STD_LOGIC_VECTOR (7 downto 0);
	signal aff : STD_LOGIC_VECTOR (7 downto 0);
	

begin
dlt : delta_mat
		Port map( d => d,
           q => del,
           clk => clk,
           reset =>reset );
			  
mux_i : mux_inv
		Port map( d => del,
           q => mi,
           clk => clk,
           reset =>reset );
			 
inv_dlt : inv_delta
	Port map( d => mi,
		  q => in_del,
		  clk => clk,
		  reset =>reset );
		  
af_t : aff_tran
		Port map( d => in_del,
           q => aff,
           clk => clk,
           reset =>reset );
			  
	q <= aff;
		  

	


end Behavioral;

