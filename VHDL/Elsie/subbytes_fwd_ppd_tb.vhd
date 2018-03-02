--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   15:48:15 03/02/2018
-- Design Name:   
-- Module Name:   U:/fourth year/EEE6225/subbytes/subbytes_fwd_ppd_tb.vhd
-- Project Name:  Subbytes
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: subbytes_fwd_ppd
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
 
ENTITY subbytes_fwd_ppd_tb IS
END subbytes_fwd_ppd_tb;
 
ARCHITECTURE behavior OF subbytes_fwd_ppd_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT subbytes_fwd_ppd
    PORT(
         d : IN  std_logic_vector(7 downto 0);
         q : OUT  std_logic_vector(7 downto 0);
         clk : IN  std_logic;
         reset : IN  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal d : std_logic_vector(7 downto 0) := (others => '0');
   signal clk : std_logic := '0';
   signal reset : std_logic := '0';
	signal i : std_logic := '0';

 	--Outputs
   signal q : std_logic_vector(7 downto 0);

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: subbytes_fwd_ppd PORT MAP (
          d => d,
          q => q,
          clk => clk,
          reset => reset
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
      -- insert stimulus here 
		wait for clk_period/2;
     
		-- Set the subbytes function to encrypt and test inputs
		for i in 0 to 40 loop
			d <= std_logic_vector(to_unsigned(i, 8));
			wait for clk_period;
		end loop;


      wait;
   end process;

END;
