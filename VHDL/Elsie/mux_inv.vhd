----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    00:31:50 02/15/2018 
-- Design Name: 
-- Module Name:    mux_inv - Behavioral 
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

entity mux_inv is
    Port ( d : in  STD_LOGIC_VECTOR (7 downto 0);
           q : out  STD_LOGIC_VECTOR (7 downto 0);
           clk : in  STD_LOGIC;
           reset : in  STD_LOGIC);
end mux_inv;

architecture Behavioral of mux_inv is
-- Define subsytems that have alread been created and will be used
component sqr is
    Port ( d : in  STD_LOGIC_VECTOR (3 downto 0);
           q : out  STD_LOGIC_VECTOR (3 downto 0);
           clk : in  STD_LOGIC;
           reset : in  STD_LOGIC);
end component;

component multiply_4 is
    Port ( a : in  STD_LOGIC_VECTOR (3 downto 0);
           b : in  STD_LOGIC_VECTOR (3 downto 0);
           clk : in  STD_LOGIC;
           reset : in  STD_LOGIC;
           q : out  STD_LOGIC_VECTOR (3 downto 0));
end component;

component const_mux_4 is
    Port ( d : in  STD_LOGIC_VECTOR (3 downto 0);
           q : out  STD_LOGIC_VECTOR (3 downto 0);
           clk : in  STD_LOGIC;
           reset : in  STD_LOGIC);
end component;

component inversion is
    Port ( d : in  STD_LOGIC_VECTOR (3 downto 0);
           q : out  STD_LOGIC_VECTOR (3 downto 0);
           clk : in  STD_LOGIC;
           reset : in  STD_LOGIC);
end component;

-- define signanls
signal a : STD_LOGIC_VECTOR (3 downto 0);
signal b : STD_LOGIC_VECTOR (3 downto 0);
signal sq : STD_LOGIC_VECTOR (3 downto 0);
signal mu_1 : STD_LOGIC_VECTOR (3 downto 0);
signal mu_2 : STD_LOGIC_VECTOR (3 downto 0);
signal mu_3 : STD_LOGIC_VECTOR (3 downto 0);
signal cm : STD_LOGIC_VECTOR (3 downto 0);
signal inver : STD_LOGIC_VECTOR (3 downto 0);
signal eo1 : STD_LOGIC_VECTOR (3 downto 0);
signal eo2 : STD_LOGIC_VECTOR (3 downto 0);

begin
--Load the 8-bit input into 2 4-bit buses 
	a(3) <= d(7);
	a(2) <= d(6);
	a(1) <= d(5);
	a(0) <= d(4);
	
	b(3) <= d(3); 
	b(2) <= d(2); 
	b(1) <= d(1); 
	b(0) <= d(0);
	
-- perform the squaring operation on the 4 MSB's of the input
	-- input to first squarer is a and its output is sq
	sqr_1 : sqr 
		Port map ( d => a,  
           q => sq, 
           clk => clk, 
           reset => reset );
			
-- XOR the A and B bits 
	eo1 <= a xor b; 
	
-- multiply the output of the XOR operation by b  
	-- The inputs are EO1 and B output is mu_1
	mux_1 : multiply_4 
		Port map ( a => eo1, 
           b => b, 
           q => mu_1, 
           clk => clk, 
           reset => reset);
			 
-- multiply the output of the squaring operation by a constant 
	-- The input is sq and the output is cm 
	const_mux: const_mux_4
    Port map ( d => sq,
           q => cm, 
           clk => clk,
           reset => reset);
			  
-- XOR CM and mu_1
	eo2 <= cm xor mu_1; 
	
-- perform the inverson operation on the eo2
	-- The inpus is eo2 and the output is inver 
	inver_1 : inversion 
		port map ( d => eo2, 
				q => inver,
				clk => clk,
				reset => reset);
				
-- multply the output the  inversion and a 
	-- The inputs are inver and a and the output is mu_2
	mux_2 : multiply_4 
		Port map ( a => a, 
           b => inver, 
           q => mu_2, 
           clk => clk, 
           reset => reset);
			  
-- multply the output the  inversion and b 
	-- The inputs are inver and eo1 and the output is mu_3
	mux_3 : multiply_4 
		Port map ( a => inver, 
           b => eo1, 
           q => mu_3, 
           clk => clk, 
           reset => reset);
			  
-- load the results onto the output bus 
	q(7) <= mu_2(3);
	q(6) <= mu_2(2); 
	q(5) <= mu_2(1); 
	q(4) <= mu_2(0);
	q(3) <= mu_3(3);
	q(2) <= mu_3(2); 
	q(1) <= mu_3(1); 
	q(0) <= mu_3(0); 
	
	


end Behavioral;

