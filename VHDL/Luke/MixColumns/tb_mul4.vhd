--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   04:34:53 03/02/2018
-- Design Name:   
-- Module Name:   C:/Users/lukel/Desktop/Uni/Fourth Year/system design/VHDL/MixColumns/tb_mul4.vhd
-- Project Name:  MixColumns
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: mul4
-- 
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes: 
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends
-- that these types always be used for the top-level I/O of a design in order
-- to guarantee that the testbench will bind correctly to the post-implementation 
-- simulation model.
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
USE ieee.numeric_std.ALL;
 
ENTITY tb_mul4 IS
END tb_mul4;
 
ARCHITECTURE behavior OF tb_mul4 IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT mul4
    PORT(
         x : IN  std_logic_vector(7 downto 0);
         x4 : OUT  std_logic_vector(7 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal x : std_logic_vector(7 downto 0) := (others => '0');

 	--Outputs
   signal x4 : std_logic_vector(7 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
--   constant <clock>_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: mul4 PORT MAP (
          x => x,
          x4 => x4
        );

   -- Clock process definitions
--   <clock>_process :process
--   begin
--		<clock> <= '0';
--		wait for <clock>_period/2;
--		<clock> <= '1';
--		wait for <clock>_period/2;
--   end process;


   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	

--      wait for <clock>_period*10;

      -- insert stimulus here 
		for i in 0 to 255 loop

			x <= std_logic_vector(to_unsigned(i, 8));
			wait for 10 ns;
		end loop;
      wait;
   end process;

END;
