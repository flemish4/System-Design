----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    04:14:13 02/16/2018 
-- Design Name: 
-- Module Name:    register_8bit_CE - Behavioral 
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

entity register_8bit_CE is
    Port ( clk, rst, CE : in  STD_LOGIC;
           D : in  STD_LOGIC_VECTOR (7 downto 0);
           Q : out  STD_LOGIC_VECTOR (7 downto 0));
end register_8bit_CE;

architecture Behavioral of register_8bit_CE is

begin
	process(clk,rst,CE)
		begin
			if rst = '1' then
				Q <= (others => '0');
			elsif rising_edge(clk) then
				if CE = '1' then
					Q <= D;
				end if;
			end if;
		end process;


end Behavioral;

