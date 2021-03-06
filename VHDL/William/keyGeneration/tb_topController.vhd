--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   19:30:25 02/06/2018
-- Design Name:   
-- Module Name:   E:/OneDrive/PC Documents/Important/University/Year 4/EEE6225/System-Design/VHDL/William/keyGeneration/tb_topController.vhd
-- Project Name:  keyGeneration
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
 
ENTITY tb_topController IS
END tb_topController;
 
ARCHITECTURE behavior OF tb_topController IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
component topController is
    Port ( 
				keyIn : in  STD_LOGIC_VECTOR (7 downto 0);
				inv : in  STD_LOGIC;
				stop : in  STD_LOGIC;
				keyInEn : in  STD_LOGIC;
				dataInEn : in  STD_LOGIC;
				keyInReady : out  STD_LOGIC;
				dataInReady : out  STD_LOGIC;
				clk : in  STD_LOGIC;
				rst : in  STD_LOGIC;
				keyOut1 : out  STD_LOGIC_VECTOR (7 downto 0);
				keyOut0 : out  STD_LOGIC_VECTOR (7 downto 0);
				dpS0 : out STD_LOGIC;
				dpS1 : out STD_LOGIC;
				dpAdrs : out STD_LOGIC_VECTOR (3 downto 0);
				dpmxclmnen : out STD_LOGIC;
				dpclken : out STD_LOGIC;
				dpshftren : out STD_LOGIC;
				dpsubbytesen : out STD_LOGIC
			  );
end component;
    

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
		
		
		wait for CLK_period/2;
		wait for CLK_period/1000;
      -- hold reset state for 100 ns.
      --wait for 100 ns;
		--RST <= '1';
      --wait for CLK_period;
		--RST <= '0';
      wait for CLK_period*10;	

		keyInEn <= '1';
		dataInEn <= '1';
		--addrOutSel <= '1';
		for i in 0 to 15 loop
			keyIn <= testKey0(i);
			wait for CLK_period;
		end loop;
		keyInEn <= '0';
		dataInEn <= '0';
		--addrOutSel <= '0';
		wait for clk_period *16;
		
		
		for i in 0 to 20 loop
			--addrOutSel <= '1';
			wait for clk_period *16;
			--addrOutSel <= '0';
			wait for clk_period *16;
		end loop;
		
		--addrOutSel <= '0';
		
		
      --wait for CLK_period * 16*10*2;
		
		stop <= '1';
		wait for clk_period *32;
		stop <='0';
		wait for clk_period *16;
		RST <= '1';
      wait for CLK_period;
		RST <= '0';
      wait for CLK_period;
		
		inv <= '1';
		keyInEn <= '1';
		--addrOutSel <= '1';
		for i in 0 to 15 loop
			keyIn <= testKey0(i);
			wait for CLK_period;
		end loop;
		keyInEn <= '0';
		--addrOutSel <= '0';
		wait for clk_period *16;
		
		for i in 0 to 19 loop
		--	addrOutSel <= '1';
			wait for clk_period *16;
		--	addrOutSel <= '0';
			wait for clk_period *16;
		end loop;
		
--		for i in 0 to 9 loop
--			addrOutSel <= '1';
--			ce <= '0';
--			wait for clk_period *16;
--			addrOutSel <= '0';
--			ce <= '1';
--			wait for clk_period *16;
--		end loop;
      --wait for CLK_period * 16*10*3;

		--stop <= '1';
		wait for clk_period *16;
		--stop <='0';
		

      wait;
   end process;

END;
