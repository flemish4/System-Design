--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   21:03:03 02/07/2018
-- Design Name:   
-- Module Name:   E:/OneDrive/PC Documents/Important/University/Year 4/EEE6225/System-Design/VHDL/William/keyGeneration/tb_keyGenController_v3.vhd
-- Project Name:  keyGeneration
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: keyGenController_v3
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
 
ENTITY tb_keyGenController_v3 IS
END tb_keyGenController_v3;
 
ARCHITECTURE behavior OF tb_keyGenController_v3 IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT keyGenController_v3
    PORT(
         ce : IN  std_logic;
         inv : IN  std_logic;
         clk : IN  std_logic;
         done : OUT  std_logic;
         addrEnable : OUT  std_logic;
         RConEn : OUT  std_logic;
         RConSel : OUT  std_logic;
         FRowSel : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal ce : std_logic := '0';
   signal inv : std_logic := '0';
   signal clk : std_logic := '0';

 	--Outputs
   signal done : std_logic;
   signal addrEnable : std_logic;
   signal RConEn : std_logic;
   signal RConSel : std_logic;
   signal FRowSel : std_logic;

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: keyGenController_v3 PORT MAP (
          ce => ce,
          done => done,
          inv => inv,
          clk => clk,
          addrEnable => addrEnable,
          RConEn => RConEn,
          RConSel => RConSel,
          FRowSel => FRowSel
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
		ce <= '1';
      wait for clk_period*32;
		inv <= '1';
      wait for clk_period*32;
		
		
      wait;
   end process;

END;
