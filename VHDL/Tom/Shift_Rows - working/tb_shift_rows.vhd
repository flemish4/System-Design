--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   15:53:21 12/14/2017
-- Design Name:   
-- Module Name:   U:/VHDL/Shift_Rows/tb_shift_rows.vhd
-- Project Name:  Shift_Rows
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: shift_rows
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
 
ENTITY tb_shift_rows IS
END tb_shift_rows;
 
ARCHITECTURE behavior OF tb_shift_rows IS 
 
    COMPONENT shift_rows
    PORT(
         bits_in 	: IN  std_logic_vector(7 downto 0);
         bits_out : OUT std_logic_vector(7 downto 0);
			ce			: IN	std_logic;
         clk 		: IN  std_logic;
         reset 	: IN  std_logic;
		   inv 		: in	STD_LOGIC);
   
	END COMPONENT;
    
   --Inputs
   signal bits_in 	: std_logic_vector(7 downto 0) := (others => '0');
	signal ce			: std_logic := '0';
   signal clk 			: std_logic := '0';
   signal reset 		: std_logic := '0';
   signal inv 			: std_logic := '0';

 	--Outputs
   signal bits_out 	: std_logic_vector(7 downto 0);

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

BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: shift_rows PORT MAP (
          bits_in => bits_in,
          clk => clk,
			 reset => reset,
			 inv => inv,
          ce => ce,
          bits_out => bits_out
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
      wait for clk_period*0.0001;

      -- insert stimulus here 
		ce <= '1';
		inv <= '0'; 
		for j in 0 to 2 loop
			for i in 0 to 15 loop
				bits_in <= testData0(i);
				wait for CLK_period;
			end loop;
			for i in 0 to 15 loop
				bits_in <= "00000000";
				wait for CLK_period;
			end loop;
			inv <= '1'; 
		end loop;
		
		
      wait;
   end process;

END;