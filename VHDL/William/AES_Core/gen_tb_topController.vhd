--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   15:05:14 03/24/2018
-- Design Name:   
-- Module Name:   E:/Georgina/Documents/William/System-Design/VHDL/William/AES_core/gen_tb_topController.vhd
-- Project Name:  AES_core
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: topController
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
 
ENTITY gen_tb_topController IS
END gen_tb_topController;
 
ARCHITECTURE behavior OF gen_tb_topController IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT topController
    PORT(
         keyIn : IN  std_logic_vector(7 downto 0);
         inv : IN  std_logic;
         stop : IN  std_logic;
         keyInEn : IN  std_logic;
         dataInEn : IN  std_logic;
         keyInReady : OUT  std_logic;
         dataInReady : OUT  std_logic;
         clk : IN  std_logic;
         rst : IN  std_logic;
         keyOut1 : OUT  std_logic_vector(7 downto 0);
         keyOut0 : OUT  std_logic_vector(7 downto 0);
         dpS0 : OUT  std_logic;
         dpS1 : OUT  std_logic;
         dpAdrs : OUT  std_logic_vector(3 downto 0);
         dpmxclmnen : OUT  std_logic;
         dpclken : OUT  std_logic;
         dpshftren : OUT  std_logic;
         dpsubbytesen : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal keyIn : std_logic_vector(7 downto 0) := (others => '0');
   signal inv : std_logic := '0';
   signal stop : std_logic := '0';
   signal keyInEn : std_logic := '0';
   signal dataInEn : std_logic := '0';
   signal clk : std_logic := '0';
   signal rst : std_logic := '0';

 	--Outputs
   signal keyInReady : std_logic;
   signal dataInReady : std_logic;
   signal keyOut1 : std_logic_vector(7 downto 0);
   signal keyOut0 : std_logic_vector(7 downto 0);
   signal dpS0 : std_logic;
   signal dpS1 : std_logic;
   signal dpAdrs : std_logic_vector(3 downto 0);
   signal dpmxclmnen : std_logic;
   signal dpclken : std_logic;
   signal dpshftren : std_logic;
   signal dpsubbytesen : std_logic;

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: topController PORT MAP (
          keyIn => keyIn,
          inv => inv,
          stop => stop,
          keyInEn => keyInEn,
          dataInEn => dataInEn,
          keyInReady => keyInReady,
          dataInReady => dataInReady,
          clk => clk,
          rst => rst,
          keyOut1 => keyOut1,
          keyOut0 => keyOut0,
          dpS0 => dpS0,
          dpS1 => dpS1,
          dpAdrs => dpAdrs,
          dpmxclmnen => dpmxclmnen,
          dpclken => dpclken,
          dpshftren => dpshftren,
          dpsubbytesen => dpsubbytesen
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

      wait;
   end process;

END;
