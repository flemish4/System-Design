----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    10:01:50 02/01/2018 
-- Design Name: 
-- Module Name:    multiply_4 - Behavioral 
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

entity multiply_4 is
    Port ( a : in  STD_LOGIC_VECTOR (3 downto 0);
           b : in  STD_LOGIC_VECTOR (3 downto 0);
           clk : in  STD_LOGIC;
           reset : in  STD_LOGIC;
           q : out  STD_LOGIC_VECTOR (3 downto 0));
end multiply_4;

architecture Behavioral of multiply_4 is

-- Define subsytems that have alread been created and will be used 
component multiply_2 is
    Port ( a : in  STD_LOGIC_VECTOR (1 downto 0);
           b : in  STD_LOGIC_VECTOR (1 downto 0);
           q : out  STD_LOGIC_VECTOR (1 downto 0);
           clk : in  STD_LOGIC;
           reset : in  STD_LOGIC);
end component;

component const_mux_2 is
    Port ( d : in  STD_LOGIC_VECTOR (1 downto 0);
           q : out  STD_LOGIC_VECTOR (1 downto 0);
			  reset : in STD_LOGIC;
			  clk : in STD_LOGIC );
end component;
 -- define signals 
signal Ax : STD_LOGIC_VECTOR (1 downto 0);
signal Ay : STD_LOGIC_VECTOR (1 downto 0);
signal Bx : STD_LOGIC_VECTOR (1 downto 0);
signal By : STD_LOGIC_VECTOR (1 downto 0);
signal O1 : STD_LOGIC_VECTOR (1 downto 0);
signal O2 : STD_LOGIC_VECTOR (1 downto 0);
signal O3 : STD_LOGIC_VECTOR (1 downto 0);
signal O4 : STD_LOGIC_VECTOR (1 downto 0);
signal X1 : STD_LOGIC_VECTOR (1 downto 0);
signal X2 : STD_LOGIC_VECTOR (1 downto 0); 
signal X3 : STD_LOGIC_VECTOR (1 downto 0);
signal Xc : STD_LOGIC_VECTOR (1 downto 0);
 

begin
	-- Load the 4 bit A and B inputs into 2 bit buses 
	Ax(1) <= a(3); 
	Ax(0) <= a(2); 
	Ay(1) <= a(1);
	Ay(0) <= a(0);
	Bx(1) <= b(3); 
	Bx(0) <= b(2);
	By(1) <= b(1);
	By(0) <= b(0);
	
	-- Perform first XOR operations 
	O1 <= Ax XOR Ay; 
	O2 <= Bx XOR By; 
	
	-- Perform 3 instances of multiplication in the GF(2^2) domain 
	-- inputs of first multiplier are Ax ad Bx and its output is X1
	mux_1 : multiply_2 
		Port map ( a => Ax, 
           b => Bx, 
           q => X1, 
           clk => clk, 
           reset => reset );
			  
	-- inputs of second multiplier are O1 and O2 and its output is X2	
	mux_2 : multiply_2 
		Port map ( a => O1, 
           b => O2, 
           q => X2, 
           clk => clk, 
           reset => reset);
	-- inputs of third multiplier are Ay and By and its output is X3
	mux_3 : multiply_2 
		Port map ( a => Ay, 
           b => By, 
           q => X3, 
           clk => clk, 
           reset => reset);
			  
	--perform multiplication by constant operation 
	-- input is X1 and its output is Xc
	mux_c : const_mux_2  
		Port map ( d => X1, 
           q => Xc, 
           clk => clk, 
           reset => reset );
			  
	-- perform fial XOR operations 
	O3 <= X2 XOR X3; 
	O4 <= Xc XOR X3; 
	
	-- load computed values into output 
	q(3) <= O3(1); 
	q(2) <= O3(0);
	q(1) <= O4(1); 
	q(0) <= O4(0); 
	
	


end Behavioral;

