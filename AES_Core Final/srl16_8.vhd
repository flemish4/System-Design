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
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
library UNISIM;
use UNISIM.VComponents.all;

entity srl16_8 is
    Port ( D : in  STD_LOGIC_VECTOR (7 downto 0);
           CE : in  STD_LOGIC;
           CLK : in  STD_LOGIC;
           Addr : in  STD_LOGIC_VECTOR (3 downto 0);
           Q : out  STD_LOGIC_VECTOR (7 downto 0);
           Q15 : out  STD_LOGIC_VECTOR (7 downto 0));
end srl16_8;

architecture Behavioral of srl16_8 is

begin
	 GEN_SRLS:
	 for i in 0 to 7 generate
		SRLC16E_inst : SRLC16E
		generic map (
			INIT => X"0000")
		port map (
			Q => Q(i), -- SRL data output
			Q15 => Q15(i), -- Carry output (connect to next SRL)
			A0 => Addr(0), -- Select[0] input
			A1 => Addr(1), -- Select[1] input
			A2 => Addr(2), -- Select[2] input
			A3 => Addr(3), -- Select[3] input
			CE => CE, -- Clock enable input
			CLK => CLK, -- Clock input
			D => D(i) -- SRL data input
		);
	end generate GEN_SRLS;


end Behavioral;

