----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    16:27:09 02/22/2018 
-- Design Name: 
-- Module Name:    parallel_load_shift_register - Behavioral 
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

entity parallel_load_shift_register is
    Port ( clk,rst,load : in  STD_LOGIC;
           parallel_in : in  STD_LOGIC_VECTOR (7 downto 0);
           serial_in : in  STD_LOGIC_VECTOR (7 downto 0);
           serial_out : out STD_LOGIC_VECTOR (7 downto 0));
end parallel_load_shift_register;

architecture Behavioral of parallel_load_shift_register is

begin
	process(clk)
		begin
		--synchronous reset
			if rising_edge(clk) then 
				if rst = '1' then
					serial_out <= (others => '0'); --fill with zeros
				elsif load = '1' then
					serial_out <= parallel_in;
				else
					serial_out <= serial_in;
				end if;
			end if;
		end process;


end Behavioral;