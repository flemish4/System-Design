--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   05:05:20 02/22/2018
-- Design Name:   
-- Module Name:   C:/Users/lukel/Desktop/Uni/Fourth Year/system design/VHDL/MixColumns/tb_MixColumns.vhd
-- Project Name:  MixColumns
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: MixColumns
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
USE ieee.std_logic_arith.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY tb_MixColumns IS
END tb_MixColumns;
 
ARCHITECTURE behavior OF tb_MixColumns IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT MixColumns
    PORT(
         clk : IN  std_logic;
         rst : IN  std_logic;
         byte_in : IN  std_logic_vector(7 downto 0);
         byte_out : OUT  std_logic_vector(7 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal clk : std_logic := '0';
   signal rst : std_logic := '0';
   signal byte_in : std_logic_vector(7 downto 0) := (others => '0');

 	--Outputs
   signal byte_out : std_logic_vector(7 downto 0);

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: MixColumns PORT MAP (
          clk => clk,
          rst => rst,
          byte_in => byte_in,
          byte_out => byte_out
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
		
		------------------------------------------------!!!!!!!!!!!!!!!!!!!!!!!wouldn't work
		
		--constant mc_in : integer := 16#d4bf5d30e0b452aeb84111f11e2798e5#;
		--constant mc_in_bits :  Std_Logic_Vector(127 downto 0) := std_logic_vector(to_unsigned(16#d4bf5d30e0b452aeb84111f11e2798e5#));
		
--		constant mc_in_byte1 :  Std_Logic_Vector(7 downto 0) := std_logic_vector(to_unsigned(16#d4#));
--		constant mc_in_byte2 :  Std_Logic_Vector(7 downto 0) := std_logic_vector(to_unsigned(16#bf#));
--		constant mc_in_byte3 :  Std_Logic_Vector(7 downto 0) := std_logic_vector(to_unsigned(16#5d#));
--		constant mc_in_byte4 :  Std_Logic_Vector(7 downto 0) := std_logic_vector(to_unsigned(16#30#));
--		constant mc_in_byte5 :  Std_Logic_Vector(7 downto 0) := std_logic_vector(to_unsigned(16#e0#));
--		constant mc_in_byte6 :  Std_Logic_Vector(7 downto 0) := std_logic_vector(to_unsigned(16#b4#));
--		constant mc_in_byte7 :  Std_Logic_Vector(7 downto 0) := std_logic_vector(to_unsigned(16#52#));
--		constant mc_in_byte8 :  Std_Logic_Vector(7 downto 0) := std_logic_vector(to_unsigned(16#ae#));
--		constant mc_in_byte9 :  Std_Logic_Vector(7 downto 0) := std_logic_vector(to_unsigned(16#b8#));
--		constant mc_in_byte10 :  Std_Logic_Vector(7 downto 0) := std_logic_vector(to_unsigned(16#41#));
--		constant mc_in_byte11 :  Std_Logic_Vector(7 downto 0) := std_logic_vector(to_unsigned(16#11#));
--		constant mc_in_byte12 :  Std_Logic_Vector(7 downto 0) := std_logic_vector(to_unsigned(16#f1#));
--		constant mc_in_byte13 :  Std_Logic_Vector(7 downto 0) := std_logic_vector(to_unsigned(16#1e#));
--		constant mc_in_byte14 :  Std_Logic_Vector(7 downto 0) := std_logic_vector(to_unsigned(16#27#));
--		constant mc_in_byte15 :  Std_Logic_Vector(7 downto 0) := std_logic_vector(to_unsigned(16#98#));
--		constant mc_in_byte16 :  Std_Logic_Vector(7 downto 0) := std_logic_vector(to_unsigned(16#e5#));
		
--		constant MC_IN_BYTE1 :  Std_Logic_Vector(7 downto 0):= "11010100";
--		constant MC_IN_BYTE2 :  Std_Logic_Vector(7 downto 0):= "10111111";
--		constant MC_IN_BYTE3 :  Std_Logic_Vector(7 downto 0):= "01011101";
--		constant MC_IN_BYTE4 :  Std_Logic_Vector(7 downto 0):= "00110000";
--		constant MC_IN_BYTE5 :  Std_Logic_Vector(7 downto 0):= "11100000";
--		constant MC_IN_BYTE6 :  Std_Logic_Vector(7 downto 0):= "10110100";
--		constant MC_IN_BYTE7 :  Std_Logic_Vector(7 downto 0):= "01010010";
--		constant MC_IN_BYTE8 :  Std_Logic_Vector(7 downto 0):= "10101110";
--		constant MC_IN_BYTE9 :  Std_Logic_Vector(7 downto 0):= "10111000";
--		constant MC_IN_BYTE10 :  Std_Logic_Vector(7 downto 0):= "01000001";
--		constant MC_IN_BYTE11 :  Std_Logic_Vector(7 downto 0):= "00010001";
--		constant MC_IN_BYTE12 :  Std_Logic_Vector(7 downto 0):= "11110001";
--		constant MC_IN_BYTE13 :  Std_Logic_Vector(7 downto 0):= "00011110";
--		constant MC_IN_BYTE14 :  Std_Logic_Vector(7 downto 0):= "00100111";
--		constant MC_IN_BYTE15 :  Std_Logic_Vector(7 downto 0):= "10011000";
--		constant MC_IN_BYTE16 :  Std_Logic_Vector(7 downto 0):= "11100101";

		--byte_in <= mc_in_byte1;
		--wait for clk_period;

		------------------------------------------------!!!!!!!!!!!!!!!!!!!!!!!
		
		
		
		byte_in <= "01001001";
		wait for clk_period;

		byte_in <= "11011011";
		wait for clk_period;

		byte_in <= "10000111";
		wait for clk_period;

		byte_in <= "00111011";
		wait for clk_period;

		byte_in <= "01000101";
		wait for clk_period;

		byte_in <= "00111001";
		wait for clk_period;

		byte_in <= "01010011";
		wait for clk_period;

		byte_in <= "10001001";
		wait for clk_period;

		byte_in <= "01111111";
		wait for clk_period;

		byte_in <= "00000010";
		wait for clk_period;

		byte_in <= "11010010";
		wait for clk_period;

		byte_in <= "11110001";
		wait for clk_period;

		byte_in <= "01110111";
		wait for clk_period;

		byte_in <= "11011110";
		wait for clk_period;

		byte_in <= "10010110";
		wait for clk_period;

		byte_in <= "00011010";
		wait for clk_period;

		
		
--		for i in 15 to 0 loop
--			
--			wait for clk_period;
--			
--			byte_in <= mc_in_bits(((i+1)*8)-1 downto ((i+1)*8)-8);
--		
--		end loop;

      wait;
   end process;

END;
