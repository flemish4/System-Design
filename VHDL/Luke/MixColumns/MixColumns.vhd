----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    01:35:56 02/12/2018 
-- Design Name: 
-- Module Name:    MixColumns - Behavioral 
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

entity MixColumns is
    Port ( clk, rst, CE, EN, load : in  STD_LOGIC;
			  --inv, EN_inv, load_inv : in  STD_LOGIC;
			  byte_in : in  STD_LOGIC_VECTOR (7 downto 0);
           byte_out : out  STD_LOGIC_VECTOR (7 downto 0));
end MixColumns;

architecture Behavioral of MixColumns is

--------components-----------------------------
component mul2
	Port(x : in  STD_LOGIC_VECTOR (7 downto 0);
        x2: out  STD_LOGIC_VECTOR (7 downto 0));
end component;

component register_Nbit
	 Generic ( N : positive );
    Port ( clk, rst, CE : in  STD_LOGIC;
           D : in  STD_LOGIC_VECTOR (7 downto 0);
           Q : out  STD_LOGIC_VECTOR (7 downto 0));
end component;

component mux2_8bit 
    Port ( A : in  STD_LOGIC_VECTOR (7 downto 0);
           B : in  STD_LOGIC_VECTOR (7 downto 0);
           SEL : in  STD_LOGIC;
           X : out  STD_LOGIC_VECTOR (7 downto 0));
end component;

---------------------------------------------

---------signals-------------------------------
signal s0 : STD_LOGIC_VECTOR (7 downto 0);
signal s1 : STD_LOGIC_VECTOR (7 downto 0);
signal s2 : STD_LOGIC_VECTOR (7 downto 0);
signal s3 : STD_LOGIC_VECTOR (7 downto 0);

signal s4 : STD_LOGIC_VECTOR (7 downto 0);
signal s5 : STD_LOGIC_VECTOR (7 downto 0);
signal s6 : STD_LOGIC_VECTOR (7 downto 0);
signal s7 : STD_LOGIC_VECTOR (7 downto 0);

signal s8 : STD_LOGIC_VECTOR (7 downto 0);
signal s9 : STD_LOGIC_VECTOR (7 downto 0);
signal s10 : STD_LOGIC_VECTOR (7 downto 0);
signal s11 : STD_LOGIC_VECTOR (7 downto 0);
signal s12 : STD_LOGIC_VECTOR (7 downto 0);
signal s13 : STD_LOGIC_VECTOR (7 downto 0);

signal s14 : STD_LOGIC_VECTOR (7 downto 0);
signal s15 : STD_LOGIC_VECTOR (7 downto 0);
signal s16 : STD_LOGIC_VECTOR (7 downto 0);
signal s17 : STD_LOGIC_VECTOR (7 downto 0);
signal s18 : STD_LOGIC_VECTOR (7 downto 0);
signal s19 : STD_LOGIC_VECTOR (7 downto 0);

signal EN_0 : STD_LOGIC;
signal load_0 : STD_LOGIC;

----------------------------------------------

begin

--	EN_0 <= EN_inv when inv = '1' else
--			  EN;
--	load_0 <= load_inv when inv = '1' else
--				 load;
	
	EN_0 <= EN;
	load_0 <= load;
	
	mul2_0 : mul2
	port map(x => byte_in,
				x2 => s13
				);
	
	--multiply by 3
	s12 <= s13 xor	byte_in;
		
	--
	s0 <= byte_in xor s11;
	s1 <= byte_in xor s10;
	s2 <= s12 xor s9;
	s3 <= s13 xor s8;
	
	reg0 : register_Nbit
	generic map (8)
	port map(clk => clk,
				rst => rst,
				CE => CE,
				D => s0,
				Q => s4
				);
	
	reg1 : register_Nbit
	generic map (8)
	port map(clk => clk,
				rst => rst,
				CE => CE,
				D => s1,
				Q => s5
				);
				
	reg2 : register_Nbit
	generic map (8)
	port map(clk => clk,
				rst => rst,
				CE => CE,
				D => s2,
				Q => s6
				);
	
	reg3 : register_Nbit
	generic map (8)
	port map(clk => clk,
				rst => rst,
				CE => CE,
				D => s3,
				Q => s7
				);
					
	s11 <= s5 when EN_0 = '1' else (others => '0'); --and wouldn't work?----------------!!!
	s10 <= s6 when EN_0 = '1' else (others => '0');
	s9 <= s7 when EN_0 = '1' else (others => '0');
	s8 <= s4 when EN_0 = '1' else (others => '0');
				
				  
	mux0 : mux2_8bit
	port map(A => s14,
				B => s6,
				SEL => load_0,
				X => s15
				);
				
	mux1 : mux2_8bit
	port map(A => s16,
				B => s5,
				SEL => load_0,
				X => s17
				);

	mux2 : mux2_8bit
	port map(A => s18,
				B => s4,
				SEL => load_0,
				X => byte_out
				);

	mux3 : mux2_8bit
	port map(A => byte_in,
				B => s7,
				SEL => load_0,
				X => s19
				);
								
	reg4 : register_Nbit
	generic map (8)
	port map(clk => clk,
				rst => rst,
				CE => CE,
				D => s17,
				Q => s18
				);
				
	reg5 : register_Nbit
	generic map (8)
	port map(clk => clk,
				rst => rst,
				CE => CE,
				D => s15,
				Q => s16
				);
				
				
	reg6 : register_Nbit
	generic map (8)
	port map(clk => clk,
				rst => rst,
				CE => CE,
				D => s19,
				Q => s14
				);

end Behavioral;

