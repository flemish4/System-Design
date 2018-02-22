----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    22:57:22 02/18/2018 
-- Design Name: 
-- Module Name:    subbytes_inverse - Behavioral 
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

entity subbytes_inverse is
    Port ( d : in  STD_LOGIC_VECTOR (7 downto 0);
           q : out  STD_LOGIC_VECTOR (7 downto 0);
           clk : in  STD_LOGIC;
           reset : in  STD_LOGIC);
end subbytes_inverse;

architecture Behavioral of subbytes_inverse is
-- Define all the component subblocks that will be used 
	component delta_mat is
    Port ( d : in  STD_LOGIC_VECTOR (7 downto 0);
           q : out  STD_LOGIC_VECTOR (7 downto 0);
           clk : in  STD_LOGIC;
           reset : in  STD_LOGIC);
end component;

	component inv_delta is
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

component mux_inv is
    Port ( d : in  STD_LOGIC_VECTOR (7 downto 0);
           q : out  STD_LOGIC_VECTOR (7 downto 0);
           clk : in  STD_LOGIC;
           reset : in  STD_LOGIC);
end component;

--define intermediate signals to be used in between 
	signal del : STD_LOGIC_VECTOR (7 downto 0);
	signal mi : STD_LOGIC_VECTOR (7 downto 0);
	signal in_del : STD_LOGIC_VECTOR (7 downto 0);
	signal in_aff : STD_LOGIC_VECTOR (7 downto 0);

begin
	-- Perfom the affine transformaion to complete the subbyte step		  
	in_af : inv_affine
		Port map( d => d,
           q => in_aff,
           clk => clk,
           reset =>reset );
			  
	--Perform the delta transformation on the input to transfor it to the GF
	dlt : delta_mat
		Port map( d => in_aff,
           q => del,
           clk => clk,
           reset =>reset );
			  
	--Perform multiplicative inversion 			  
	mux_i : mux_inv
		Port map( d => del,
           q => mi,
           clk => clk,
           reset =>reset );
			  
	--Perform the inverse delta transformation to convert back ti GF(2^8)		 
	inv_dlt : inv_delta
	Port map( d => mi,
		  q => in_del,
		  clk => clk,
		  reset =>reset );
		  
	-- Pass the result to the output			  
	q <= in_del;


end Behavioral;

