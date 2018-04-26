----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    21:13:16 01/24/2018 
-- Design Name: 
-- Module Name:    addr_gen - Behavioral 
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

entity addr_gen is
    Port ( 
			  --genEn : in STD_LOGIC;
           en : in  STD_LOGIC;
           ce : in  STD_LOGIC;
           inv : in  STD_LOGIC;
           rst : in  STD_LOGIC;
           clk : in  STD_LOGIC;
           QAddrSel : out  STD_LOGIC;
           addr : out  STD_LOGIC_VECTOR (3 downto 0));
end addr_gen;

architecture Behavioral of addr_gen is
--signal enable : std_logic := '0';
signal counter : std_logic_vector (2 downto 0):= "000";
signal addrF : std_logic_vector (4 downto 0);
signal addrI : std_logic_vector (4 downto 0);

begin

-- Increment and reset the counter
process (clk) begin
	if rising_edge(clk) then
		--if rst = '1' or genEn = '0' then
		if ce = '1' then
			if (rst = '1') or (counter = "100") then
				counter <= (others => '0');
			elsif en = '1' then
				counter <= std_logic_vector(unsigned(counter) + 1);
			else
				counter <= counter;
			end if;
		else 
			counter <= counter;
		end if;
	end if;
end process;

	addrF <= 	"00011" when counter = "000" else
					"00000" when counter = "001" else
					"10000" when counter = "010" else
					"10000" when counter = "011" else
					"10000";
					
	addrI <= 	"01000" when counter = "000" else
					"00101" when counter = "001" else
					"01001" when counter = "010" else
					"01001" when counter = "011" else
					"01001" ;
					
	addr  <=    addrF(3 downto 0) when inv = '0' else
					addrI(3 downto 0);
	QAddrSel <= addrF(4) when inv = '0' else
					addrI(4);
					
end Behavioral;

