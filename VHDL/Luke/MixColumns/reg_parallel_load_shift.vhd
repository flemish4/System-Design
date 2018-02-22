----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    22:13:21 02/21/2018 
-- Design Name: 
-- Module Name:    reg_parallel_load_shift_8bit - Behavioral 
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

entity parallel_serial is
    Port ( load,clk,rst : in  STD_LOGIC;
           serial_in : in  STD_LOGIC_VECTOR (7 downto 0);
           serial_out : out  STD_LOGIC_VECTOR (7 downto 0);
			  parallel_in : in  STD_LOGIC_VECTOR (32 downto 0));
end reg_parallel_load_shift_8bit;

architecture Behavioral of reg_parallel_load_shift_8bit is

begin
process(clk)
		begin
		--synchronous reset
			if rising_edge(clk) then 
				if rst = '1' then
				Q <= (others => '0'); --fill with zeros
				if load = '1' then
				Q <= D;
			end if;
		end process;


end Behavioral;

