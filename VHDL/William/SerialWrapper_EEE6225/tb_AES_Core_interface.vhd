--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   13:21:15 04/19/2018
-- Design Name:   
-- Module Name:   E:/OneDrive/PC Documents/Important/University/Year 4/EEE6225/System-Design/VHDL/William/SerialWrapper_EEE6225/tb_AES_Core_interface.vhd
-- Project Name:  SerialWrapper_EEE6225
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: AES_core_interface
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
 
ENTITY tb_AES_Core_interface IS
END tb_AES_Core_interface;
 
ARCHITECTURE behavior OF tb_AES_Core_interface IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT AES_core_interface
    PORT(
         clk : IN  std_logic;
         rst : IN  std_logic;
         AES_encode : IN  std_logic;
         AES_key : IN  std_logic_vector(127 downto 0);
         AES_input_data : IN  std_logic_vector(127 downto 0);
         AES_output_data : OUT  std_logic_vector(127 downto 0);
         AES_KeyReady : IN  std_logic;
         AES_InputDataReady : IN  std_logic;
         AES_OutputDataReady : OUT  std_logic;
         AES_Core_KeyInReady : IN  std_logic;
         AES_Core_KeyInEn : OUT  std_logic;
         AES_Core_KeyIn : OUT  std_logic_vector(7 downto 0);
         AES_Core_DataInReady : IN  std_logic;
         AES_Core_DataInEn : OUT  std_logic;
         AES_Core_DataIn : OUT  std_logic_vector(7 downto 0);
         AES_Core_DataOutReady : IN  std_logic;
         AES_Core_DataOut : IN  std_logic_vector(7 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal clk : std_logic := '0';
   signal rst : std_logic := '0';
   signal AES_encode : std_logic := '0';
   signal AES_key : std_logic_vector(127 downto 0) := (others => '0');
   signal AES_input_data : std_logic_vector(127 downto 0) := (others => '0');
   signal AES_KeyReady : std_logic := '0';
   signal AES_InputDataReady : std_logic := '0';
   signal AES_Core_KeyInReady : std_logic := '0';
   signal AES_Core_DataInReady : std_logic := '0';
   signal AES_Core_DataOutReady : std_logic := '0';
   signal AES_Core_DataOut : std_logic_vector(7 downto 0) := (others => '0');

 	--Outputs
   signal AES_output_data : std_logic_vector(127 downto 0);
   signal AES_OutputDataReady : std_logic;
   signal AES_Core_KeyInEn : std_logic;
   signal AES_Core_KeyIn : std_logic_vector(7 downto 0);
   signal AES_Core_DataInEn : std_logic;
   signal AES_Core_DataIn : std_logic_vector(7 downto 0);

   -- Clock period definitions
   constant clk_period : time := 10 ns;
			type vectype is array (0 to 15) of std_logic_vector (7 downto 0);

 		constant testData1  : vectype := (															

			0 => x"29", 
			1 => x"C3", 
			2 => x"50", 
			3 => x"5F", 
			4 => x"57", 
			5 => x"14", 
			6 => x"20", 
			7 => x"F6", 
			8 => x"40", 
			9 => x"22", 
			10 => x"99", 
			11 => x"B3", 
			12 => x"1A", 
			13 => x"02", 
			14 => x"D7", 
			15 => x"3A" 
		);
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: AES_core_interface PORT MAP (
          clk => clk,
          rst => rst,
          AES_encode => AES_encode,
          AES_key => AES_key,
          AES_input_data => AES_input_data,
          AES_output_data => AES_output_data,
          AES_KeyReady => AES_KeyReady,
          AES_InputDataReady => AES_InputDataReady,
          AES_OutputDataReady => AES_OutputDataReady,
          AES_Core_KeyInReady => AES_Core_KeyInReady,
          AES_Core_KeyInEn => AES_Core_KeyInEn,
          AES_Core_KeyIn => AES_Core_KeyIn,
          AES_Core_DataInReady => AES_Core_DataInReady,
          AES_Core_DataInEn => AES_Core_DataInEn,
          AES_Core_DataIn => AES_Core_DataIn,
          AES_Core_DataOutReady => AES_Core_DataOutReady,
          AES_Core_DataOut => AES_Core_DataOut
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

		 AES_Core_DataInReady <= '1';
		 AES_Core_KeyInReady <= '1';
		 wait for 50 ns;	
		

      -- insert stimulus here 
		 AES_key  			<= x"5468617473206D79204B756E67204675";
		 AES_KeyReady  <= '1';
		 wait for clk_period;
		 AES_key  <= (others => '0');
		 AES_KeyReady  <= '0';
		 wait for clk_period;
		 wait for clk_period;
		 

		 
		 AES_input_data  	<= x"54776F204F6E65204E696E652054776F";
		 AES_InputDataReady  <= '1';
		 wait for clk_period;
		 AES_input_data  <= (others => '0');
		 AES_InputDataReady  <= '0';
		 wait for clk_period;
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
		 wait for clk_period;
		 wait for clk_period*100;
		 
		 
		 AES_Core_DataInReady <= '1';
		 AES_Core_KeyInReady <= '1';
		 wait for clk_period * 16;
		 AES_Core_KeyInReady <= '0';
		 wait for clk_period * 16;
		 AES_Core_DataInReady <= '0';
		 

		 
		 wait for clk_period;
		 
		 wait for clk_period;
		 
		 wait for clk_period;
		 
		 wait for clk_period;

			AES_Core_DataOutReady <= '1';
			for i in 0 to 15 loop
				AES_Core_DataOut <= testData1(i);
		 wait for clk_period;
			end loop;
			for i in 0 to 15 loop
				AES_Core_DataOut <= testData1(i);
		 wait for clk_period;
			end loop;
			AES_Core_DataOutReady <= '0';
		 wait for clk_period;
		 wait for clk_period;
		 
		 wait for clk_period;
		
      wait;
   end process;

END;
