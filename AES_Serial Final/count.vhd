----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    11:28:20 02/22/2018 
-- Design Name: 
-- Module Name:    count - Behavioral 
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
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity count is
    Port ( clk 	: in  STD_LOGIC;
           reset 	: in  STD_LOGIC;
           ce 		: in  STD_LOGIC;
           counter: out  STD_LOGIC);
end count;

architecture Behavioral of count is

	signal temp	: STD_LOGIC := '0';
	
begin	
	process (clk) begin
		if (rising_edge(clk)) then 
			if reset = '1' then	
				temp <= '0';		
			elsif ce =  '1' then
				if temp = '1' then
					temp <= '0';
				else
					temp <= '1';
				end if;
			else
				temp <= temp;
			end if; 
		end if;	
	end process;
	counter <= temp;	
	
end Behavioral;

