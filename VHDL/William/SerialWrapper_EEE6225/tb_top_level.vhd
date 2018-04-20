--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   10:34:54 04/19/2018
-- Design Name:   
-- Module Name:   E:/OneDrive/PC Documents/Important/University/Year 4/EEE6225/System-Design/VHDL/William/SerialWrapper_EEE6225/tb_top_level.vhd
-- Project Name:  SerialWrapper_EEE6225
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: top_level
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
 
ENTITY tb_top_level IS
END tb_top_level;
 
ARCHITECTURE behavior OF tb_top_level IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT top_level
    PORT(
         clk : IN  std_logic;
         rst : IN  std_logic;
         LED : OUT  std_logic_vector(7 downto 0);
         RXD : IN  std_logic;
         TXD : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal clk : std_logic := '0';
   signal rst : std_logic := '0';
   signal RXD : std_logic := '0';

 	--Outputs
   signal LED : std_logic_vector(7 downto 0);
   signal TXD : std_logic;

   -- Clock period definitions
   constant clk_period : time := 10 ns;
	
	
	
-- Example:	K2B7E151628AED2A6ABF7158809CF4F3C
--				    - the key 3242374531353136323841454432413641424637313538383039434634463343
--				K - 4B
-- Result key in : 4B32423745313531363238414544324136414246373135383830394346344633430D
-- 			D3925841D02DC09FBDC118597196A0B32
--									3339323538343144303244433039464244433131383539373139364130423332
--      44
--           4433393235383431443032444330394642444331313835393731393641304233320D
-- returns: E3243F6A8885A308D313198A2E0370734
-- 3332343346364138383835413330384433313331393841324530333730373334
-- E 45
-- 4533323433463641383838354133303844333133313938413245303337303733340D
	constant keyInput : STD_LOGIC_VECTOR (271 downto 0) := x"4B32423745313531363238414544324136414246373135383830394346344633430D";
	constant DInput : STD_LOGIC_VECTOR (271 downto 0) := x"4433393235383431443032444330394642444331313835393731393641304233320D";
	constant EInput : STD_LOGIC_VECTOR (271 downto 0) := x"4533323433463641383838354133303844333133313938413245303337303733340D";
	signal startInput : std_logic := '0';
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: top_level PORT MAP (
          clk => clk,
          rst => rst,
          LED => LED,
          RXD => RXD,
          TXD => TXD
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

      wait for clk_period*10;

      -- insert stimulus here 

		for i in 0 to 271 loop
			startInput <= '1';
			RXD <= keyInput(271 - i);
			wait for 104167 ns;
		end loop;
		startInput <= '0';
      wait;
   end process;

END;
