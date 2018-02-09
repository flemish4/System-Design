----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    23:06:33 02/05/2018 
-- Design Name: 
-- Module Name:    pulse_extender - Behavioral 
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

entity pulse_extender is
	generic ( del : integer := 16 ) ;
    Port ( d : in  STD_LOGIC;
           q : out  STD_LOGIC;
           clk : in  STD_LOGIC;
           rst : in  STD_LOGIC);
end pulse_extender;

architecture Behavioral of pulse_extender is
component delay is
	generic ( del : integer := 2 ) ;
    Port ( D : in  STD_LOGIC;
           CLK : in  STD_LOGIC;
           Q : out  STD_LOGIC);
end component;

signal delOut : STD_LOGIC;
signal store : STD_LOGIC := '0';
begin

delay0 : delay
	generic map ( del => del)
    Port map (   D => D,
					  CLK => CLK,
					  q => delOut);

	process (clk) begin
		if rising_edge(clk) then
			if d = '1' then
				store <= '1';
			elsif rst = '1' or delOut = '1' then
				store <= '0';
			else
				store <= store;
			end if;
		end if;
	end process;

	q <= d or store;

end Behavioral;

