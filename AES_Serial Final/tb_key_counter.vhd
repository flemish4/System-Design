--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   10:45:22 01/25/2018
-- Design Name:   
-- Module Name:   E:/OneDrive/PC Documents/Important/University/Year 4/EEE6225/Project/keyGeneration/tb_key_counter.vhd
-- Project Name:  keyGeneration
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: key_counter_v2
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
--USE ieee.numeric_std.ALL;
 
ENTITY tb_key_counter IS
END tb_key_counter;
 
ARCHITECTURE behavior OF tb_key_counter IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT key_counter_v2
    PORT(
         rst : IN  std_logic;
         start : IN  std_logic;
         clk : IN  std_logic;
         SRLEnable : OUT  std_logic;
         addrEnable : OUT  std_logic;
         runAll : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal rst : std_logic := '0';
   signal start : std_logic := '0';
   signal clk : std_logic := '0';

 	--Outputs
   signal SRLEnable : std_logic;
   signal addrEnable : std_logic;
   signal runAll : std_logic;

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: key_counter_v2 PORT MAP (
          rst => rst,
          start => start,
          clk => clk,
          SRLEnable => SRLEnable,
          addrEnable => addrEnable,
          runAll => runAll
        );

   -- Clock process definitions
   clk_process :process
   begin
		clk <= '0';
		wait for clk_period/2;
		clk <= '1';
		wait for clk_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	

      wait for clk_period*10;

      -- insert stimulus here
		start <= '1';
		wait for clk_period;
		start <= '0';
		wait for 100ns; 

      wait;
   end process;

END;
