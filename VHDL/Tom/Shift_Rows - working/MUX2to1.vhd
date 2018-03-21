----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    20:50:56 02/20/2018 
-- Design Name: 
-- Module Name:    MUX2to1 - Behavioral 
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

entity MUX2to1 is
    Port ( X0 : in  STD_LOGIC_VECTOR (7 downto 0);
           X1 : in  STD_LOGIC_VECTOR (7 downto 0);
           En : in  STD_LOGIC;
           Q : out  STD_LOGIC_VECTOR (7 downto 0));
end MUX2to1;

architecture Behavioral of MUX2to1 is

begin

	Q <= X0 when (En = '0') else X1;

end Behavioral;

