--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   11:03:19 01/24/2018
-- Design Name:   
-- Module Name:   E:/OneDrive/PC Documents/Important/University/Year 4/EEE6225/Project/keyGeneration/tb_srl16_8.vhd
-- Project Name:  keyGeneration
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: srl16_8
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
 
ENTITY tb_srl16_8 IS
END tb_srl16_8;
 
ARCHITECTURE behavior OF tb_srl16_8 IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT srl16_8
    PORT(
         D : IN  std_logic_vector(7 downto 0);
         CE : IN  std_logic;
         CLK : IN  std_logic;
         Addr : IN  std_logic_vector(3 downto 0);
         Q : OUT  std_logic_vector(7 downto 0);
         Q15 : OUT  std_logic_vector(7 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal D : std_logic_vector(7 downto 0) := (others => '0');
   signal CE : std_logic := '0';
   signal CLK : std_logic := '0';
   signal Addr : std_logic_vector(3 downto 0) := (others => '0');

 	--Outputs
   signal Q : std_logic_vector(7 downto 0);
   signal Q15 : std_logic_vector(7 downto 0);

   -- Clock period definitions
   constant CLK_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: srl16_8 PORT MAP (
          D => D,
          CE => CE,
          CLK => CLK,
          Addr => Addr,
          Q => Q,
          Q15 => Q15
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
      -- hold reset state for 100 ns.
      wait for 100 ns;	

      wait for CLK_period*10;

      -- insert stimulus here 
		for i in 0 to 16 loop
			CE <= '1';
			D <= X"FF";
			wait for CLK_period;
			CE <= '1';
			D <= X"00";
			wait for CLK_period;
		end loop;
		
		CE <='0';
			wait for CLK_period;
		
		for i in 0 to 16 loop
			Addr <= std_logic_vector(to_unsigned(i, Addr'length));
			wait for CLK_period;
		end loop;

      wait;
   end process;

END;
