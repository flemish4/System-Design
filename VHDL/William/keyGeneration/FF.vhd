----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    20:44:01 03/21/2018 
-- Design Name: 
-- Module Name:    FF - Behavioral 
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

entity FF is
    Port ( en : in  STD_LOGIC;
           clr : in  STD_LOGIC;
           rst : in  STD_LOGIC;
           clk : in  STD_LOGIC;
           q : out  STD_LOGIC);
end FF;

architecture Behavioral of FF is
signal R : STD_LOGIC := '0';
begin
	process (clk) begin
		if rising_edge(clk) then
			if clr = '1' or rst = '1' then
				R <= '0';
			elsif en = '1'  then
				R <= '1';
			else
				R <= R;
			end if;
		end if;
	end process;
q <= R;
end Behavioral;

