--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   10:33:14 02/02/2018
-- Design Name:   
-- Module Name:   C:/Users/Elsie/Documents/Word Docs/Uni Stuff/Fouth year/6225 system design/Subbytes/multiply_4_tb.vhd
-- Project Name:  Subbytes
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: multiply_4
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
 
ENTITY multiply_4_tb IS
END multiply_4_tb;
 
ARCHITECTURE behavior OF multiply_4_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT multiply_4
    PORT(
         a : IN  std_logic_vector(3 downto 0);
         b : IN  std_logic_vector(3 downto 0);
         clk : IN  std_logic;
         reset : IN  std_logic;
         q : OUT  std_logic_vector(3 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal a : std_logic_vector(3 downto 0) := (others => '0');
   signal b : std_logic_vector(3 downto 0) := (others => '0');
   signal clk : std_logic := '0';
   signal reset : std_logic := '0';
	signal i : std_logic := '0';
	signal j : std_logic := '0';

 	--Outputs
   signal q : std_logic_vector(3 downto 0);

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: multiply_4 PORT MAP (
          a => a,
          b => b,
          clk => clk,
          reset => reset,
          q => q
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
      -- Apply a reset pulse 
		reset <= '1';
		wait for clk_period;
		reset <= '0';
		wait for clk_period;
		
      -- Insert stimulus here 
		-- use loop to simulate all 256 combinations of input values
--		for i in 0 to 15 loop
--			for j in 0 to 15 loop 
--				a <= std_logic_vector(to_unsigned(i, 4));
--				b <= std_logic_vector(to_unsigned(j, 4));
--				wait for clk_period; 
--			end loop;
--		end loop; 
		
		-- Simulate specific inputs to check against truth table 
		a <= "0000"; b <= "0001"; 
		wait for clk_period;
		a <= "0000"; b <= "0110"; 
		wait for clk_period; 
		a <= "0000"; b <= "1010"; 
		wait for clk_period;
		a <= "0001"; b <= "1001"; 
		wait for clk_period;
		a <= "0100"; b <= "0111"; 
		wait for clk_period;
		a <= "0110"; b <= "1110"; 
		wait for clk_period; 
		a <= "0111"; b <= "0111"; 
		wait for clk_period;
		a <= "0111"; b <= "1010"; 
		wait for clk_period; 
		a <= "1000"; b <= "0000"; 
		wait for clk_period;
		a <= "1000"; b <= "1101"; 
		wait for clk_period; 
		a <= "1011"; b <= "0100"; 
		wait for clk_period;
		a <= "1011"; b <= "1001"; 
		wait for clk_period;
		a <= "1101"; b <= "0110"; 
		wait for clk_period;
		a <= "1110"; b <= "0011"; 
		wait for clk_period; 
		a <= "1110"; b <= "1001"; 
		wait for clk_period;
		a <= "1111"; b <= "1111"; 
		wait for clk_period; 

      wait;
   end process;

END;
