--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   18:35:01 02/22/2018
-- Design Name:   
-- Module Name:   E:/OneDrive/PC Documents/Important/University/Year 4/EEE6225/System-Design/VHDL/William/Test/tb_test.vhd
-- Project Name:  Test
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: parallel_load_shift_register
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
 
ENTITY tb_test IS
END tb_test;
 
ARCHITECTURE behavior OF tb_test IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT parallel_load_shift_register
    PORT(
         clk : IN  std_logic;
         rst : IN  std_logic;
         load : IN  std_logic;
         parallel_in : IN  std_logic_vector(7 downto 0);
         serial_in : IN  std_logic_vector(7 downto 0);
         serial_out : OUT  std_logic_vector(7 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal clk : std_logic := '0';
   signal rst : std_logic := '0';
   signal load : std_logic := '0';
   signal parallel_in : std_logic_vector(7 downto 0) := (others => '0');
   signal serial_in : std_logic_vector(7 downto 0) := (others => '0');

 	--Outputs
   signal serial_out : std_logic_vector(7 downto 0);

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: parallel_load_shift_register PORT MAP (
          clk => clk,
          rst => rst,
          load => load,
          parallel_in => parallel_in,
          serial_in => serial_in,
          serial_out => serial_out
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
		load <= '1';
		parallel_in <= x"01";
		wait for clk_period;
		parallel_in <= x"02";
		wait for clk_period;
		parallel_in <= x"03";
		wait for clk_period;
		parallel_in <= x"04";
		wait for clk_period;
		serial_in <= x"05";
		wait for clk_period;
		serial_in <= x"06";
		wait for clk_period;
		serial_in <= x"07";
		wait for clk_period;
		serial_in <= x"08";
		wait for clk_period;
		load <= '0';
		parallel_in <= x"01";
		wait for clk_period;
		parallel_in <= x"02";
		wait for clk_period;
		parallel_in <= x"03";
		wait for clk_period;
		parallel_in <= x"04";
		wait for clk_period;
		serial_in <= x"05";
		wait for clk_period;
		serial_in <= x"06";
		wait for clk_period;
		serial_in <= x"07";
		wait for clk_period;
		serial_in <= x"08";
		wait for clk_period;
		
		
      wait;
   end process;

END;
