----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    15:27:01 01/25/2018 
-- Design Name: 
-- Module Name:    addr_gen_barrel - Behavioral 
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

entity addr_gen_barrel is
    Port ( 
           en : in  STD_LOGIC;
           rst : in  STD_LOGIC;
           clk : in  STD_LOGIC;
           addr : out  STD_LOGIC_VECTOR (3 downto 0));
end addr_gen_barrel;

architecture Behavioral of addr_gen_barrel is
type barrel is array (0 to 4) of std_logic_vector(3 downto 0);
signal addrBarrel : barrel;
begin

process (clk) begin
	if rising_edge(clk) then
		if rst = '1' or en = '0' then
			addrBarrel(0) <= "0010";
			addrBarrel(1) <= "0001"; 
			addrBarrel(2) <= "0000"; 
			addrBarrel(3) <= "0100";
			addrBarrel(4) <= "0001";
		else -- must be enabled - shift
			addrBarrel(0) <= addrBarrel(1);
			addrBarrel(1) <= addrBarrel(2);
			addrBarrel(2) <= addrBarrel(3);
			addrBarrel(3) <= addrBarrel(4);
			addrBarrel(4) <= addrBarrel(0);
		end if;
	end if;
end process;

addr <= addrBarrel(0);
end Behavioral;

