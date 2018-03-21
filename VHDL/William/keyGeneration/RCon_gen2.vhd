----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    11:39:39 03/12/2018 
-- Design Name: 
-- Module Name:    RCon_gen2 - Behavioral 
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

entity RCon_gen2 is
    Port ( RConCounter : in  STD_LOGIC_VECTOR (3 downto 0);
           RCon : out  STD_LOGIC_VECTOR (7 downto 0));
end RCon_gen2;

architecture Behavioral of RCon_gen2 is

begin

	RCon <= 		"00000001" when RConCounter = "0000" else
					"00000010" when RConCounter = "0001" else
					"00000100" when RConCounter = "0010" else
					"00001000" when RConCounter = "0011" else
					"00010000" when RConCounter = "0100" else
					"00100000" when RConCounter = "0101" else
					"01000000" when RConCounter = "0110" else
					"10000000" when RConCounter = "0111" else
					"00011011" when RConCounter = "1000" else
					"00110110" ;--when RConCounter = "1001" ;
end Behavioral;

