--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   20:27:58 02/25/2018
-- Design Name:   
-- Module Name:   C:/Users/Elsie/Documents/Word Docs/Uni Stuff/Fouth year/6225 system design/VHDL/subbytes/subbytes_ppd_tb.vhd
-- Project Name:  Subbytes
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: subbytes_ppd
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
 
ENTITY subbytes_ppd_tb IS
END subbytes_ppd_tb;
 
ARCHITECTURE behavior OF subbytes_ppd_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT subbytes_ppd
    PORT(
         d : IN  std_logic_vector(7 downto 0);
         q : OUT  std_logic_vector(7 downto 0);
         s : IN  std_logic;
         clk : IN  std_logic;
         reset : IN  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal d : std_logic_vector(7 downto 0) := (others => '0');
   signal s : std_logic := '0';
   signal clk : std_logic := '0';
   signal reset : std_logic := '0';
	signal i : std_logic := '0';
   signal j : std_logic := '0';

 	--Outputs
   signal q : std_logic_vector(7 downto 0);

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: subbytes_ppd PORT MAP (
          d => d,
          q => q,
          s => s,
          clk => clk,
          reset => reset
        );

   -- Clock process definitions
   clk_process :process
   begin
		wait for clk_period/2;
		clk <= '1';
		wait for clk_period/2;
		clk <= '0';
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
		wait for clk_period/2;
      -- insert stimulus here 
		-- Set the subbytes function to encrypt and test inputs
		s <= '0';
		for i in 0 to 40 loop
			d <= std_logic_vector(to_unsigned(i, 8));
			wait for clk_period;
		end loop;
		
		--now set the subbytes funtction to decrypt
		s <= '1';
		for j in 0 to 40 loop
			d <= std_logic_vector(to_unsigned(j, 8));
			wait for clk_period;
		end loop;

      wait;
   end process;

END;