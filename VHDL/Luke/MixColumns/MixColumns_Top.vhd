----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    05:44:15 02/23/2018 
-- Design Name: 
-- Module Name:    MixColumns_Top - Behavioral 
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

entity MixColumns_Top is
    Port ( clk,rst,inverse : in  STD_LOGIC;
           byte_in : in  STD_LOGIC_VECTOR (7 downto 0);
           byte_out : out  STD_LOGIC_VECTOR (7 downto 0));
end MixColumns_Top;

architecture Behavioral of MixColumns_Top is

component MixColumns 
    Port ( clk, rst : in  STD_LOGIC;
			  byte_in : in  STD_LOGIC_VECTOR (7 downto 0);
           byte_out : out  STD_LOGIC_VECTOR (7 downto 0));
end component;

component inverse_mul is
    Port ( clk, rst : in  STD_LOGIC;
           Byte_in : in  STD_LOGIC_VECTOR (7 downto 0);
           Byte_out : out  STD_LOGIC_VECTOR (7 downto 0));
end component;


component mux2_8bit     
	 Port ( A : in  STD_LOGIC_VECTOR (7 downto 0);
           B : in  STD_LOGIC_VECTOR (7 downto 0);
           SEL : in  STD_LOGIC;
           X : out  STD_LOGIC_VECTOR (7 downto 0));
end component;

signal s1 : STD_LOGIC_VECTOR (7 downto 0);
signal s2 : STD_LOGIC_VECTOR (7 downto 0);


begin

	mixcolumns_block : MixColumns
	port map(clk => clk,
				rst => rst,
				byte_in => s1,
				byte_out => byte_out
				);
				
	mux : mux2_8bit
	port map(A => byte_in,
				B => s2,
				SEL => inverse,
				X => s1
				);

	mul_5040 : inverse_mul
	port map(clk => clk,
				rst => rst,
				byte_in => byte_in,
				byte_out => s2
				);

end Behavioral;

