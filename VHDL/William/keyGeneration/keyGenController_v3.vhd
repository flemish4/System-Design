----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    20:27:46 02/07/2018 
-- Design Name: 
-- Module Name:    keyGenController_v3 - Behavioral 
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
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
library UNISIM;
use UNISIM.VComponents.all;

entity keyGenController_v3 is
	generic ( Ncycles : integer := 2);
    Port ( --rst : in  STD_LOGIC;
           ce : in  STD_LOGIC;
           setupce : in  STD_LOGIC;
           keyInEn : in  STD_LOGIC;
           inv : in  STD_LOGIC;
           clk : in  STD_LOGIC;
           done : out  STD_LOGIC;
			  addrEnable : out STD_LOGIC;
			  RConEn  : out STD_LOGIC;
			  RConSel : out STD_LOGIC;
			  FRowSel : out STD_LOGIC
			  );
end keyGenController_v3;

architecture Behavioral of keyGenController_v3 is

constant FRowAddrI : integer := NCycles -1;
constant FRowAddr  : std_logic_vector (3 downto 0) := std_logic_vector(to_unsigned(FRowAddrI, 4));
constant RConSelFAddrI : integer := 0;
constant RConSelFAddr  : std_logic_vector (3 downto 0) := std_logic_vector(to_unsigned(RConSelFAddrI, 4));

signal SRL0Q15 : STD_LOGIC;
signal SRL0QAddr : STD_LOGIC;
signal SRL1Q15 : STD_LOGIC;
signal SRL1QAddr : STD_LOGIC;

signal doneDel : STD_LOGIC := '0';
signal FRowSelDel : STD_LOGIC := '0';
signal SRL0CE : STD_LOGIC;

begin
	-- Handle done delay
	process (clk) begin
		if rising_edge(clk) and CE = '1' then
			doneDel <= SRL1QAddr;
		end if;
	end process;
	
	-- Handle FRowSel delay
	process (clk) begin
		if rising_edge(clk) and CE = '1' then
			FRowSelDel <= SRL0QAddr;
		end if;
	end process;
	
	SRLC16E_0 : SRLC16E -- generates addrGenEn and FRowSel
		generic map (
			INIT => "1100000000000111")
		port map (
			Q => SRL0QAddr, -- SRL data output
			Q15 => SRL0Q15, -- Carry output 
			A0 => FRowAddr(0), -- Select[0] input
			A1 => FRowAddr(1), -- Select[1] input
			A2 => FRowAddr(2), -- Select[2] input
			A3 => FRowAddr(3), -- Select[3] input
			CE => SRL0CE, -- Clock enable input
			CLK => CLK, -- Clock input
			D => SRL0Q15 -- SRL data input
		);	
		
	SRLC16E_1 : SRLC16E -- generates RConSel and Done
		generic map (
			INIT => "0000000000000001")
		port map (
			Q => SRL1QAddr, -- SRL data output
			Q15 => SRL1Q15, -- Carry output 
			A0 => RConSelFAddr(0), -- Select[0] input
			A1 => RConSelFAddr(1), -- Select[1] input
			A2 => RConSelFAddr(2), -- Select[2] input
			A3 => RConSelFAddr(3), -- Select[3] input
			CE => ce, -- Clock enable input
			CLK => CLK, -- Clock input
			D => SRL1Q15 -- SRL data input
		);		
		
		addrEnable 	<= SRL0Q15 and CE		;
		FRowSel 		<= SRL0QAddr and FRowSelDel	;
		RConSel		<= SRL1QAddr when inv = '0' else
							SRL1Q15;
		done 			<= SRL1Q15;
		RConEn 		<= doneDel and not keyInEn;
		SRL0CE		<= ce or setupce;
end Behavioral;

