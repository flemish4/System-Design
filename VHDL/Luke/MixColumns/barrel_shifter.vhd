----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    00:19:52 02/22/2018 
-- Design Name: 
-- Module Name:    barrel_shifter - Behavioral 
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
--library UNISIM;
--use UNISIM.VComponents.all;

entity barrel_shifter is
	 generic (SQUENCE : in natural := 7);
    Port ( clk, rst : in  STD_LOGIC;
           Q : out  STD_LOGIC);
end barrel_shifter;

architecture Behavioral of barrel_shifter is

--	component SRL16_8
--		port( Q		: out  STD_LOGIC_VECTOR (7 downto 0);
--				Q15 	: out  STD_LOGIC_VECTOR (7 downto 0);
--				A0 	: in  STD_LOGIC;
--				A1 	: in  STD_LOGIC;
--				A2 	: in  STD_LOGIC;
--				A3 	: in  STD_LOGIC;
--				CE 	: in  STD_LOGIC;
--				clk 	: in  STD_LOGIC;
--				D 		: in  STD_LOGIC_VECTOR (7 downto 0));
--		end component;

	signal temp: std_logic_vector(3 downto 0) := std_logic_vector(to_unsigned(SQUENCE, 4));

begin
 
-- 	adrs5: SRLC16E
--		generic map(
--			INIT => "0001000000000000")
--		port map(
--			Q		=> enable2,
--			Q15	=>	carry_5,
--			A0		=>	counter(0),
--			A1		=>	counter(1),
--			A2		=>	counter(2),
--			A3 	=>	counter(3),
--			CE		=>	ce,
--			clk 	=>	clk,
--			D 		=>	carry_5);
--
--	SRL16_X: SRL16_8
--		port map(
--			Q		=> Qx,
--			Q15	=>	Q15x,
--			A0		=>	address0,
--			A1		=>	address1,
--			A2		=>	address2,
--			A3 	=>	address3,
--			CE		=>	ce,
--			clk 	=>	clk,
  process (clk)
         begin
             if rising_edge(clk) then 
					if rst ='1' then
                   temp <= std_logic_vector(to_unsigned(SQUENCE, 4));
					else
                   temp <= temp(2 downto 0) & temp(3);   -- concatenation operator &
                  
					end if;
            end if;
    end process;

	Q <= temp(3);   -- MSB out

 
 
end Behavioral;

