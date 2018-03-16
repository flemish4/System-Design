--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   00:06:26 03/08/2018
-- Design Name:   
-- Module Name:   C:/Users/lukel/Desktop/Uni/Fourth Year/system design/VHDL/MixColumns/tb_top.vhd
-- Project Name:  MixColumns
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: MixColumns_Top
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
 
ENTITY tb_top IS
END tb_top;
 
ARCHITECTURE behavior OF tb_top IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT MixColumns_Top
    PORT(
         clk : IN  std_logic;
         rst : IN  std_logic;
         inv : IN  std_logic;
			CE : IN  std_logic;
			round10 : IN  std_logic;
         byte_in : IN  std_logic_vector(7 downto 0);
         byte_out : OUT  std_logic_vector(7 downto 0);
			load_count : OUT  std_logic
			
        );
    END COMPONENT;
    

   --Inputs
   signal clk : std_logic := '0';
   signal rst : std_logic := '0';
   signal inv : std_logic := '0';
	signal CE : std_logic := '0';
	signal round10 : std_logic := '0';
   signal byte_in : std_logic_vector(7 downto 0) := (others => '0');

 	--Outputs
   signal byte_out : std_logic_vector(7 downto 0);
	signal load_count : std_logic;
   -- Clock period definitions
   constant clk_period : time := 10 ns;
	
	-- type definition for 256 word x 8 bit Inverse ROM 
	type my_type is array (0 to 15) of std_logic_vector (7 downto 0);
	-- state_in
	constant state_in_encode  : my_type := (
	0 => x"49", 		
	1 => x"db", 
	2 => x"87", 
	3 => x"3b", 
	4 => x"45", 
	5 => x"39", 
	6 => x"53", 
	7 => x"89", 
	8 => x"7f", 
	9 => x"02", 
	10 => x"d2", 
	11 => x"f1", 
	12 => x"77", 
	13 => x"de", 
	14 => x"96", 
	15 => x"1a");
	
	constant state_in_decode  : my_type := (
	0 => x"58", 		
	1 => x"4d", 
	2 => x"ca", 
	3 => x"f1", 
	4 => x"1b", 
	5 => x"4b", 
	6 => x"5a", 
	7 => x"ac", 
	8 => x"db", 
	9 => x"e7", 
	10 => x"ca", 
	11 => x"a8", 
	12 => x"1b", 
	13 => x"6b", 
	14 => x"b0", 
	15 => x"e5");
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: MixColumns_Top PORT MAP (
          clk => clk,
          rst => rst,
          inv => inv,
			 CE => CE,
			 round10 => round10,
          byte_in => byte_in,
          byte_out => byte_out,
			 load_count => load_count
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
		
      rst <= '1';
		inv <= '0';
		round10 <= '1';
  		wait for clk_period*2;	
 		rst <= '0';
		
		
		wait for clk_period*0.5;
		CE <= '1';
      -- insert stimulus here 
		
		for i in 0 to 15 loop
			byte_in <= state_in_encode(i);
			wait for clk_period;
		end loop;

		byte_in <= x"00";

      wait;
   end process;

END;
