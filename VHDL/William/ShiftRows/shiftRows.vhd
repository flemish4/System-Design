----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    13:13:05 02/22/2018 
-- Design Name: 
-- Module Name:    shiftRows - Behavioral 
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

entity shiftRows is
    Port ( dataIn : in  STD_LOGIC_VECTOR (7 downto 0);
          clk : in  STD_LOGIC;
          ce : in  STD_LOGIC;
           dataOut : out  STD_LOGIC_VECTOR (7 downto 0));
end shiftRows;

architecture Behavioral of shiftRows is
component srl16_8 is
    Port ( D : in  STD_LOGIC_VECTOR (7 downto 0);
           CE : in  STD_LOGIC;
           CLK : in  STD_LOGIC;
           Addr : in  STD_LOGIC_VECTOR (3 downto 0);
           Q : out  STD_LOGIC_VECTOR (7 downto 0);
           Q15 : out  STD_LOGIC_VECTOR (7 downto 0));
end component;

constant A0 : STD_LOGIC := '1';
constant A1 : STD_LOGIC := '1';
signal   A2 : STD_LOGIC;
signal   A3 : STD_LOGIC;
signal   A4 : STD_LOGIC;
signal   A5 : STD_LOGIC;
signal   addr : STD_LOGIC_VECTOR (3 downto 0);
signal   mux0Out : STD_LOGIC_VECTOR (7 downto 0);
signal   r0Q : STD_LOGIC_VECTOR (7 downto 0);
signal   r0Q15 : STD_LOGIC_VECTOR (7 downto 0);
signal   r1Q : STD_LOGIC_VECTOR (7 downto 0);


begin


r0 : srl16_8 
    Port map( D => dataIn,
           CE => ce,
           CLK => clk,
           Addr => addr,
           Q => r0Q,
			  Q15 => r0Q15
			  );
			  
r1 : srl16_8 
    Port map( D => r0Q15,
           CE => ce,
           CLK => clk,
           Addr => addr,
           Q => r1Q
           --Q15 => r1Q15
			  );
			  
			  
genA2 : SRLC16E 
		generic map(
			INIT => "0101010101010101")
    Port map( D => A2,
           CE => ce,
           CLK => clk,
           A0 => '0',
           A1 => '0',
           A2 => '0',
           A3 => '0',
           Q15 => A2
			  );				  
genA3 : SRLC16E 
		generic map(
			INIT => "1001100110011001")
    Port map( D =>  A3,
           CE => ce,
           CLK => clk,
           A0 => '0',
           A1 => '0',
           A2 => '0',
           A3 => '0',
           Q15 => A3
			  );				  
genA4 : SRLC16E 
		generic map(
			INIT => "0000001001100000")
    Port map( D => A4,
           CE => ce,
           CLK => clk,
           A0 => '0',
           A1 => '0',
           A2 => '0',
           A3 => '0',
           Q15 => A4
			  );				  
genA5 : SRLC16E 
		generic map(
			INIT => "0000000000000001")
    Port map( D =>  A5,
           CE => ce,
           CLK => clk,
           A0 => '0',
           A1 => '0',
           A2 => '0',
           A3 => '0',
           Q15 => A5
			  );			  

addr <= A3 & A2 & A1 & A0;
mux0Out <= r0Q when A4 = '0' else
			  r1Q;
dataOut <= mux0Out when A5 = '0' else
			  dataIn;
end Behavioral;

