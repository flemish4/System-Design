----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    18:34:30 02/08/2018 
-- Design Name: 
-- Module Name:    setupCEgen - Behavioral 
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

entity setupCEgen is
    Port ( inv : in  STD_LOGIC;
           clk : in  STD_LOGIC;
           doneInvF : in  STD_LOGIC;
           invDone : out  STD_LOGIC;
           setupce : out  STD_LOGIC);
end setupCEgen;

architecture Behavioral of setupCEgen is
constant addrI : integer := 3;
constant addr  : std_logic_vector (3 downto 0) := std_logic_vector(to_unsigned(addrI, 4));
signal invDel : std_logic := '0';
signal posEdge : std_logic;
signal negEdge : std_logic;
signal anyEdge : std_logic;
signal anyDelOut : std_logic;
signal setupCER : std_logic := '0';
signal delayCE : std_logic;
signal Q : std_logic;
signal Q15 : std_logic;
begin
	-- Handle inv delay
	process (clk) begin
		if rising_edge(clk) then
			invDel <= inv;
		end if;
	end process;
	
	-- Handle running FF
	process (clk) begin
		if rising_edge(clk) then
			if negEdge = '1' or doneInvF then
				setupCER <= '1';
			elsif anyDelOut = '1' then
				setupCER <= '0';
			else 
				setupCER <= setupCER;
			end if;
		end if;
	end process;

	SRLC16E_0 : SRLC16E 
	generic map (
		INIT => x"0000")
	port map (
		Q => Q, -- SRL data output
		Q15 => Q15, -- Carry output 
		A0 => addr(0), -- Select[0] input
		A1 => addr(1), -- Select[1] input
		A2 => addr(2), -- Select[2] input
		A3 => addr(3), -- Select[3] input
		CE => delayCE, -- Clock enable input
		CLK => CLK, -- Clock input
		D => posEdge -- SRL data input
	);	

	--posEdge <= inv and not invDel;
	negEdge <= invDel and not inv;
	--anyEdge <= posEdge or negEdge;
	delayCE <= anyEdge or setupCER;
	anyDelOut <= Q or Q15;
	setupCE <= negedge or setupCER;
	invDone <= Q;
end Behavioral;

