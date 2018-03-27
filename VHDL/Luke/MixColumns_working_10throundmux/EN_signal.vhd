----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    00:40:51 02/23/2018 
-- Design Name: 
-- Module Name:    EN_signal - Behavioral 
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



entity EN_signal is
	 --generic (SQUENCE : in natural := 7);
    Port ( clk, rst : in  STD_LOGIC;
           Q : out  STD_LOGIC);
end EN_signal;

architecture Behavioral of EN_signal is

signal temp: std_logic_vector(3 downto 0) := std_logic_vector(to_unsigned(11, 4));

begin

  process (clk)
         begin
             if rising_edge(clk) then 
					if rst ='1' then
                   temp <= std_logic_vector(to_unsigned(11, 4));
					else
						 temp <= temp(2 downto 0) & temp(3);   -- concatenation operator &
					end if;
            end if;
    end process;
	
	Q <= temp(3);   -- MSB out

end Behavioral;

