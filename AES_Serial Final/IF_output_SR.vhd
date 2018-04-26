----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    12:23:03 04/19/2018 
-- Design Name: 
-- Module Name:    IF_output_SR - Behavioral 
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

entity IF_output_SR is
    Port ( D : in  STD_LOGIC_VECTOR (7 downto 0);
           Q : out  STD_LOGIC_VECTOR (127 downto 0);
           clk : in  STD_LOGIC;
           rst : in  STD_LOGIC;
           DReady : in  STD_LOGIC;
           QReady : out  STD_LOGIC
			  );
end IF_output_SR;

architecture Behavioral of IF_output_SR is
signal store : STD_LOGIC_VECTOR (255 downto 0) := (others => '0');
signal DReadyR : STD_LOGIC := '0';
begin
	process (clk) begin
		if rising_edge(clk) then
			if rst = '1' then
				store <= (others => '0');
			elsif DReady = '1' then
				-- shift data out
				store(255 downto 8) <= store(247 downto 0);
				store(7 downto 0) <= D;
			end if;
		end if;
	end process;
	
	
	process (clk) begin
		if rising_edge(clk) then
			if rst = '1' then
				DReadyR <= '0';
			elsif DReady = '1' then
				DReadyR <= '1';
			else 
				DReadyR <= '0';
			end if;
		end if;
	end process;


	Q <= store(255 downto 128);
	QReady <= DReadyR and not DReady;


end Behavioral;

