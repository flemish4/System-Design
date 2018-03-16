----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    06:50:29 03/02/2018 
-- Design Name: 
-- Module Name:    MC_inverse - Behavioral 
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

entity MC_inverse is
    Port ( clk,rst,inverse : in  STD_LOGIC;
           Q : out  STD_LOGIC);
end MC_inverse;

architecture Behavioral of MC_inverse is

signal temp: std_logic_vector(35 downto 0) := std_logic_vector(to_unsigned(1048575, 36)); --FFFFF

begin


  process (clk)
         begin
             if rising_edge(clk) then 
					if rst = '1' then
                   temp <= std_logic_vector(to_unsigned(1048575, 36));
					elsif inverse = '0' then
                   temp <= std_logic_vector(to_unsigned(1048575, 36));
					else
						 temp <= temp(34 downto 0) & temp(35);   -- concatenation operator &
					end if;
            end if;
    end process;
	
	Q <= temp(35);   -- MSB out

end Behavioral;
