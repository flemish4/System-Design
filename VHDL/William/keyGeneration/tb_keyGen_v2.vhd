--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   11:13:45 02/08/2018
-- Design Name:   
-- Module Name:   E:/OneDrive/PC Documents/Important/University/Year 4/EEE6225/System-Design/VHDL/William/keyGeneration/tb_keyGen_v2.vhd
-- Project Name:  keyGeneration
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: keyGen
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
 
ENTITY tb_keyGen_v2 IS
END tb_keyGen_v2;
 
ARCHITECTURE behavior OF tb_keyGen_v2 IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT keyGen
    PORT(
         keyIn : IN  std_logic_vector(7 downto 0);
         CLK : IN  std_logic;
         RST : IN  std_logic;
         INV : IN  std_logic;
         CE : IN  std_logic;
         keyInEn : IN  std_logic;
         done : OUT  std_logic;
         keyout : OUT  std_logic_vector(7 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal keyIn : std_logic_vector(7 downto 0) := (others => '0');
   signal CLK : std_logic := '0';
   signal RST : std_logic := '0';
   signal INV : std_logic := '0';
   signal CE : std_logic := '0';
   signal keyInEn : std_logic := '0';

 	--Outputs
   signal done : std_logic;
   signal keyout : std_logic_vector(7 downto 0);

   -- Clock period definitions
   constant CLK_period : time := 10 ns;
 	-- type definition for 256 word x 8 bit Inverse ROM 
	type vectype is array (0 to 15) of std_logic_vector (7 downto 0);
	-- ROM invrom 
	constant testKey0  : vectype := (
	0 => x"2b", 
	1 => x"7e", 
	2 => x"15", 
	3 => x"16", 
	4 => x"28", 
	5 => x"ae", 
	6 => x"d2", 
	7 => x"a6", 
	8 => x"ab", 
	9 => x"f7", 
	10 => x"15", 
	11 => x"88", 
	12 => x"09", 
	13 => x"cf", 
	14 => x"4f", 
	15 => x"3c" );
	constant testKey10  : vectype := (
	0 => x"d0", 
	1 => x"14", 
	2 => x"f9", 
	3 => x"a8", 
	4 => x"c9", 
	5 => x"ee", 
	6 => x"25", 
	7 => x"89", 
	8 => x"e1", 
	9 => x"3f", 
	10 => x"0c", 
	11 => x"c8", 
	12 => x"b6", 
	13 => x"63", 
	14 => x"0c", 
	15 => x"a6" );

BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: keyGen PORT MAP (
          keyIn => keyIn,
          CLK => CLK,
          RST => RST,
          INV => INV,
          CE => CE,
          keyInEn => keyInEn,
          done => done,
          keyout => keyout
        );

   -- Clock process definitions
   CLK_process :process
   begin
		CLK <= '0';
		wait for CLK_period/2;
		CLK <= '1';
		wait for CLK_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
		wait for CLK_period/2;
		wait for CLK_period/10;
		
-- forward testing
		-- hold reset state for 100 ns.
--		wait for 100 ns;	
--		RST <= '1';
--		wait for CLK_period;
--		RST <= '0';
--		wait for CLK_period*10;
--		for j in 0 to 3 loop
--
--			-- insert stimulus here 
--			keyInEn <= '1';
--			ce <= '1';
--			for i in 0 to 15 loop
--				keyIn <= testKey0(i);
--				wait for CLK_period;
--			end loop;
--			keyInEn <= '0';
--
--
--			wait for CLK_period * 16 * 10;
--		end loop;


 --inv testing
 --      hold reset state for 100 ns.
--      wait for 100 ns;	
--		
		
		inv <= '1';
--		RST <= '1';
--      wait for CLK_period;
--		RST <= '0';
      wait for CLK_period*10;
	
	for j in 0 to 2 loop
      -- insert stimulus here 
		keyInEn <= '1';
		ce <= '1';
		for i in 0 to 15 loop
			keyIn <= testKey10(15-i);
			wait for CLK_period;
		end loop;
		keyInEn <= '0';
		
      wait for CLK_period * 16 *10;
		
	end loop;
      wait;
   end process;

END;
