----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    15:43:07 03/02/2018 
-- Design Name: 
-- Module Name:    subbytes_fwd_ppd - Behavioral 
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

entity subbytes_fwd_ppd is
    Port ( d : in  STD_LOGIC_VECTOR (7 downto 0);
           q : out  STD_LOGIC_VECTOR (7 downto 0);
           clk : in  STD_LOGIC;
           reset : in  STD_LOGIC);
end subbytes_fwd_ppd;

architecture Behavioral of subbytes_fwd_ppd is
-- Defeine all the components to be used
	component delta_mat is
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

	component invdlt_aff is
    Port ( d : in  STD_LOGIC_VECTOR (7 downto 0);
           q : out  STD_LOGIC_VECTOR (7 downto 0);
           clk : in  STD_LOGIC;
           reset : in  STD_LOGIC);
end component;

--Define the signals to be used in the system
	signal dlt : STD_LOGIC_VECTOR (7 downto 0);
	signal ff_1 : STD_LOGIC_VECTOR (7 downto 0) := "00000000";
	signal mu_inv : STD_LOGIC_VECTOR (7 downto 0);
	signal ff_2 : STD_LOGIC_VECTOR (7 downto 0) := "00000000";
	signal i_dlt_aff : STD_LOGIC_VECTOR (7 downto 0);
	signal ff_3 : STD_LOGIC_VECTOR (7 downto 0) := "00000000";

begin
	--Perform the delta transformation on the input to transfor it to the GF
	dlt_tran : delta_mat
			Port map( d => d,
				  q => dlt,
				  clk => clk,
				  reset =>reset );
				  
	--Insert a flipflop here 
	process(clk) begin 
		if rising_edge(clk) then 
			ff_1 <= dlt;
		end if;
	end process;
	
	--Perform multiplicative inversion 			  
	mul_i : mux_inv
			Port map( d => ff_1,
				  q => mu_inv,
				  clk => clk,
				  reset =>reset );
				  
	--Implement a second flipflop here
	process(clk) begin 
		if rising_edge(clk) then 
			ff_2 <= mu_inv;
		end if;
	end process;
	
	--Perform the inverse delta transformation and affine transformaation		 
	i_dltafft : invdlt_aff
		Port map( d => ff_2,
			  q => i_dlt_aff,
			  clk => clk,
			  reset =>reset );
			  
	--Implement the last flipflop
	process(clk) begin 
		if rising_edge(clk) then 
			ff_3 <= i_dlt_aff;
		end if;
	end process;
	
	--Load the flipflop into the output 
	q <= ff_3;


end Behavioral;

