----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    14:23:55 02/09/2018 
-- Design Name: 
-- Module Name:    inversion - Behavioral 
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

entity inversion is
    Port ( d : in  STD_LOGIC_VECTOR (3 downto 0);
           q : out  STD_LOGIC_VECTOR (3 downto 0);
           clk : in  STD_LOGIC;
           reset : in  STD_LOGIC);
end inversion;

architecture Behavioral of inversion is
-- instantiate all the subsytems that have already been created and will be used in the design
component multiply_4 is
    Port ( a : in  STD_LOGIC_VECTOR (3 downto 0);
           b : in  STD_LOGIC_VECTOR (3 downto 0);
           clk : in  STD_LOGIC;
           reset : in  STD_LOGIC;
           q : out  STD_LOGIC_VECTOR (3 downto 0));
end component;

component sqr is
    Port ( d : in  STD_LOGIC_VECTOR (3 downto 0);
           q : out  STD_LOGIC_VECTOR (3 downto 0);
           clk : in  STD_LOGIC;
           reset : in  STD_LOGIC);
end component;
-- define signanls
signal sq1 : STD_LOGIC_VECTOR (3 downto 0);
signal sq2 : STD_LOGIC_VECTOR (3 downto 0);
signal sq3 : STD_LOGIC_VECTOR (3 downto 0);
signal m1 : STD_LOGIC_VECTOR (3 downto 0);
signal m2 : STD_LOGIC_VECTOR (3 downto 0);

begin
-- Perform 3 instances of squaring operations in the GF(2^4) domain 
	-- input to first squarer is d and its output is sq1
	sqr_1 : sqr 
		Port map ( d => d,  
           q => sq1, 
           clk => clk, 
           reset => reset );
			  
	-- input to second squarer is sq1 and its output is sq2
	sqr_2 : sqr 
		Port map ( d => sq1,  
           q => sq2, 
           clk => clk, 
           reset => reset );
			  
	-- input to third squarer is sq2 and its output is sq3
	sqr_3 : sqr 
		Port map ( d => sq2,  
           q => sq3, 
           clk => clk, 
           reset => reset );
			  
-- now we perform the multiplication operaations in the GF(2^4) domain
	-- inputs of first multiplier are sq1 and sq2 and its output is m1	
	mux_1 : multiply_4 
		Port map ( a => sq1, 
           b => sq2, 
           q => m1, 
           clk => clk, 
           reset => reset);
			  
	-- inputs of first multiplier are sq1 and sq2 and its output is m1	
	mux_2 : multiply_4 
		Port map ( a => m1, 
           b => sq3, 
           q => m2, 
           clk => clk, 
           reset => reset);
			  
	-- Now load the output of the final operation into the output of the system
	q <= m2 ;
			  



end Behavioral;

