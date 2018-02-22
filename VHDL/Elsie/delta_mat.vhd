----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    14:49:24 02/16/2018 
-- Design Name: 
-- Module Name:    delta_mat - Behavioral 
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

entity delta_mat is
    Port ( d : in  STD_LOGIC_VECTOR (7 downto 0);
           q : out  STD_LOGIC_VECTOR (7 downto 0);
           clk : in  STD_LOGIC;
           reset : in  STD_LOGIC);
end delta_mat;

architecture Behavioral of delta_mat is

begin
	--Multipy the input by the delta matrix to tranform it into the GF domain 
	q(0) <= d(0) xor d(1) xor d(6);
	q(1) <= d(1) xor d(4) xor d(6);
	q(2) <= d(1) xor d(2) xor d(3) xor d(4) xor d(7);
	q(3) <= d(1) xor d(2) xor d(6) xor d(7); 
	q(4) <= d(1) xor d(2) xor d(3) xor d(5) xor d(7);
	q(5) <= d(2) xor d(3) xor d(5) xor d(7); 
	q(6) <= d(1) xor d(2) xor d(3) xor d(4) xor d(6) xor d(7);
	q(7) <= d(5) xor d(7); 


end Behavioral;

