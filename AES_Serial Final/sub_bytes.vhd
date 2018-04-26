----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    22:23:22 02/20/2018 
-- Design Name: 
-- Module Name:    sub_bytes - Behavioral 
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

entity sub_bytes is
    Port ( d : in  STD_LOGIC_VECTOR (7 downto 0);
           q : out  STD_LOGIC_VECTOR (7 downto 0);
           sel : in  STD_LOGIC;
           clk : in  STD_LOGIC;
           reset : in  STD_LOGIC);
end sub_bytes;

architecture Behavioral of sub_bytes is
	--Define the subbyte encrypt and decrypt subblocks
		component subbytes_forward is
		 Port ( d : in  STD_LOGIC_VECTOR (7 downto 0);
				  q : out  STD_LOGIC_VECTOR (7 downto 0);
				  clk : in  STD_LOGIC;
				  reset : in  STD_LOGIC);
		end component;

		component subbytes_inverse is
		 Port ( d : in  STD_LOGIC_VECTOR (7 downto 0);
				  q : out  STD_LOGIC_VECTOR (7 downto 0);
				  clk : in  STD_LOGIC;
				  reset : in  STD_LOGIC);
		end component;

	--Define signals to be used 
	signal en : STD_LOGIC_VECTOR (7 downto 0);
	signal dec : STD_LOGIC_VECTOR (7 downto 0);

begin
	-- Pass the input to the forward (encrypt) and reverse (decrypt) components 
			encrpt : subbytes_forward
				Port map( d => d,
					  q => en,
					  clk => clk,
					  reset =>reset );
					  
			decrpt : subbytes_inverse
				 Port map( d => d,
					  q => dec,
					  clk => clk,
					  reset =>reset );
	
	--Implement a multiplexer
	q <= en when (sel= '0' )
	else 
	  dec;


end Behavioral;

