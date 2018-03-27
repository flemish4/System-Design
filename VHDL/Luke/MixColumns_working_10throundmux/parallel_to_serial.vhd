----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    22:23:06 02/21/2018 
-- Design Name: 
-- Module Name:    parallel_to_serial - Behavioral 
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


entity parallel_to_serial  is
-- may need serial shift enable
		Port ( load,clk,rst : in  STD_LOGIC;
           serial_in : in  STD_LOGIC_VECTOR (7 downto 0);
           serial_out : out  STD_LOGIC_VECTOR (7 downto 0);
			  parallel_in : in  STD_LOGIC_VECTOR (31 downto 0));
end parallel_to_serial ;

architecture Behavioral of parallel_to_serial  is
	
	signal SR : std_logic_vector(31 downto 0);
	
begin
	process(clk)
		begin
			--synchronous reset
			if rising_edge(clk) then
			
				if rst = '1' then
					SR <= (others => '0'); --fill with zeros				
				elsif load = '1' then
					SR <= parallel_in;
				else 
					SR <= SR(30 downto 0) & '0'; --concatenation operator &
				end if;
				
			end if;	
		end process;
		
		serial_out <= SR(7 downto 0);

end Behavioral;

