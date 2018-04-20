--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   18:19:59 04/19/2018
-- Design Name:   
-- Module Name:   E:/OneDrive/PC Documents/Important/University/Year 4/EEE6225/System-Design/VHDL/William/SerialWrapper_EEE6225/tb_top_level_noUART.vhd
-- Project Name:  SerialWrapper_EEE6225
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: top_level_noUART
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
 
ENTITY tb_top_level_noUART IS
END tb_top_level_noUART;
 
ARCHITECTURE behavior OF tb_top_level_noUART IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT top_level_noUART
    PORT(
         clk : IN  std_logic;
         rst : IN  std_logic;
         AES_key : IN  std_logic_vector(127 downto 0);
         AES_input_data : IN  std_logic_vector(127 downto 0);
         AES_output_data : OUT  std_logic_vector(127 downto 0);
         AES_KeyReady : IN  std_logic;
         AES_InputDataReady : IN  std_logic;
         AES_OutputDataReady : OUT  std_logic;
         inv : IN  std_logic;
         led_sel : IN  std_logic;
         led : OUT  std_logic_vector(7 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal clk : std_logic := '0';
   signal rst : std_logic := '0';
   signal AES_key : std_logic_vector(127 downto 0) := (others => '0');
   signal AES_input_data : std_logic_vector(127 downto 0) := (others => '0');
   signal AES_KeyReady : std_logic := '0';
   signal AES_InputDataReady : std_logic := '0';
   signal inv : std_logic := '0';
   signal led_sel : std_logic := '0';

 	--Outputs
   signal AES_output_data : std_logic_vector(127 downto 0);
   signal AES_OutputDataReady : std_logic;
   signal led : std_logic_vector(7 downto 0);

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: top_level_noUART PORT MAP (
          clk => clk,
          rst => rst,
          AES_key => AES_key,
          AES_input_data => AES_input_data,
          AES_output_data => AES_output_data,
          AES_KeyReady => AES_KeyReady,
          AES_InputDataReady => AES_InputDataReady,
          AES_OutputDataReady => AES_OutputDataReady,
          inv => inv,
          led_sel => led_sel,
          led => led
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

      wait for clk_period*10.501;
		inv <= '1';
		rst <= '1';
		wait for clk_period;
		rst <= '0';
		wait for clk_period * 32 * 10;
      -- insert stimulus here 
		 AES_key  			<= x"5468617473206D79204B756E67204675";
		 AES_KeyReady  <= '1';
		 wait for clk_period;
		 AES_key  <= (others => '0');
		 AES_KeyReady  <= '0';
		 wait for clk_period;
		 wait for clk_period;
		 

		 
		 --AES_input_data  	<= x"54776F204F6E65204E696E652054776F";
		 AES_input_data  	<= x"29C3505F571420F6402299B31A02D73A";
		 AES_InputDataReady  <= '1';
		 wait for clk_period;
		 AES_input_data  <= (others => '0');
		 AES_InputDataReady  <= '0';
		 wait for clk_period;
		 --AES_input_data  	<= x"29C3505F571420F6402299B31A02D73A";
		 AES_input_data  	<= x"54776F204F6E65204E696E652054776F";
		 AES_InputDataReady  <= '1';
		 wait for clk_period;
		 AES_input_data  <= (others => '0');
		 AES_InputDataReady  <= '0';
		 wait for clk_period;
		 
		 
		 
		 
		 wait for clk_period;
		 wait for clk_period;
		 wait for clk_period;
		 wait for clk_period;
		 wait for clk_period * 10*32 ;
		 
		 --rst <= '1';
		 --inv <= '1';
		 wait for clk_period;
		 wait for clk_period;
		 wait for clk_period;
		 wait for clk_period;
		 rst <= '0';
		 wait for clk_period;
		 wait for clk_period;

		 --AES_input_data  	<= x"29C3505F571420F6402299B31A02D73A";
		 AES_input_data  	<= x"54776F204F6E65204E696E652054776F";
		 AES_InputDataReady  <= '1';
		 wait for clk_period;
		 AES_input_data  <= (others => '0');
		 AES_InputDataReady  <= '0';
		 wait for clk_period;
		 --AES_input_data  	<= x"29C3505F571420F6402299B31A02D73A";
		 AES_input_data  	<= x"54776F204F6E65204E696E652054776F";
		 AES_InputDataReady  <= '1';
		 wait for clk_period;
		 AES_input_data  <= (others => '0');
		 AES_InputDataReady  <= '0';
		 wait for clk_period;		 
		 AES_key  			<= x"5468617473206D79204B756E67204675";
		 AES_KeyReady  <= '1';
		 wait for clk_period;
		 AES_key  <= (others => '0');
		 AES_KeyReady  <= '0';
		 wait for clk_period;
		 wait for clk_period *32*6;
		 
		 
		 
		 --AES_input_data  	<= x"29C3505F571420F6402299B31A02D73A";
		 AES_input_data  	<= x"54776F204F6E65204E696E652054776F";
		 AES_InputDataReady  <= '1';
		 wait for clk_period;
		 AES_input_data  <= (others => '0');
		 AES_InputDataReady  <= '0';
		 wait for clk_period;
		 --AES_input_data  	<= x"29C3505F571420F6402299B31A02D73A";
		 AES_input_data  	<= x"54776F204F6E65204E696E652054776F";
		 AES_InputDataReady  <= '1';
		 wait for clk_period;
		 AES_input_data  <= (others => '0');
		 AES_InputDataReady  <= '0';
		 wait for clk_period;		
      -- insert stimulus here 

      wait;
   end process;

END;
