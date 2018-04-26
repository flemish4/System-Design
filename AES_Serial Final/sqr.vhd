----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    12:44:34 01/30/2018 
-- Design Name: 
-- Module Name:    sqr - Behavioral 
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

entity sqr is
    Port ( d : in  STD_LOGIC_VECTOR (3 downto 0);
           q : out  STD_LOGIC_VECTOR (3 downto 0);
           clk : in  STD_LOGIC;
           reset : in  STD_LOGIC);
end sqr;

architecture Behavioral of sqr is
	signal i0, v0, v1, v2: STD_lOGIC ;
		begin
		   -- write the code to implment the design 
			-- use variables to simplify the xor operations and make sure the right values are computed
			i0 <= d(0) xor d(1);
			v0 <= i0 xor d(3);
			v1 <= d(1) xor d(2);
			v2 <= d(2) xor d(3);
			-- now load the computed values into the output 
			q(3) <= d(3);
			q(2) <= v2; 
			q(1) <= v1;
			q(0) <= v0;
			
end Behavioral;

