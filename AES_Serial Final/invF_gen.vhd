----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    23:29:03 02/05/2018 
-- Design Name: 
-- Module Name:    invF_gen - Behavioral 
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

entity invF_gen is
    Port ( en : in  STD_LOGIC;
           clr : in  STD_LOGIC;
           inv : in  STD_LOGIC;
           clk : in  STD_LOGIC;
           rst : in  STD_LOGIC;
           invF : out  STD_LOGIC);
end invF_gen;

architecture Behavioral of invF_gen is
signal invFR : STD_LOGIC := '0';
begin
	process (clk) begin
		if rising_edge(clk) then
			if en = '1' and inv = '1' then
				invFR <= '1';
			elsif  rst = '1' or clr = '1' then
				invFR <= '0';
			else
				invFR <= invFR;
			end if;
		end if;
	end process;

	invF <= (en or invFR) and not clr and inv;
end Behavioral;

