----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    14:22:55 03/09/2018 
-- Design Name: 
-- Module Name:    datapath - Behavioral 
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

entity datapath is
    Port ( data : in  STD_LOGIC_VECTOR (7 downto 0);
           key0 : in  STD_LOGIC_VECTOR (7 downto 0);
           key1 : in  STD_LOGIC_VECTOR (7 downto 0);
           s0 : in  STD_LOGIC;
           s1 : in  STD_LOGIC;
           adrs : in  STD_LOGIC_VECTOR (3 downto 0);
           shft_r_en : in  STD_LOGIC;
           inv_en : in  STD_LOGIC;
           mx_clmn_en : in  STD_LOGIC;
           q : out  STD_LOGIC_VECTOR (7 downto 0);
           mx_clmn_signl : out  STD_LOGIC;
           clk : in  STD_LOGIC;
           clk_en : in  STD_LOGIC;
           reset : in  STD_LOGIC);
end datapath;

architecture Behavioral of datapath is
-- Defeine all the components to be used
	component subbytes_ppd is
    Port ( d : in  STD_LOGIC_VECTOR (7 downto 0);
           q : out  STD_LOGIC_VECTOR (7 downto 0);
           s : in  STD_LOGIC;
           clk : in  STD_LOGIC;
           reset : in  STD_LOGIC);
end component;

	component shift_rows is
    Port ( bits_in 	: in  	STD_LOGIC_VECTOR (7 downto 0);
           bits_out	: out  	STD_LOGIC_VECTOR (7 downto 0);
			  ce			: in		STD_LOGIC;
           clk			: in  	STD_LOGIC;
           reset 		: in  	STD_LOGIC;
			  inv 		: in		STD_LOGIC);
end component; 
	
	component MixColumns_Top is
    Port ( clk,rst,inv,CE,round10 : in  STD_LOGIC;
			  load_count : out  STD_LOGIC;
           byte_in : in  STD_LOGIC_VECTOR (7 downto 0);
           byte_out : out  STD_LOGIC_VECTOR (7 downto 0));
end component;


	component srl16_8 is
		Port ( Q : out  STD_LOGIC_VECTOR (7 downto 0);
           Q15 : out  STD_LOGIC_VECTOR (7 downto 0);
           A0 : in  STD_LOGIC;
           A1 : in  STD_LOGIC;
           A2 : in  STD_LOGIC;
           A3 : in  STD_LOGIC;
           CE : in  STD_LOGIC;
           clk : in  STD_LOGIC;
           D : in  STD_LOGIC_VECTOR (7 downto 0));
end component;

	--Define the signals to be used in the system
	signal X_1 : STD_LOGIC_VECTOR (7 downto 0); --output of the data xor key
	signal mu_1 : STD_LOGIC_VECTOR (7 downto 0); -- output from the first multiplexer
	signal s_b : STD_LOGIC_VECTOR (7 downto 0); -- output from the subbytes block
	signal buff_1 : STD_LOGIC_VECTOR (7 downto 0); -- output from the first buffer
	signal s_r : STD_LOGIC_VECTOR (7 downto 0); -- output from the shift row block
	signal m_c : STD_LOGIC_VECTOR (7 downto 0); -- output from the mix columns block
	signal x_2 : STD_LOGIC_VECTOR (7 downto 0); -- output from m_c xor key which is fed back into the first multiplexer
	
begin
	--data xor key
	x_1 <= key0 xor data; 
	
	--implement the first multiplexer
	mu_1 <= x_2 when (s0= '0' )
	else 
	  x_1;
	  
	-- Feed the output to the subbytes block
	sub_b : subbytes_ppd
			Port map( d => mu_1,
				  q => s_b,
				  s => inv_en,
				  clk => clk,
				  reset =>reset );
				  
	-- insert a buffer here 
	b_uffer : srl16_8
			Port map( Q  => buff_1,
				  A0 => adrs(0),
				  A1 => adrs(1),
				  A2 => adrs(2),
				  A3 => adrs(3),
				  ce => clk_en,
				  clk => clk,
				  d => s_b );
	
	-- Perform the shift rows operation 
	shft_rw : shift_rows
			Port map( bits_in  => buff_1,
				  bits_out => s_r,
				  ce => shft_r_en,
				  inv  => inv_en,
				  clk => clk,
				  reset =>reset );
				  
	-- Perform the mix column operation 
	mx_clmns : MixColumns_Top
			Port map( byte_in  => s_r,
				  byte_out => m_c,
				  ce => mx_clmn_en,
				  round10 => s1,
				  inverse  => inv_en,
				  clk => clk,
				  rst =>reset );
				  
	--mic columns output xor key
	x_2 <= key1 xor m_c; 
	
	--set the output 
	q <= x_2; 
			

end Behavioral;

