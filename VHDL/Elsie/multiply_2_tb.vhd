--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   14:56:43 01/30/2018
-- Design Name:   
-- Module Name:   C:/Users/Elsie/Documents/Word Docs/Uni Stuff/Fouth year/6225 system design/Subbytes/multiply_2_tb.vhd
-- Project Name:  Subbytes
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: multiply_2
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
 
ENTITY multiply_2_tb IS
END multiply_2_tb;
 
ARCHITECTURE behavior OF multiply_2_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT multiply_2
    PORT(
         a : IN  std_logic_vector(1 downto 0);
         b : IN  std_logic_vector(1 downto 0);
         q : OUT  std_logic_vector(1 downto 0);
         clk : IN  std_logic;
         reset : IN  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal a : std_logic_vector(1 downto 0) := (others => '0');
   signal b : std_logic_vector(1 downto 0) := (others => '0');
   signal clk : std_logic := '0';
   signal reset : std_logic := '0';
	signal   i		: std_logic := '0';
	signal   j		: std_logic := '0';

 	--Outputs
   signal q : std_logic_vector(1 downto 0);

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: multiply_2 PORT MAP (
          a => a,
          b => b,
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
			for i in 0 to 3 loop 
			for j in 0 to 3 loop 
				a <= std_logic_vector(to_unsigned(i, 2));
				b <= std_logic_vector(to_unsigned(j, 2));
				wait for clk_period;
			end loop;
		end loop;
		
      wait;
   end process;

END;
