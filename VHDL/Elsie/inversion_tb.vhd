--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   14:49:27 02/09/2018
-- Design Name:   
-- Module Name:   C:/Users/Elsie/Documents/Word Docs/Uni Stuff/Fouth year/6225 system design/VHDL/subbytes/inversion_tb.vhd
-- Project Name:  Subbytes
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: inversion
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
--arithmetic functions with Signed or Unsigned values
USE ieee.numeric_std.ALL;
 
ENTITY inversion_tb IS
END inversion_tb;
 
ARCHITECTURE behavior OF inversion_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT inversion
    PORT(
         d : IN  std_logic_vector(3 downto 0);
         q : OUT  std_logic_vector(3 downto 0);
         clk : IN  std_logic;
         reset : IN  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal d : std_logic_vector(3 downto 0) := (others => '0');
   signal clk : std_logic := '0';
   signal reset : std_logic := '0';
	signal i : std_logic := '0';

 	--Outputs
   signal q : std_logic_vector(3 downto 0);

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: inversion PORT MAP (
          d => d,
          q => q,
          clk => clk,
          reset => reset
        );

   -- Clock process definitions
   clk_process :process
   begin
		clk <= '1';
		wait for clk_period/2;
		clk <= '0';
		wait for clk_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
       -- insert stimulus here 
		-- apply a reset pulse 
		 reset <= '1';
		wait for clk_period;
		reset <= '0';
		wait for clk_period;
		-- apply the inputs to the system 
		
		for i in 0 to 15 loop
			d <= std_logic_vector(to_unsigned(i, 4));
			wait for clk_period;
		end loop;  

      wait;
   end process;

END;
