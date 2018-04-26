----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    10:50:25 01/24/2018 
-- Design Name: 
-- Module Name:    srl16_8 - Behavioral 
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
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
library UNISIM;
use UNISIM.VComponents.all;

entity delay is
	generic ( del : integer := 2 ) ;
    Port ( D : in  STD_LOGIC;
           CLK : in  STD_LOGIC;
           Q : out  STD_LOGIC);
end delay;

architecture Behavioral of delay is
constant Addr :  STD_LOGIC_VECTOR (3 downto 0) := std_logic_vector(to_unsigned(del - 1, 4));

begin
	SRLC16_inst : SRLC16
	generic map (
		INIT => X"0000")
	port map (
		Q => Q, -- SRL data output
		A0 => Addr(0), -- Select[0] input
		A1 => Addr(1), -- Select[1] input
		A2 => Addr(2), -- Select[2] input
		A3 => Addr(3), -- Select[3] input 
		CLK => CLK, -- Clock input
		D => D -- SRL data input
	);
end Behavioral;

