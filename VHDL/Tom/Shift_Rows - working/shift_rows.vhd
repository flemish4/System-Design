----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    15:31:12 12/14/2017 
-- Design Name: 
-- Module Name:    shift_rows - Behavioral 
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
library UNISIM;
use UNISIM.VComponents.all;

entity shift_rows is
    Port ( bits_in 	: in  	STD_LOGIC_VECTOR (7 downto 0);
           bits_out	: out  	STD_LOGIC_VECTOR (7 downto 0);
			  ce			: in		STD_LOGIC;
           clk			: in  	STD_LOGIC;
           reset 		: in  	STD_LOGIC;
			  inv 		: in		STD_LOGIC);
end shift_rows;

architecture Behavioral of shift_rows is

-----------components-------------------

	component count is
    Port ( clk 		: in  STD_LOGIC;
           reset 		: in  STD_LOGIC;
           ce 			: in  STD_LOGIC;
           counter	: out  STD_LOGIC);
	end component;

	component MUX2to1
		port( En : in STD_LOGIC;
				X0 : in STD_LOGIC_VECTOR (7 downto 0);
				X1	: in STD_LOGIC_VECTOR (7 downto 0);
				Q	: out STD_LOGIC_VECTOR (7 downto 0));
	end component;
	
	component SRL16_8
		port( Q		: out  STD_LOGIC_VECTOR (7 downto 0);
				Q15 	: out  STD_LOGIC_VECTOR (7 downto 0);
				addr 	: in  STD_LOGIC_VECTOR (3 downto 0);
				CE 	: in  STD_LOGIC;
				clk 	: in  STD_LOGIC;
				D 		: in  STD_LOGIC_VECTOR (7 downto 0));
		end component;
		
-----------signals----------------------

	signal counter		:STD_LOGIC;
	
	signal address 	:STD_LOGIC_VECTOR (3 downto 0);
	signal address0	:STD_LOGIC;
	signal address1	:STD_LOGIC;
	signal address2	:STD_LOGIC;
	signal address3	:STD_LOGIC;
		signal adrs3Q		:STD_LOGIC;
		signal adrs3Q15	:STD_LOGIC;
	signal address4	:STD_LOGIC;
		signal adrs4Qi		:STD_LOGIC;
		signal adrs4Q15	:STD_LOGIC;
		signal adrs4Q15i	:STD_LOGIC;
	signal address5	:STD_LOGIC;
		signal adrs5Q		:STD_LOGIC;
		signal adrs5Q15	:STD_LOGIC;

	signal Q15x			:STD_LOGIC_VECTOR (7 downto 0);
	signal Qx			:STD_LOGIC_VECTOR (7 downto 0);
	signal Q15y			:STD_LOGIC_VECTOR (7 downto 0);
	signal Qy			:STD_LOGIC_VECTOR (7 downto 0);
	signal M1			:STD_LOGIC_VECTOR (7 downto 0);

----------structure---------------------

begin

	count_8bit: count
		port map( 	clk		=>	clk,
						reset		=>	reset,
						ce			=>	ce,
						counter 	=> counter);

	address0 <= '1';
	address1 <= '1';
	address2 <= counter;
	
	adrs3: SRLC16E
		generic map(
			INIT => "1001100110011001")
		port map(
			Q		=> adrs3Q,
			Q15	=> adrs3Q15,
			A0		=>	'0',
			A1		=>	'0',
			A2		=>	'0',
			A3 	=>	'0',
			CE		=>	ce,
			clk 	=>	clk,
			D 		=>	adrs3Q15);

	address3 <= adrs3Q15 when inv = '0'
	else adrs3Q;

	adrs4: SRLC16E
		generic map(
			INIT => "0000001001100000")
		port map(
			Q15	=> adrs4Q15,
			A0		=>	'1',
			A1		=>	'1',
			A2		=>	'1',
			A3 	=>	'1',
			CE		=>	ce,
			clk 	=>	clk,
			D 		=>	adrs4Q15);
					
	adrs4i: SRLC16E
		generic map(
			INIT => "0000001000110000")
		port map(
			Q		=> adrs4Qi,
			Q15	=> adrs4Q15i,
			A0		=>	'1',
			A1		=>	'1',
			A2		=>	'1',
			A3 	=>	'1',
			CE		=>	ce,
			clk 	=>	clk,
			D 		=>	adrs4Q15i);

	address4 <= adrs4Q15 when inv = '0'
	else adrs4Qi;

	adrs5: SRLC16E
		generic map(
			INIT => "0000000000000001")
		port map(
			Q		=> adrs5Q,
			Q15	=> adrs5Q15,
			A0		=>	'1',
			A1		=>	'0',
			A2		=>	'1',
			A3 	=>	'1',
			CE		=>	ce,
			clk 	=>	clk,
			D 		=>	adrs5Q15);
			
	address5 <= adrs5Q15 when inv = '0'
	else adrs5Q;

	SRL16_X: SRL16_8
		port map(
			Q		=> Qx,
			Q15	=>	Q15x,
			addr	=>	address,
			CE		=>	ce,
			clk 	=>	clk,
			D 		=>	bits_in);
			
	SRL16_Y: SRL16_8
		port map(
			Q		=> Qy,
			Q15	=>	Q15y,
			addr	=>	address,
			CE		=>	ce,
			clk 	=>	clk,
			D 		=>	Q15x);
		
	MUX_1: MUX2to1
		port map(	En => address4,
						X0 => Qx,
						X1	=> Qy,
						Q	=>	M1);
						
	MUX_2: MUX2to1
		port map(	En => address5,
						X0 => M1,
						X1	=> bits_in,
						Q	=>	bits_out);

	address(0) <= address0;
	address(1) <= address1;
	address(2) <= address2;
	address(3) <= address3;
end Behavioral;

