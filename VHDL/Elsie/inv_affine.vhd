----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    18:14:17 02/18/2018 
-- Design Name: 
-- Module Name:    inv_affine - Behavioral 
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

entity inv_affine is
    Port ( d : in  STD_LOGIC_VECTOR (7 downto 0);
           q : out  STD_LOGIC_VECTOR (7 downto 0);
           clk : in  STD_LOGIC;
           reset : in  STD_LOGIC);
end inv_affine;

architecture Behavioral of inv_affine is
	-- define 8-bit constant c to be used in the code 
	constant c : STD_LOGIC_VECTOR (7 downto 0) := "00000101";

begin
	--Write code to implement the inverse affine transformation which is just a matrix multiplication 
		 q(0) <= d(2) xor d(5) xor d(7) xor c(0); 
		 q(1) <= d(0) xor d(3) xor d(6) xor c(1);
		 q(2) <= d(1) xor d(4) xor d(7) xor c(2); 
		 q(3) <= d(0) xor d(2) xor d(5) xor c(3); 
		 q(4) <= d(1) xor d(3) xor d(6) xor c(4);
		 q(5) <= d(2) xor d(4) xor d(7) xor c(5);
		 q(6) <= d(0) xor d(3) xor d(5) xor c(6); 
		 q(7) <= d(1) xor d(4) xor d(6) xor c(7); 

end Behavioral;

