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
    Port ( clk, CE, rst : in  STD_LOGIC; 
			  --EN_inv, load_inv : in  STD_LOGIC;
			  EN, load : out  STD_LOGIC);
end component;

component MixColumns 
    Port ( clk, rst, CE, EN, load : in  STD_LOGIC; 
			  --inv, EN_inv, load_inv  : in  STD_LOGIC;
			  byte_in : in  STD_LOGIC_VECTOR (7 downto 0);
           byte_out : out  STD_LOGIC_VECTOR (7 downto 0));
end component;

component inverse_mul is
    Port ( clk, rst, inv, CE, EN, load : in  STD_LOGIC;
           Byte_in : in  STD_LOGIC_VECTOR (7 downto 0);
           Byte_out : out  STD_LOGIC_VECTOR (7 downto 0));
end component;

component srl16_8  is
    Port ( D : in  STD_LOGIC_VECTOR (7 downto 0);
           CE : in  STD_LOGIC;
           CLK : in  STD_LOGIC;
           Addr : in  STD_LOGIC_VECTOR (3 downto 0);
           Q : out  STD_LOGIC_VECTOR (7 downto 0);
           Q15 : out  STD_LOGIC_VECTOR (7 downto 0));
end component;

component mux2_8bit 
    Port ( A : in  STD_LOGIC_VECTOR (7 downto 0);
           B : in  STD_LOGIC_VECTOR (7 downto 0);
           SEL : in  STD_LOGIC;
           X : out  STD_LOGIC_VECTOR (7 downto 0));
end component;

signal EN_0 : STD_LOGIC;
signal load_0: STD_LOGIC;
signal EN_inv : STD_LOGIC;
signal load_inv: STD_LOGIC;

signal s1 : STD_LOGIC_VECTOR (7 downto 0);
signal mixOut : STD_LOGIC_VECTOR (7 downto 0);
signal bypassOut : STD_LOGIC_VECTOR (7 downto 0);


begin

	control_block : control
	port map(clk => clk,
				CE => CE,
				rst => rst,
				--EN_inv => EN_inv,
				--load_inv => load_inv,
				EN => EN_0,
				load => load_0
				);
				
	inverse_block : inverse_mul
	port map(clk => clk,
				rst => rst,
				inv => inv,
				CE => CE,
				EN => EN_0,--EN_inv,
				load => load_0,--load_inv,
				byte_in => byte_in,
				byte_out => s1
				);
				
	mixcolumns_block : MixColumns
	port map(clk => clk,
				rst => rst,
				CE => CE,
				--inv => inv,
				EN => EN_0,
				load => load_0,
				--EN_inv => EN_inv,
				--load_inv => load_inv,
				byte_in => s1,
				byte_out => mixOut
				);
				
	bypassReg: SRL16_8
		port map(
			Q		=> bypassOut,
			--Q15	=>	Q15x,
			addr	=>	"0111",--"1000",
			CE		=>	CE,
			clk 	=>	clk,
			D 		=>	byte_in);

--	process (clk)
--         begin
--             if rising_edge(clk) then 
--                   	byte_out <= byte_out_0;					
--            end if;
--    end process;
	
	load_count <= load_0;
	
	byte_out <= mixOut when round10 = '0' else
					bypassOut;
end Behavioral;

