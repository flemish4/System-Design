----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    16:39:01 03/11/2018 
-- Design Name: 
-- Module Name:    counter_4bit - Behavioral 
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

entity counter_4bit is
    Port ( clk : in  STD_LOGIC;
           rst : in  STD_LOGIC;
           ce : in  STD_LOGIC;
           q : out  STD_LOGIC_VECTOR (3 downto 0));
end counter_4bit;

architecture Behavioral of counter_4bit is

begin


end Behavioral;

