----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    14:16:00 01/23/2018 
-- Design Name: 
-- Module Name:    top_level - Behavioral 
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
Library UNISIM;
use UNISIM.vcomponents.all;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;
-- SRLC16E: 16-bit cascable shift register LUT with clock enable operating on posedge of clock
-- Spartan-3
-- Xilinx HDL Libraries Guide, version 14.
	
entity top_level is
	 Port ( keyIn : in  STD_LOGIC_VECTOR (7 downto 0);
			  rst : in  STD_LOGIC;
			  clk : in  STD_LOGIC;
			  A0  : in  std_ulogic ;
			  A1  : in  std_ulogic ;
			  A2  : in  std_ulogic ;
			  A3  : in  std_ulogic ;
			  Q15 : out std_ulogic ;
			  Q   : out std_ulogic ;
			  D   : in  std_ulogic ;
			  CE  : in  std_ulogic ;
			  keyOut : out  STD_LOGIC_VECTOR (7 downto 0));
end top_level;
architecture Behavioral of top_level is

begin
	SRLC16E_inst : SRLC16E
	generic map (
		INIT => X"0000")
	port map (
		Q => Q, -- SRL data output
		Q15 => Q15, -- Carry output (connect to next SRL)
		A0 => A0, -- Select[0] input
		A1 => A1, -- Select[1] input
		A2 => A2, -- Select[2] input
		A3 => A3, -- Select[3] input
		CE => CE, -- Clock enable input
		CLK => CLK, -- Clock input
		D => D -- SRL data input
	);
	-- End of SRLC16E_inst instantiation

	

end Behavioral;

