----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    22:31:45 02/18/2018 
-- Design Name: 
-- Module Name:    aff_test - Behavioral 
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

entity aff_test is
    Port ( d : in  STD_LOGIC_VECTOR (7 downto 0);
           q : out  STD_LOGIC_VECTOR (7 downto 0);
           clk  : in  STD_LOGIC;
           reset : in  STD_LOGIC);
end aff_test;

architecture Behavioral of aff_test is
-- Instansiate the affine and inver affine transformation blocks that will be used 
component aff_tran is
    Port ( d : in  STD_LOGIC_VECTOR (7 downto 0);
           q : out  STD_LOGIC_VECTOR (7 downto 0);
           clk : in  STD_LOGIC;
           reset : in  STD_LOGIC);
end component;

component inv_affine is
    Port ( d : in  STD_LOGIC_VECTOR (7 downto 0);
           q : out  STD_LOGIC_VECTOR (7 downto 0);
           clk : in  STD_LOGIC;
           reset : in  STD_LOGIC);
end component;

-- define a signal to be used as in intermediate 
signal i : STD_LOGIC_VECTOR (7 downto 0);

begin

af_t : aff_tran
		Port map( d => d,
           q => i,
           clk => clk,
           reset =>reset );
			  
in_aff : inv_affine 
		Port map( d => i,
           q => q,
           clk => clk,
           reset =>reset );


end Behavioral;

