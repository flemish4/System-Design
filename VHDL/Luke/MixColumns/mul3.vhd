----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    01:38:59 02/12/2018 
-- Design Name: 
-- Module Name:    mul3 - Behavioral 
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



entity mul3 is
    Port ( x : in  STD_LOGIC_VECTOR (7 downto 0);
           x3 : out  STD_LOGIC_VECTOR (7 downto 0));
end mul3;

architecture Behavioral of mul3 is

component mul2
	Port(x : in  STD_LOGIC_VECTOR (7 downto 0);
        x2: out  STD_LOGIC_VECTOR (7 downto 0));
end component;

signal x2 : STD_LOGIC_VECTOR (7 downto 0);

begin

mul2_x3 : mul2
	port map(x => x,
				x2 => x2
				);

x3 <= x2 xor x;
 

end Behavioral;

