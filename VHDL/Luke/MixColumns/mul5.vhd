----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    03:50:31 03/02/2018 
-- Design Name: 
-- Module Name:    mul5 - Behavioral 
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

entity mul5 is
    Port ( x : in  STD_LOGIC_VECTOR (7 downto 0);
           x5 : out  STD_LOGIC_VECTOR (7 downto 0));
end mul5;

architecture Behavioral of mul5 is

component mul4
	Port(x : in  STD_LOGIC_VECTOR (7 downto 0);
        x4: out  STD_LOGIC_VECTOR (7 downto 0));
end component;

signal x4 : STD_LOGIC_VECTOR (7 downto 0);

begin

mul4_x5 : mul4
	port map(x => x,
				x4 => x4
				);
				

x5 <= x4 xor x;


end Behavioral;

