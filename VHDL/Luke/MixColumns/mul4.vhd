----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    04:22:56 03/02/2018 
-- Design Name: 
-- Module Name:    mul4 - Behavioral 
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

entity mul4 is
    Port ( x : in  STD_LOGIC_VECTOR (7 downto 0);
           x4 : out  STD_LOGIC_VECTOR (7 downto 0));
end mul4;

architecture Behavioral of mul4 is

component mul2
	Port(x : in  STD_LOGIC_VECTOR (7 downto 0);
        x2: out  STD_LOGIC_VECTOR (7 downto 0));
end component;

signal x2 : STD_LOGIC_VECTOR (7 downto 0);
--signal x2_2 : STD_LOGIC_VECTOR (7 downto 0);

begin

mul2_x4_1 : mul2
	port map(x => x,
				x2 => x2
				);
				
mul2_x4_2 : mul2
	port map(x => x2,
				x2 => x4
				);

--x4 <= x2_1 xor x2_2;

end Behavioral;
