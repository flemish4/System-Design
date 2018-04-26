----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    03:52:39 02/16/2018 
-- Design Name: 
-- Module Name:    mux2_8bit - Behavioral 
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

entity mux2_8bit is
    Port ( A : in  STD_LOGIC_VECTOR (7 downto 0);
           B : in  STD_LOGIC_VECTOR (7 downto 0);
           SEL : in  STD_LOGIC;
           X : out  STD_LOGIC_VECTOR (7 downto 0));
end mux2_8bit;

architecture Behavioral of mux2_8bit is

begin
	process (A,B,SEL)
	begin
		if SEL = '1' then
			X <= B;
		else
			X <= A;
		end if;
	end process;

end Behavioral;

