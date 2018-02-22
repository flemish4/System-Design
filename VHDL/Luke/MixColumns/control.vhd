----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    06:01:30 02/16/2018 
-- Design Name: 
-- Module Name:    control - Behavioral 
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

entity control is
    Port ( clk, rst : in  STD_LOGIC;
           EN, load, SEL : out  STD_LOGIC);
end control;

architecture Behavioral of control is

component barrel_shifter is
	 generic (SQUENCE : positive );
    Port ( clk, rst : in  STD_LOGIC;
           Q : out  STD_LOGIC);
end component;

signal s1 : STD_LOGIC;
signal s2 : STD_LOGIC;
signal s3 : STD_LOGIC;


begin
	
	control_EN : barrel_shifter
	generic map (7) 						-- 7 = 0111
	port map(clk => clk,
				rst => rst,
				Q => s1);
				
	control_load : barrel_shifter
	generic map (1) 						-- 1 = 0001
	port map(clk => clk,
				rst => rst,
				Q => s2);
				
	control_SEL : barrel_shifter
	generic map (1) 						-- 1 = 0001
	port map(clk => clk,
				rst => rst,
				Q => s3);


	EN <= s1;
	load <= s2;
	SEL <= s3;

end Behavioral;

