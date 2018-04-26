----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    15:19:15 12/14/2017 
-- Design Name: 
-- Module Name:    shift-rows - Behavioral 
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

entity shift-rows is
    Port ( 8-bit_in 	: in  	STD_LOGIC_VECTOR (0 downto 7);
           8-bit_out : out 	STD_LOGIC_VECTOR (0 downto 7);
           clk 		: in 	 	STD_LOGIC;
           reset 		: in  	STD_LOGIC);
end shift-rows;

architecture Behavioral of shift-rows is

	signal

begin


end Behavioral;

