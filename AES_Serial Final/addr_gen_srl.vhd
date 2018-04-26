----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    15:57:18 01/25/2018 
-- Design Name: 
-- Module Name:    addr_gen_srl - Behavioral 
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

entity addr_gen_srl is
    Port ( 
           en : in  STD_LOGIC;
           rst : in  STD_LOGIC;
           clk : in  STD_LOGIC;
           addr : out  STD_LOGIC_VECTOR (3 downto 0));
end addr_gen_srl;

architecture Behavioral of addr_gen_srl is
signal q : std_logic;
component srl16_4 is
    Port ( D : in  STD_LOGIC_VECTOR (3 downto 0);
           CE : in  STD_LOGIC;
           CLK : in  STD_LOGIC;
           Addr : in  STD_LOGIC_VECTOR (3 downto 0);
           Q : out  STD_LOGIC_VECTOR (3 downto 0);
           Q15 : out  STD_LOGIC_VECTOR (3 downto 0));
end component;
begin
barrel : srl16_4

end Behavioral;

