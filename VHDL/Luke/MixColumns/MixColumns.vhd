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
    Port ( clk, rst : in  STD_LOGIC;
			  byte_in : in  STD_LOGIC_VECTOR (7 downto 0);
           byte_out : out  STD_LOGIC_VECTOR (7 downto 0));
end MixColumns;

architecture Behavioral of MixColumns is

--------components-----------------------------
component mul3
	Port(x : in  STD_LOGIC_VECTOR (7 downto 0);
        x3: out  STD_LOGIC_VECTOR (7 downto 0));
end component;

component mul2
	Port(x : in  STD_LOGIC_VECTOR (7 downto 0);
        x2: out  STD_LOGIC_VECTOR (7 downto 0));
end component;

component register_Nbit
	 Generic ( N : positive );
    Port ( clk, rst : in  STD_LOGIC;
           D : in  STD_LOGIC_VECTOR (7 downto 0);
           Q : out  STD_LOGIC_VECTOR (7 downto 0));
end component;

component control is
    Port ( clk, rst : in  STD_LOGIC;
           EN, load, SEL : out  STD_LOGIC);
end component;

component mux2_8bit 
    Port ( A : in  STD_LOGIC_VECTOR (7 downto 0);
           B : in  STD_LOGIC_VECTOR (7 downto 0);
           SEL : in  STD_LOGIC;
           X : out  STD_LOGIC_VECTOR (7 downto 0));
end component;

component parallel_load_shift_register is
    Port ( clk,rst,load : in  STD_LOGIC;
           parallel_in : in  STD_LOGIC_VECTOR (7 downto 0);
           serial_in : in  STD_LOGIC_VECTOR (7 downto 0);
           serial_out : out STD_LOGIC_VECTOR (7 downto 0));
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

signal EN_0 : STD_LOGIC;
signal load_0 : STD_LOGIC;
signal SEL_0 : STD_LOGIC;


signal A : STD_LOGIC_VECTOR (7 downto 0);
--signal B : STD_LOGIC_VECTOR (7 downto 0);
----------------------------------------------

begin


	control_0 : control
	port map(clk => clk,
				rst => rst,
				EN => EN_0,
				load => load_0,
				SEL => SEL_0				
				);
	
	mul2_0 : mul2
	port map(x => byte_in,
				x2 => s13
				);
	
	mul3_0 : mul3
	port map(x => byte_in,
				x3 => s12
				);
				
	s0 <= byte_in xor s11;
	s1 <= byte_in xor s10;
	s2 <= s12 xor s9;
	s3 <= s13 xor s8;
	
	reg0 : register_Nbit
	generic map (8)
	port map(clk => clk,
				rst => rst,
				D => s0,
				Q => s4
				);
	
	reg1 : register_Nbit
	generic map (8)
	port map(clk => clk,
				rst => rst,
				D => s1,
				Q => s5
				);
				
	reg2 : register_Nbit
	generic map (8)
	port map(clk => clk,
				rst => rst,
				D => s2,
				Q => s6
				);
	
	reg3 : register_Nbit
	generic map (8)
	port map(clk => clk,
				rst => rst,
				D => s3,
				Q => s7
				);
				

				
	s11 <= s5 when EN_0 = '1' else (others => '0'); --and wouldn't work?----------------!!!
	s10 <= s6 when EN_0 = '1' else (others => '0');
	s9 <= s7 when EN_0 = '1' else (others => '0');
	s8 <= s4 when EN_0 = '1' else (others => '0');
		
	
	
	reg0_PLS : parallel_load_shift_register
    port map( clk => clk,
				  rst => rst,
				  load => load_0,
				  parallel_in  => s7,
              serial_in => s7,
				  serial_out => s14
				  );
	reg1_PLS : parallel_load_shift_register
    port map( clk => clk,
				  rst => rst,
				  load => load_0,
				  parallel_in  => s6,
              serial_in => s14,
				  serial_out => s15
				  );
	reg2_PLS : parallel_load_shift_register
    port map( clk => clk,
				  rst => rst,
				  load => load_0,
				  parallel_in  => s5,
              serial_in => s15,
				  serial_out => A
				  );		
				  

	mux2 : mux2_8bit
	port map(A => A,
				B => s4,
				SEL => SEL_0,
				X => byte_out
				);

end Behavioral;

