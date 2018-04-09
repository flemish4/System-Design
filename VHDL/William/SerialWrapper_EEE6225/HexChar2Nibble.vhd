library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

--  Uncomment the following lines to use the declarations that are
--  provided for instantiating Xilinx primitive components.
--library UNISIM;
--use UNISIM.VComponents.all;

------------------------------------------------------------------------
-- This module converts an ASCII character representing a hexadecimal
-- number ("0123456789ABCDEF") into its 4-bit binary equivalent.
-- If the input character was in the above list valid is set.
------------------------------------------------------------------------
-- Version: 1.01, Apr 2016
-- Written: T. Good, University of Sheffield
------------------------------------------------------------------------

entity HexChar2Nibble is
    Port ( D : in std_logic_vector(7 downto 0);
           Q : out std_logic_vector(3 downto 0);
			  valid : out std_logic);
end HexChar2Nibble;


architecture RTL of HexChar2Nibble is

begin

	process (D) begin

		valid <= '1';

		case D is
			when X"30" => Q <=X"0";
			when X"31" => Q <=X"1";
			when X"32" => Q <=X"2";
			when X"33" => Q <=X"3";
			when X"34" => Q <=X"4";
			when X"35" => Q <=X"5";
			when X"36" => Q <=X"6";
			when X"37" => Q <=X"7";
			when X"38" => Q <=X"8";
			when X"39" => Q <=X"9";
			when X"41" => Q <=X"A";
			when X"42" => Q <=X"B";
			when X"43" => Q <=X"C";
			when X"44" => Q <=X"D";
			when X"45" => Q <=X"E";
			when X"46" => Q <=X"F";
			when others => Q <=X"0"; valid <= '0';
		end case;
	end process;

end RTL;
