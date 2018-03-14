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
    Port ( clk, rst, inv, CE, round10 : in  STD_LOGIC;
           byte_in : in  STD_LOGIC_VECTOR (7 downto 0);
			  load_count : out  STD_LOGIC;
           byte_out : out  STD_LOGIC_VECTOR (7 downto 0));
end MixColumns_Top;

architecture Behavioral of MixColumns_Top is

component control is
    Port ( clk, CE : in  STD_LOGIC;
           EN, load  : out  STD_LOGIC);
end component;

component MixColumns 
    Port ( clk, rst, CE, EN, load, round10 : in  STD_LOGIC;
			  byte_in : in  STD_LOGIC_VECTOR (7 downto 0);
           byte_out : out  STD_LOGIC_VECTOR (7 downto 0));
end component;

component inverse_mul is
    Port ( clk, rst, inv, CE, EN, load, round10 : in  STD_LOGIC;
           Byte_in : in  STD_LOGIC_VECTOR (7 downto 0);
           Byte_out : out  STD_LOGIC_VECTOR (7 downto 0));
end component;

signal EN_0 : STD_LOGIC;
signal load_0: STD_LOGIC;

signal s1 : STD_LOGIC_VECTOR (7 downto 0);

begin

	control_block : control
	port map(clk => clk,
				CE => CE,
				EN => EN_0,
				load => load_0
				);
				
	inverse_block : inverse_mul
	port map(clk => clk,
				rst => rst,
				inv => inv,
				CE => CE,
				EN => EN_0,
				load => load_0,
				round10 => round10,
				byte_in => byte_in,
				byte_out => s1
				);
				
	mixcolumns_block : MixColumns
	port map(clk => clk,
				rst => rst,
				CE => CE,
				EN => EN_0,
				load => load_0,
				round10 => round10,
				byte_in => s1,
				byte_out => byte_out
				);
				
	load_count <= load_0;
	
end Behavioral;

