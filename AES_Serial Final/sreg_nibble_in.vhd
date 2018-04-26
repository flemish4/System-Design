library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

--  Uncomment the following lines to use the declarations that are
--  provided for instantiating Xilinx primitive components.
--library UNISIM;
--use UNISIM.VComponents.all;

------------------------------------------------------------------------
-- This module impliments a version of a shift register which accepts
-- 4 bits of input at a time and left shifts by 4, latching the result.
-- The loading and shifting of the input is controlled by the shift_nibble
-- enable signal and occurs on the rising edge of the next clk.
-- The output is presented as a 128-bit parallel word.
------------------------------------------------------------------------
-- Version: 1.01, Apr 2016
-- Written: T. Good, University of Sheffield
------------------------------------------------------------------------

entity sreg_nibble_in is
    Port ( rst,clk : in std_logic;
           D : in std_logic_vector(3 downto 0);
           Q : out std_logic_vector(127 downto 0);
           shift_nibble : in std_logic);
end sreg_nibble_in;

architecture RTL of sreg_nibble_in is

	signal store : std_logic_vector(127 downto 0);

begin

	process (clk) begin
	   if rising_edge(clk) then  
			if rst = '1' then 
				store <= (others => '0'); 
			elsif shift_nibble = '1' then 
         	store <= store(127-4 downto 0) & D;
      	end if;
   	end if;
	end process;
	Q <= store;	
	
end RTL;
