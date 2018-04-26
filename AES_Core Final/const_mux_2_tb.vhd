--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   22:32:39 01/08/2018
-- Design Name:   
-- Module Name:   C:/Users/Elsie/Documents/Word Docs/Uni Stuff/Fouth year/6225 system design/Subbytes/const_mux_2_tb.vhd
-- Project Name:  Subbytes
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: const_mux_2
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
 
ENTITY const_mux_2_tb IS
END const_mux_2_tb;
 

ARCHITECTURE behavior OF const_mux_2_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT const_mux_2
    PORT(
         d : IN  std_logic_vector(1 downto 0);
         q : OUT  std_logic_vector(1 downto 0);
			reset : IN std_logic;
         clk : IN  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal d : std_logic_vector(1 downto 0) := (others => '0');
   signal clk : std_logic := '0';
	signal reset : std_logic := '0';
	signal i : std_logic :='0'; 

 	--Outputs
   signal q : std_logic_vector(1 downto 0);

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: const_mux_2 PORT MAP (
          d => d,
          q => q,
			 reset => reset, 
          clk => clk
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
--       apply a reset pulse 
      reset <= '1';
		wait for clk_period;
		reset <= '0';
		wait for clk_period;
 		


      -- insert stimulus here 
		for i in 0 to 3 loop 
			d <= std_logic_vector(to_unsigned(i, 2));
			wait for clk_period; 
		end loop; 
		
   wait;
	end process;

END;
