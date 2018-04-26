library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

--  Uncomment the following lines to use the declarations that are
--  provided for instantiating Xilinx primitive components.
--library UNISIM;
--use UNISIM.VComponents.all;

------------------------------------------------------------------------
-- This module converts a 4-bit binary value in to the corresponding
-- ASCII character representing a hexadecimal digit ("0123456789ABCDEF")
------------------------------------------------------------------------
-- Version: 1.01, Apr 2016
-- Written: T. Good, University of Sheffield
------------------------------------------------------------------------


entity Nibble2HexChar is
    Port ( D : in std_logic_vector(3 downto 0);
           Q : out std_logic_vector(7 downto 0));
end Nibble2HexChar;

architecture RTL of Nibble2HexChar is

begin
   process (D) begin
		case D is
			when X"0" => Q <=X"30";
			when X"1" => Q <=X"31";
			when X"2" => Q <=X"32";
			when X"3" => Q <=X"33";
			when X"4" => Q <=X"34";
			when X"5" => Q <=X"35";
			when X"6" => Q <=X"36";
			when X"7" => Q <=X"37";
			when X"8" => Q <=X"38";
			when X"9" => Q <=X"39";
			when X"A" => Q <=X"41";
			when X"B" => Q <=X"42";
			when X"C" => Q <=X"43";
			when X"D" => Q <=X"44";
			when X"E" => Q <=X"45";
			when X"F" => Q <=X"46";
			when others => null;
		end case;
	end process;

end RTL;
