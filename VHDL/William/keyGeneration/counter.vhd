----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    22:13:27 02/05/2018 
-- Design Name: 
-- Module Name:    counter - Behavioral 
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
--library UNISIM;
--use UNISIM.VComponents.all;

entity counter is
    Port ( ce : in  STD_LOGIC;
           clk : in  STD_LOGIC;
           rst : in  STD_LOGIC;
           q : out  STD_LOGIC);
end counter;

architecture Behavioral of counter is
signal counterVal : STD_LOGIC_VECTOR (3 downto 0);
begin
	process (clk) 
	begin
		if rising_edge(clk) then
			if ce = '1' then
				counterVal <= std_logic_vector(unsigned(counterVal) + 1);
			elsif rst = '1' or counterVal = "1111" then
				counterVal <= "0000";
			else
				counterVal <= counterVal;
			end if;
		end if;
	end process;
	
	q <= '1' when counterVal = "1010" else
			'0';

end Behavioral;

