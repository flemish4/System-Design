--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   02:50:40 02/22/2018
-- Design Name:   
-- Module Name:   C:/Users/lukel/Desktop/Uni/Fourth Year/system design/VHDL/MixColumns/tb_barrel_shifter.vhd
-- Project Name:  MixColumns
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: barrel_shifter
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
 
ENTITY tb_barrel_shifter IS
END tb_barrel_shifter;
 
ARCHITECTURE behavior OF tb_barrel_shifter IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT barrel_shifter
    PORT(
         clk : IN  std_logic;
         rst : IN  std_logic;
         EN : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal clk : std_logic := '0';
   signal rst : std_logic := '0';

 	--Outputs
   signal EN : std_logic;

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: barrel_shifter PORT MAP (
          clk => clk,
          rst => rst,
          EN => EN
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
		--rst <= '1';
		--wait for clk_period;
		--rst <= '0';
      wait;
   end process;

END;
