--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   11:46:48 03/12/2018
-- Design Name:   
-- Module Name:   E:/OneDrive/PC Documents/Important/University/Year 4/EEE6225/System-Design/VHDL/William/keyGeneration/tb_RCon_gen2.vhd
-- Project Name:  keyGeneration
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: RCon_gen2
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
 
ENTITY tb_RCon_gen2 IS
END tb_RCon_gen2;
 
ARCHITECTURE behavior OF tb_RCon_gen2 IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT RCon_gen2
    PORT(
         roundCounter : IN  std_logic_vector(3 downto 0);
         RCon : OUT  std_logic_vector(7 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal roundCounter : std_logic_vector(3 downto 0) := (others => '0');

 	--Outputs
   signal RCon : std_logic_vector(7 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
   constant clock_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: RCon_gen2 PORT MAP (
          roundCounter => roundCounter,
          RCon => RCon
        );

 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	

      wait for clock_period*10;

      -- insert stimulus here 
		for i in 0 to 16 loop
			roundCounter <= std_logic_vector(to_unsigned(i, 4));
			wait for clock_period;
		
		end loop;
      wait;
   end process;

END;
