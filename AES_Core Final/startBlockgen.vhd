----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    22:29:03 02/06/2018 
-- Design Name: 
-- Module Name:    startBlockgen - Behavioral 
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

entity startBlockgen is
    Port ( roundDone : in  STD_LOGIC;
			  startShift : in  STD_LOGIC;
           rst : in  STD_LOGIC;
           clk : in  STD_LOGIC;
           startBlock : out  STD_LOGIC);
end startBlockgen;

architecture Behavioral of startBlockgen is
signal store : std_logic := '0' ;
begin
	process (clk) begin
		if rising_edge(clk) then
			if roundDone = '1' then
				store <= '1';
			elsif  rst = '1' or startShift = '1' then
				store <= '0';
			else
				store <= store;
			end if;
		end if;
	end process;

	startBlock <= store;
end Behavioral;

