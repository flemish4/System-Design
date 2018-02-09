----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    14:26:33 01/30/2018 
-- Design Name: 
-- Module Name:    multiply_2 - Behavioral 
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

entity multiply_2 is
    Port ( a : in  STD_LOGIC_VECTOR (1 downto 0);
           b : in  STD_LOGIC_VECTOR (1 downto 0);
           q : out  STD_LOGIC_VECTOR (1 downto 0);
           clk : in  STD_LOGIC;
           reset : in  STD_LOGIC);
end multiply_2;

architecture Behavioral of multiply_2 is
--define variables to be used in the program 
signal x1, x0, n2, n1, n0, v1, v0 :STD_LOGIC;

	begin
		-- write the code to implment the design 
		-- use variables to simplify the xor operations and make sure the right values are computed
		--perform the first set of xor operations and load the data into variables 
		x1 <= a(1) xor a(0);
		x0 <= b(1) xor b(0); 
		-- perform the AND operations and load the results into variables 
		n2 <= a(1) and b(1); 
		n1 <= x1 and x0; 
		n0 <= a(0) and b(0); 
		-- perform the next set of of xor operations 
		v1 <= n1 xor n0; 
		v0 <= n0 xor n2; 
		-- load the computed values into the output 
		q(1) <= v1;
		q(0) <= v0; 
		
end Behavioral;

