----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    11:43:28 03/11/2018 
-- Design Name: 
-- Module Name:    testBuf8_8 - Behavioral 
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

entity testBuf8_8 is
    Port ( d : in  STD_LOGIC_VECTOR (7 downto 0);
           clk : in  STD_LOGIC;
           ce : in  STD_LOGIC;
           rst : in  STD_LOGIC;
           q : out  STD_LOGIC_VECTOR (7 downto 0));
end testBuf8_8;

architecture Behavioral of testBuf8_8 is
signal d0 : STD_LOGIC_VECTOR (7 downto 0) := "00000000";
begin
delay0: process(CLK)
begin
    if rising_edge(CLK) then
        if ce = '1' then
			  if (rst='1') then
					d0 <= "00000000";
			  else
					d0 <= d;
			  end if;
		  else 
		      d0 <= d0;
		  end if;
    end if;
end process delay0;
q <=  d0;
end Behavioral;

