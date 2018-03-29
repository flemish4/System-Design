----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    06:01:30 02/16/2018 
-- Design Name: 
-- Module Name:    control - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
library UNISIM;
use UNISIM.VComponents.all;

entity control is
    Port ( clk, CE : in  STD_LOGIC;
           EN, load : out  STD_LOGIC);
end control;

architecture Behavioral of control is



signal EN_out: STD_LOGIC;
signal load_out : STD_LOGIC;
--signal temp_load : std_logic_vector(3 downto 0) := std_logic_vector(to_unsigned(4, 4));
--signal temp_EN: std_logic_vector(3 downto 0) := std_logic_vector(to_unsigned(11, 4));

begin

	load_srl16: SRLC16E
		generic map(
			INIT => "0000000000001000")
		port map(
			Q		=> load_out,
			A0		=>	'1',
			A1		=>	'1',
			A2		=>	'0',
			A3 	=>	'0',
			CE		=>	CE,
			CLK 	=>	clk,
			D 		=>	load_out); 
	
	 process (clk)
         begin
             if rising_edge(clk) then 
                   --temp_load <= temp_load(2 downto 0) & temp_load(3);   -- concatenation operator &
							EN <=  not load_out;
							load <= load_out;
					
            end if;
    end process;
	
---------------------------------------------------------------------------------------------
--	 process (clk)
--         begin
--             if rising_edge(clk) then 
--					if rst ='1' then
--                   temp_load <= std_logic_vector(to_unsigned(4, 4));
--					else
--                   temp_load <= temp_load(2 downto 0) & temp_load(3);   -- concatenation operator &
--                  
--					end if;
--            end if;
--    end process;
--	 
--	 load <= temp_load(3);
--	 
--	 process (clk)
--         begin
--             if rising_edge(clk) then 
--					if rst ='1' then
--                   temp_EN <= std_logic_vector(to_unsigned(11, 4));
--					else
--                   temp_EN <= temp_EN(2 downto 0) & temp_EN(3);   -- concatenation operator &
--                  
--					end if;
--            end if;
--    end process;
--	 
--	 EN <= temp_EN(3);


end Behavioral;

