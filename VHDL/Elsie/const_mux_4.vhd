----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    20:28:11 01/29/2018 
-- Design Name: 
-- Module Name:    const_mux_4 - Behavioral 
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

entity const_mux_4 is
    Port ( d : in  STD_LOGIC_VECTOR (3 downto 0);
           q : out  STD_LOGIC_VECTOR (3 downto 0);
           clk : in  STD_LOGIC;
           reset : in  STD_LOGIC);
end const_mux_4;

architecture Behavioral of const_mux_4 is
 

signal v1,v2, v3: STD_lOGIC ;

begin
	-- write the code to implment the design 
	-- use variables to simplify the xor operations and make sure the right values are computed 
	v1 <= d(2) xor d(0);
	 v2 <= d(3) xor d(1);
	 v3 <= v1 xor v2;  
	 
	 -- now load the computed values into the output 

	 q(3) <= v1;
	 q(2) <= v3; 
	 q(1) <= d(3); 
	 q(0) <= d(2);
 
 
end Behavioral;

