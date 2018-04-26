--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   14:17:56 01/25/2018
-- Design Name:   
-- Module Name:   E:/OneDrive/PC Documents/Important/University/Year 4/EEE6225/Project/keyGeneration/tb_RCon_gen.vhd
-- Project Name:  keyGeneration
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: RCon_gen
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
 
ENTITY tb_RCon_gen IS
END tb_RCon_gen;
 
ARCHITECTURE behavior OF tb_RCon_gen IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT RCon_gen
    PORT(
         en : IN  std_logic;
         clk : IN  std_logic;
         rst : IN  std_logic;
         rcon : OUT  std_logic_vector(7 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal en : std_logic := '0';
   signal clk : std_logic := '0';
   signal rst : std_logic := '0';

 	--Outputs
   signal rcon : std_logic_vector(7 downto 0);

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: RCon_gen PORT MAP (
          en => en,
          clk => clk,
          rst => rst,
          rcon => rcon
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
		rst <= '1' ;
		wait for clk_period;
		rst <= '0' ;
		wait for 2* clk_period;
		
		for i in 0 to 20 loop
			en <= '1' ;
			wait for clk_period;
			en <= '0';
			wait for clk_period;
		end loop;
		
		
		rst <= '1' ;
		wait for clk_period;
		rst <= '0' ;
		wait for 2* clk_period;
		
		
		
      wait;
   end process;

END;
