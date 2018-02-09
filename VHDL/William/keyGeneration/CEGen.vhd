----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    18:20:32 02/08/2018 
-- Design Name: 
-- Module Name:    CEGen - Behavioral 
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

entity CEGen is
    Port ( keyInEn : in  STD_LOGIC;
           stop : in  STD_LOGIC;
           done : in  STD_LOGIC;
           clk : in  STD_LOGIC;
           ce : out  STD_LOGIC);
end CEGen;

architecture Behavioral of CEGen is
signal ceR : std_logic := '0';
begin
	process (clk) begin
		if rising_edge(clk) then
			if keyInEn = '1' then
				ceR <= '1';
			elsif stop = '1' and done = '1' then
				ceR <= '0';
			else 
				ceR <= ceR;
			end if;
		end if;
	end process;

	ce <= ceR or keyInEn;
end Behavioral;

