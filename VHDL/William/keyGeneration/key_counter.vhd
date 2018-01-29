----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    16:36:54 01/24/2018 
-- Design Name: 
-- Module Name:    key_counter - Behavioral 
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

entity key_counter is
	generic ( Ncycles : integer := 2);
    Port ( rst : in  STD_LOGIC;
           start : in  STD_LOGIC;
           clk : in  STD_LOGIC;
           q : out  STD_LOGIC_VECTOR (4 downto 0);
			  SRLStart : out STD_LOGIC;
			  addrStop : out STD_LOGIC;
			  runAll  : out STD_LOGIC
			  );
end key_counter;

architecture Behavioral of key_counter is
signal counter : std_logic_vector (4 downto 0); -- := (others => '0');
signal enable : std_logic := '0';
constant endVal : integer := 16 + Ncycles;
--signal endCond : std_logic_vector (4 downto 0) := std_logic_vector(unsigned(16 + Ncycles, endCond'length));
begin
-- Increment and reset the counter
process (clk) begin
	if rising_edge(clk) then
		if rst = '1' or enable = '0' then
			counter <= (others => '0');
		else
			counter <= std_logic_vector(unsigned(counter) + 1);
		end if;
	end if;
end process;

-- Handle the enable switch - one cycle of start will enable the clock until reset or end
process (clk) begin
	if rising_edge(clk) then
		if start = '1' then
			enable <= '1';
		elsif to_integer(unsigned(counter)) = endVal or rst = '1' then
			enable <= '0';
		else
			enable <= enable;
		end if;
	end if;
end process;
	
q <= counter;
runAll <= Enable;
SRLStart <= '1' when to_integer(unsigned(counter)) = Ncycles else
			  '0'; -- Start when counter = Ncycles
addrStop <= '1' when counter = "00101" else
			  '0'; -- Start when counter = Ncycles
end Behavioral;

