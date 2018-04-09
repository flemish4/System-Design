library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

--  Uncomment the following lines to use the declarations that are
--  provided for instantiating Xilinx primitive components.
--library UNISIM;
--use UNISIM.VComponents.all;

------------------------------------------------------------------------
-- This module impliments the clock divider required to generate the
-- enable signal used to define the baud rate.  The required signal should
-- be within 1% of 16 * baud_rate.
-- Division starts from the main clock on the development board.
-- The formula is given below.
------------------------------------------------------------------------
-- Version: 1.01, Apr 2016
-- Written: T. Good, University of Sheffield
------------------------------------------------------------------------

entity uart_clock is
    Generic ( Clock_Frequency_Hz : integer );
    Port ( clk : in std_logic;
           en_16_x_baud : out std_logic);
end uart_clock;



architecture RTL of uart_clock is

	constant baud_rate_Hz : integer := 9600;
	constant baud_rate_x16_Hz : integer := 16 * baud_rate_Hz;
	constant divider_count : integer := Clock_Frequency_Hz / baud_rate_x16_Hz - 1;
	signal   baud_count : integer range 0 to divider_count := 0;

begin

  baud_timer: process(clk)
  begin
    if rising_edge(clk) then
      if baud_count=divider_count then
           baud_count <= 0;
         en_16_x_baud <= '1';
       else
           baud_count <= baud_count + 1;
         en_16_x_baud <= '0';
      end if;
    end if;
  end process baud_timer;

end RTL;
