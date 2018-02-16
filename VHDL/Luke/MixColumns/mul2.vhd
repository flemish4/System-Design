----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    01:37:23 02/12/2018 
-- Design Name: 
-- Module Name:    mul2 - Behavioral 
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

entity mul2 is
    Port ( x : in  STD_LOGIC_VECTOR (7 downto 0);
           x2: out  STD_LOGIC_VECTOR (7 downto 0));
end mul2;

architecture Behavioral of mul2 is

begin

	x2(7) <= x(6);
	x2(6) <= x(5);
	x2(5) <= x(4);
	x2(4) <= x(3) xor x(7);
	x2(3) <= x(2) xor x(7);
	x2(2) <= x(1);
	x2(1) <= x(0) xor x(7);
	x2(0) <= x(7);

end Behavioral;

