--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   18:26:02 02/08/2018
-- Design Name:   
-- Module Name:   E:/OneDrive/PC Documents/Important/University/Year 4/EEE6225/System-Design/VHDL/William/keyGeneration/tb_ceGen.vhd
-- Project Name:  keyGeneration
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: CEGen
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
 
ENTITY tb_ceGen IS
END tb_ceGen;
 
ARCHITECTURE behavior OF tb_ceGen IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT CEGen
    PORT(
         keyInEn : IN  std_logic;
         stop : IN  std_logic;
         done : IN  std_logic;
         clk : IN  std_logic;
         ce : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal keyInEn : std_logic := '0';
   signal stop : std_logic := '0';
   signal done : std_logic := '0';
   signal clk : std_logic := '0';

 	--Outputs
   signal ce : std_logic;

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: CEGen PORT MAP (
          keyInEn => keyInEn,
          stop => stop,
          done => done,
          clk => clk,
          ce => ce
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
		keyInEn <= '1';
      wait for clk_period*16;
		keyInEn <= '0';
      wait for clk_period*16;
		stop <= '1';
      wait for clk_period*16;
		done <= '1';
		wait for clk_period;
		done <= '0';
		
		
		
		
      wait;
   end process;

END;
