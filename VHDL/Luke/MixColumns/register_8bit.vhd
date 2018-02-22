----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    04:09:44 02/16/2018 
-- Design Name: 
-- Module Name:    register_8bit - Behavioral 
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

entity register_Nbit is
	 Generic ( N : positive := 8 ); -- This generic defines the length with a default value of 8
    Port ( clk, rst : in  STD_LOGIC;
           D : in  STD_LOGIC_VECTOR (N-1 downto 0);
           Q : out  STD_LOGIC_VECTOR (N-1 downto 0));
end register_Nbit;

architecture Behavioral of register_Nbit is

begin
	process(clk)
		begin
		--synchronous reset
			if rising_edge(clk) then 
				if rst = '1' then
					Q <= (others => '0'); --fill with zeros
				else
					Q <= D;
				end if;
			end if;
		end process;


end Behavioral;

