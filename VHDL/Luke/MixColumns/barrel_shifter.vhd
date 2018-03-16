----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    00:19:52 02/22/2018 
-- Design Name: 
-- Module Name:    barrel_shifter - Behavioral 
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
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
library UNISIM;
use UNISIM.VComponents.all;

entity barrel_shifter is
	 generic (SQUENCE : in natural := 7);
    Port ( clk, rst, CE : in  STD_LOGIC;
           Q : out  STD_LOGIC);
end barrel_shifter;

architecture Behavioral of barrel_shifter is



--signal temp: std_logic_vector(3 downto 0) := std_logic_vector(to_unsigned(SQUENCE, 4));

signal output : std_logic;

begin
 

--  process (clk)
--         begin
--             if rising_edge(clk) then 
--					if rst ='1' then
--                   temp <= std_logic_vector(to_unsigned(SQUENCE, 4));
--					else
--                   temp <= temp(2 downto 0) & temp(3);   -- concatenation operator &
--                  
--					end if;
--            end if;
--    end process;
--
--	Q <= temp(3);   -- MSB out

		barrel_shifter: SRLC16E
		generic map(
			INIT => "0000000000000111")
		port map(
			Q		=> output,
			A0		=>	'1',
			A1		=>	'1',
			A2		=>	'0',
			A3 	=>	'0',
			CE		=>	CE,
			clk 	=>	clk,
			D 		=>	output); 
			
	Q <= output; 
	
end Behavioral;

