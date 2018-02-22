----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    00:27:57 02/22/2018 
-- Design Name: 
-- Module Name:    srl16 - Behavioral 
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

entity srl16_8 is
Port ( Q : out  STD_LOGIC_VECTOR (7 downto 0);
           Q15 : out  STD_LOGIC_VECTOR (7 downto 0);
           A0 : in  STD_LOGIC;
           A1 : in  STD_LOGIC;
           A2 : in  STD_LOGIC;
           A3 : in  STD_LOGIC;
           CE : in  STD_LOGIC;
           clk : in  STD_LOGIC;
           D : in  STD_LOGIC_VECTOR (7 downto 0));
end srl16_8;

architecture Behavioral of srl16_8 is
begin
		SRL16_X0: SRLC16E
		generic map(
			INIT => "0000000000000000")
		port map(
			Q		=> Q(0),
			Q15	=>	Q15(0),
			A0		=>	A0,
			A1		=>	A1,
			A2		=>	A2,
			A3 	=>	A3,
			CE		=>	ce,
			clk 	=>	clk,
			D 		=>	D(0));
			
	SRL16_X1: SRLC16E
		generic map(
			INIT => "0000000000000000")
		port map(
			Q		=> Q(1),
			Q15	=>	Q15(1),
			A0		=>	A0,
			A1		=>	A1,
			A2		=>	A2,
			A3 	=>	A3,
			CE		=>	ce,
			clk 	=>	clk,
			D 		=>	D(1));
			
	SRL16_X2: SRLC16E
		generic map(
			INIT => "0000000000000000")
		port map(
			Q		=> Q(2),
			Q15	=>	Q15(2),
			A0		=>	A0,
			A1		=>	A1,
			A2		=>	A2,
			A3 	=>	A3,
			CE		=>	ce,
			clk 	=>	clk,
			D 		=>	D(2));
			
	SRL16_X3: SRLC16E
		generic map(
			INIT => "0000000000000000")
		port map(
			Q		=> Q(3),
			Q15	=>	Q15(3),
			A0		=>	A0,
			A1		=>	A1,
			A2		=>	A2,
			A3 	=>	A3,
			CE		=>	ce,
			clk 	=>	clk,
			D 		=>	D(3));
			
	SRL16_X4: SRLC16E
		generic map(
			INIT => "0000000000000000")
		port map(
			Q		=> Q(4),
			Q15	=>	Q15(4),
			A0		=>	A0,
			A1		=>	A1,
			A2		=>	A2,
			A3 	=>	A3,
			CE		=>	ce,
			clk 	=>	clk,
			D 		=>	D(4));
			
	SRL16_X5: SRLC16E
		generic map(
			INIT => "0000000000000000")
		port map(
			Q		=> Q(5),
			Q15	=>	Q15(5),
			A0		=>	A0,
			A1		=>	A1,
			A2		=>	A2,
			A3 	=>	A3,
			CE		=>	ce,
			clk 	=>	clk,
			D 		=>	D(5));
			
	SRL16_X6: SRLC16E
		generic map(
			INIT => "0000000000000000")
		port map(
			Q		=> Q(6),
			Q15	=>	Q15(6),
			A0		=>	A0,
			A1		=>	A1,
			A2		=>	A2,
			A3 	=>	A3,
			CE		=>	ce,
			clk 	=>	clk,
			D 		=>	D(6));
			
	SRL16_X7: SRLC16E
		generic map(
			INIT => "0000000000000000")
		port map(
			Q		=> Q(7),
			Q15	=>	Q15(7),
			A0		=>	A0,
			A1		=>	A1,
			A2		=>	A2,
			A3 	=>	A3,
			CE		=>	ce,
			clk 	=>	clk,
			D 		=>	D(7));
			

end Behavioral;

