--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   11:25:24 01/24/2018
-- Design Name:   
-- Module Name:   E:/OneDrive/PC Documents/Important/University/Year 4/EEE6225/Project/keyGeneration/tb_SUBBYTES.vhd
-- Project Name:  keyGeneration
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: SUBBYTES
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
 
ENTITY tb_SUBBYTES IS
END tb_SUBBYTES;
 
ARCHITECTURE behavior OF tb_SUBBYTES IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT SUBBYTES
    PORT(
         CLK : IN  std_logic;
         RESET : IN  std_logic;
         XIN : IN  std_logic_vector(7 downto 0);
         INV : IN  std_logic;
         YOUT : OUT  std_logic_vector(7 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal CLK : std_logic := '0';
   signal RESET : std_logic := '0';
   signal XIN : std_logic_vector(7 downto 0) := (others => '0');
   signal INV : std_logic := '0';

 	--Outputs
   signal YOUT : std_logic_vector(7 downto 0);

   -- Clock period definitions
   constant CLK_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: SUBBYTES PORT MAP (
          CLK => CLK,
          RESET => RESET,
          XIN => XIN,
          INV => INV,
          YOUT => YOUT
        );

   -- Clock process definitions
   CLK_process :process
   begin
		CLK <= '0';
		wait for CLK_period/2;
		CLK <= '1';
		wait for CLK_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	

      wait for CLK_period*10;

      -- insert stimulus here 
		for i in 0 to 511 loop
			XIN <= std_logic_vector(to_unsigned(i, XIN'length));
			wait for CLK_period;
		
		end loop;
      wait;
   end process;

END;
