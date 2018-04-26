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
-- a parallel word 128 bits long. The loading of the input is controlled
-- by the ld_word enable signal and occurs on the rising edge of the next clk.
-- The output is presented 4-bits at a time starting with the most significant
-- digits.  The shifting through the output bits is controlled by the
-- shift_nibble enable signal and occurs on the next rising edge of clk.
------------------------------------------------------------------------
-- Version: 1.01, Apr 2016
-- Written: T. Good, University of Sheffield
------------------------------------------------------------------------

entity sreg_nibble_out is
    Port ( rst,clk : in std_logic;
           D : in std_logic_vector(127 downto 0);
           Q : out std_logic_vector(3 downto 0);
           shift_nibble,ld_word : in std_logic);
end sreg_nibble_out;

architecture RTL of sreg_nibble_out is

	signal store : std_logic_vector(127 downto 0);

begin
	
	process (clk) begin
	   if rising_edge(clk) then
			if rst = '1' then 
				store <= (others => '0'); 
			elsif ld_word = '1' then 
				store <= D; 
			elsif shift_nibble = '1' then 
	         store <= store(123 downto 0) & "0000";
      	end if;
   	end if;
	end process;

 	Q <= store (127 downto 124);

end RTL;
