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
			  genEn : in STD_LOGIC;
           en : in  STD_LOGIC;
           inv : in  STD_LOGIC;
           rst : in  STD_LOGIC;
           clk : in  STD_LOGIC;
           addr : out  STD_LOGIC_VECTOR (3 downto 0));
end addr_gen;

architecture Behavioral of addr_gen is
signal enable : std_logic := '0';
signal counter : std_logic_vector (2 downto 0):= "000";
signal addrF : std_logic_vector (3 downto 0);
signal addrI : std_logic_vector (3 downto 0);

begin

-- Increment and reset the counter
process (clk) begin
	if rising_edge(clk) then
		if rst = '1' or genEn = '0' then
			counter <= (others => '0');
		elsif en = '1' then
			counter <= std_logic_vector(unsigned(counter) + 1);
		else
			counter <= counter;
		end if;
	end if;
end process;

	addrF <= 	"0010" when counter = "000" else
					"0001" when counter = "001" else
					"0000" when counter = "010" else
					"0100" when counter = "011" else
					"0011";
					
	addrI <= 	"1011" when counter = "000" else
					"0110" when counter = "001" else
					"1001" when counter = "010" else
					"1000" when counter = "011" else
					"1000" ; -- when counter = "011" ; else
					-- "1011"; -- reset necessary?
					
	addr  <=    addrF when inv = '0' else
					addrI;
					
end Behavioral;

