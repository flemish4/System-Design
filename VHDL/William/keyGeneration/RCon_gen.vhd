----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    12:44:29 01/25/2018 
-- Design Name: 
-- Module Name:    RCon_gen - Behavioral 
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

entity RCon_gen is
    Port ( en : in  STD_LOGIC;
           clk : in  STD_LOGIC;
           rst : in  STD_LOGIC;
           rcon : out  STD_LOGIC_VECTOR (7 downto 0));
end RCon_gen;

architecture Behavioral of RCon_gen is
signal RConR : std_logic_vector (7 downto 0) := "00000001";
signal newRCon : std_logic_vector (7 downto 0);
begin
	process (clk) begin
		if rising_edge(clk) then
			if rst = '1' then
				RConR <= "00000001";
			elsif en = '1' then
				RConR <= newRCon;
			else 
				RConR <= RConR;
			end if;
		end if;
	end process;	
	
	-- Find newRCon value - usually just left shifted but can be 0x1B when full, works for small values - this is not the full calculation
	newRCon <= "00011011" when RConR(7) = '1' else
					std_logic_vector(rotate_left(unsigned(RConR), 1));

	rcon <= RConR;

end Behavioral;
