--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   13:33:39 02/22/2018
-- Design Name:   
-- Module Name:   E:/OneDrive/PC Documents/Important/University/Year 4/EEE6225/ShiftRows/tb_shiftRows.vhd
-- Project Name:  ShiftRows
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: shiftRows
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
 
ENTITY tb_shiftRows IS
END tb_shiftRows;
 
ARCHITECTURE behavior OF tb_shiftRows IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT shiftRows
    PORT(
         dataIn : IN  std_logic_vector(7 downto 0);
         clk : IN  std_logic;
         ce : IN  std_logic;
         dataOut : OUT  std_logic_vector(7 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal dataIn : std_logic_vector(7 downto 0) := (others => '0');
   signal clk : std_logic := '0';
   signal ce : std_logic := '0';

 	--Outputs
   signal dataOut : std_logic_vector(7 downto 0);

   -- Clock period definitions
   constant clk_period : time := 10 ns;
  	-- type definition for 256 word x 8 bit Inverse ROM 
	type vectype is array (0 to 15) of std_logic_vector (7 downto 0);
	-- ROM invrom 
	constant testData0  : vectype := (
	0 => x"00", 
	1 => x"01", 
	2 => x"02", 
	3 => x"03", 
	4 => x"04", 
	5 => x"05", 
	6 => x"06", 
	7 => x"07", 
	8 => x"08", 
	9 => x"09", 
	10 => x"0A", 
	11 => x"0B", 
	12 => x"0C", 
	13 => x"0D", 
	14 => x"0E", 
	15 => x"0F" );	
	
	constant testData1  : vectype := (
	0 => x"d4", 
	1 => x"27", 
	2 => x"11", 
	3 => x"ae", 
	4 => x"e0", 
	5 => x"bf", 
	6 => x"98", 
	7 => x"f1", 
	8 => x"b8", 
	9 => x"b4", 
	10 => x"5d", 
	11 => x"e5", 
	12 => x"1e", 
	13 => x"41", 
	14 => x"52", 
	15 => x"30" );
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: shiftRows PORT MAP (
          dataIn => dataIn,
          clk => clk,
          ce => ce,
          dataOut => dataOut
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

      wait for clk_period*10.5;
      wait for clk_period*0.01;

      -- insert stimulus here 
		ce <= '1';
		for j in 0 to 2 loop
			for i in 0 to 15 loop
				dataIn <= testData0(i);
				wait for CLK_period;
			end loop;
			for i in 0 to 15 loop
				dataIn <= testData1(i);
				wait for CLK_period;
			end loop;
		end loop;
		
		
      wait;
   end process;

END;
