----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    21:13:24 01/08/2018 
-- Design Name: 
-- Module Name:    const_mux_2 - Behavioral 
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
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity const_mux_2 is
    Port ( d : in  STD_LOGIC_VECTOR (1 downto 0);
           q : out  STD_LOGIC_VECTOR (1 downto 0);
			  reset : in STD_LOGIC;
			  clk : in STD_LOGIC );
end const_mux_2;

architecture Behavioral of const_mux_2 is

 begin  
	-- write the code to implment the design 
    q(1) <= d(1) xor d(0); 
    q(0) <= d(1);
     
end Behavioral;

