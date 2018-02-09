----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    23:42:23 02/05/2018 
-- Design Name: 
-- Module Name:    keyStoreExt - Behavioral 
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

entity keyStoreExt is
    Port ( keyIn : in  STD_LOGIC_VECTOR (7 downto 0);
           ce : in  STD_LOGIC;
           inv : in  STD_LOGIC;
           start : in  STD_LOGIC;
           clk : in  STD_LOGIC;
           rst : in  STD_LOGIC;
           keyOut : out  STD_LOGIC_VECTOR (7 downto 0));
end keyStoreExt;

architecture Behavioral of keyStoreExt is
component srl16_8 is
    Port ( D : in  STD_LOGIC_VECTOR (7 downto 0);
           CE : in  STD_LOGIC;
           CLK : in  STD_LOGIC;
           Addr : in  STD_LOGIC_VECTOR (3 downto 0);
           Q : out  STD_LOGIC_VECTOR (7 downto 0);
           Q15 : out  STD_LOGIC_VECTOR (7 downto 0));
end component;

signal counter : std_logic_vector (3 downto 0):= "0000";
signal Addr : std_logic_vector (3 downto 0);
signal enable : std_logic := '0';
signal enableStart : std_logic;
begin

-- Increment and reset the counter
process (clk) begin
	if rising_edge(clk) then
		if enableStart = '0' then
			counter <= (others => '0');
		else
			counter <= std_logic_vector(unsigned(counter) + 1);
		end if;
	end if;
end process ; 

process (clk) begin
	if rising_edge(clk) then
		if rst = '1' or counter = "1111" then
			enable <= '0';
		elsif start = '1' then
			enable <= '1';
		else
			enable <= enable;
		end if;
	end if;
end process ; 

extKeyStore	 : srl16_8 
    Port map ( D => keyIn ,
           CE => ce,
           CLK => clk,
           Addr => Addr,
           Q  => keyOut
           --Q15  => Q15 
			  );

addr <= counter when inv = '1' else
			not counter;
enableStart <= enable or start;
end Behavioral;

