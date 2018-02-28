----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    17:01:12 02/25/2018 
-- Design Name: 
-- Module Name:    invdlt_aff - Behavioral 
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

entity invdlt_aff is
    Port ( d : in  STD_LOGIC_VECTOR (7 downto 0);
           q : out  STD_LOGIC_VECTOR (7 downto 0);
           clk : in  STD_LOGIC;
           reset : in  STD_LOGIC);
end invdlt_aff;

architecture Behavioral of invdlt_aff is
-- Instansiate the blocks that will be used 
	component inv_delta is
    Port ( d : in  STD_LOGIC_VECTOR (7 downto 0);
           q : out  STD_LOGIC_VECTOR (7 downto 0);
           clk : in  STD_LOGIC;
           reset : in  STD_LOGIC);
end component;

	component aff_tran is
    Port ( d : in  STD_LOGIC_VECTOR (7 downto 0);
           q : out  STD_LOGIC_VECTOR (7 downto 0);
           clk : in  STD_LOGIC;
           reset : in  STD_LOGIC);
end component;
--define an intermediate signal to be used in between 
	signal i : STD_LOGIC_VECTOR (7 downto 0);

begin
		-- Pass the input into the inv_delta matrix 
		inv_dlt : inv_delta
		Port map( d => d,
           q => i,
           clk => clk,
           reset =>reset );
			  
		-- Pass the output of the inv_delta matrix to the affine transformation	  
		af_t : aff_tran
		Port map( d => i,
           q => q,
           clk => clk,
           reset =>reset );
			  
end Behavioral;

