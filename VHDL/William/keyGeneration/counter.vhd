----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    22:13:27 02/05/2018 
-- Design Name: 
-- Module Name:    counter - Behavioral 
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
--library UNISIM;
--use UNISIM.VComponents.all;

entity counter is
    Port ( ce : in  STD_LOGIC;
           clk : in  STD_LOGIC;
           inv : in  STD_LOGIC;
           genCE: in  STD_LOGIC;
           genInv : in  STD_LOGIC;
           keyInEn : in  STD_LOGIC;
           done32 : out  STD_LOGIC;
           RInEn : out  STD_LOGIC;
           addrOutSel : out  STD_LOGIC;
           invTrans : out  STD_LOGIC;
           rst : in  STD_LOGIC;
           roundDone : out  STD_LOGIC;
           addr : out  STD_LOGIC_VECTOR (3 downto 0);
           roundCounter : out  STD_LOGIC_VECTOR (3 downto 0)
			  );
end counter;

architecture Behavioral of counter is
signal counterVal : STD_LOGIC_VECTOR (3 downto 0) := "0000";
signal roundCounterR : STD_LOGIC_VECTOR (3 downto 0) := "0000";
signal roundCounterTemp : STD_LOGIC_VECTOR (3 downto 0);
signal RInEnF : STD_LOGIC;
signal RInEnI : STD_LOGIC;
signal roundCount : STD_LOGIC := '0';
signal halfRoundDone : STD_LOGIC;
signal genInvRoundCount : STD_LOGIC;
begin
	process (clk) 
	begin
		if rising_edge(clk) then
			if ce = '1' then
				counterVal <= std_logic_vector(unsigned(counterVal) + 1);
			elsif rst = '1' or counterVal = "1111" then
				counterVal <= "0000";
			else
				counterVal <= counterVal;
			end if;
		end if;
	end process;
	
	process (clk) 
	begin
		if rising_edge(clk) then
			if ce = '1' and genInvRoundCount = '1' and halfRoundDone = '1' then
				roundCounterR <= std_logic_vector(unsigned(roundCounterR) + 1);
			elsif rst = '1' or roundCounterR = "1011" then
				roundCounterR <= "0000";
			else
				roundCounterR <= roundCounterR;
			end if;
		end if;
	end process;
	
	process (clk) 
	begin
		if rising_edge(clk) and ce = '1'then
			if (rst = '1') or ((roundCount = '1') and (halfRoundDone = '1')) then
				roundCount <= '0';
			elsif halfRoundDone = '1' then
				roundCount <= '1';
			else 
				roundCount <= roundCount;
			end if;
		end if;
	end process;
	
	roundCounter <= roundCounterTemp;
	roundCounterTemp <= roundCounterR when genInv = '0' else
						 std_logic_vector(9-unsigned(roundCounterR));
	addr <= counterVal when keyInEn = '1' and inv = '1' else
			not counterVal;

	halfRoundDone <= '1' when counterVal = "1111" else 
							'0';
	done32 <= genInvRoundCount and halfRoundDone;
	roundDone <= '1' when roundCounterR = "1011" else
						'0';
	RInEn <= RInEnF when inv = '0' else
				RInEnI;
	
	RInEnF <= '1' when (roundCounterTemp = x"b" or roundCounterTemp = x"0") and roundCount = '0' and genCE = '1' else
					'0';
	RInEnI <= '1' when (((roundCounterTemp = x"f") and inv = '1' and roundCount = '1') or (roundCounterTemp = x"a" and genInvRoundCount = '1'))  and genCE = '1' else
					'0';
	invTrans <= '1' when (roundCounterR = x"a" and roundCount = '1' and inv = '1') else
					'0';
	genInvRoundCount <= roundCount ; -- xor genInv;
	addrOutSel <= not genInvRoundCount;
end Behavioral;

