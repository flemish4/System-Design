----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    22:28:48 02/05/2018 
-- Design Name: 
-- Module Name:    counter_srl - Behavioral 
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

entity counter_srl is
	generic ( endVal : integer := 10);
    Port ( ce : in  STD_LOGIC;
           clk : in  STD_LOGIC;
           q : out  STD_LOGIC);
end counter_srl;

architecture Behavioral of counter_srl is
constant Addr : std_logic_vector (3 downto 0) := std_logic_vector(to_unsigned(endVal - 1, 4));
signal d : std_logic;
signal running : std_logic := '0';
signal output : std_logic;
signal srlCE : std_logic;
begin
	process (clk) begin
		if rising_edge(clk) then
			if ce = '1' and running = '0' then
				running <= '1';
			elsif output = '1' then
				running <= '0';
			else
				running <= running;
			end if;
		end if;
	end process;
	
		SRLC16E_inst : SRLC16E
		generic map (
			INIT => X"0000")
		port map (
			Q => output, -- SRL data output
			--Q15 => Q15(i), -- Carry output (connect to next SRL)
			A0 => Addr(0), -- Select[0] input
			A1 => Addr(1), -- Select[1] input
			A2 => Addr(2), -- Select[2] input
			A3 => Addr(3), -- Select[3] input
			CE => srlCE, -- Clock enable input
			CLK => CLK, -- Clock input
			D => d -- SRL data input
		);

	d <= '1' when ce = '1' and running = '0' else
			'0';
	srlCE <= CE or output;
	q <= output;
end Behavioral;

