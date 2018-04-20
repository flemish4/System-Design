----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    12:14:22 04/19/2018 
-- Design Name: 
-- Module Name:    IF_shift_reg - Behavioral 
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

entity IF_shift_reg is
    Port ( D : in  STD_LOGIC_VECTOR (127 downto 0);
           Q : out  STD_LOGIC_VECTOR (7 downto 0);
           clk : in  STD_LOGIC;
           rst : in  STD_LOGIC;
           DReady : in  STD_LOGIC;
           QReady : in  STD_LOGIC;
           QEn : out  STD_LOGIC;
			  keyInSRReady : out STD_LOGIC;
			  IFReady : in STD_LOGIC
			  );
end IF_shift_reg;

architecture Behavioral of IF_shift_reg is
signal store : STD_LOGIC_VECTOR (127 downto 0) := (others => '0');
signal QEnR : STD_LOGIC := '0';
signal keyState : STD_LOGIC := '0';
begin
	process (clk) begin
		if rising_edge(clk) then
			if rst = '1' then
				store <= (others => '0');
				keyState <= '0';
			elsif QEnR = '1' then
				-- shift data out
				store(127 downto 8) <= store(119 downto 0);
				store(7 downto 0) <= "00000000";
			elsif DReady = '1' then
				store <= D;
				keyState <= '1';
			end if;
		end if;
	end process;
	-- KeyInEn control signal
	process (clk) begin
		if rising_edge(clk) then
			if rst = '1' then
				QEnR <= '0';
			elsif QReady = '1' and keyState = '1' and IFReady = '1'then
				QEnR <= '1';
			else 
				QEnR <= '0';
			end if;
		end if;
	end process;

	Q <= store(127 downto 120);
	QEn <= QEnR;
	keyInSRReady <= keyState;
end Behavioral;

