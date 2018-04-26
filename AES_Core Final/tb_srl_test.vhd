----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    21:07:17 01/23/2018 
-- Design Name: 
-- Module Name:    tb_top_level - Behavioral 
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

entity tb_srl_test is
end tb_srl_test;

architecture Behavioral of tb_srl_test is
	signal keyIn :   STD_LOGIC_VECTOR (7 downto 0) := "00000000";
	signal rst : STD_LOGIC := '0';
	signal clk :   STD_LOGIC := '0';
	signal A0  :   std_ulogic  := '0';
	signal A1  :   std_ulogic  := '0';
	signal A2  :   std_ulogic  := '0';
	signal A3  :   std_ulogic  := '0';
	signal Q15 :  std_ulogic := '0';
	signal Q   :  std_ulogic  := '0';
	signal D   :   std_ulogic := '0';
	signal CE  :   std_ulogic  := '0';
	signal keyOut :   STD_LOGIC_VECTOR (7 downto 0) := "00000000";
	
	component srl_test is
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
	end component;
	
	procedure LOADBYTE (data : in STD_LOGIC_VECTOR(15 downto 0);
							   signal CE  : out STD_LOGIC;
								signal D   : out STD_LOGIC) is
	begin
		report "In LOADBYTE";
		CE <= '1';
		wait for 20ns;
		for i in 0 to data'length-1 loop
			D <= data(i);
			wait for 20ns;
		end loop;
		CE <= '0';
		wait for 20ns;
	end LOADBYTE;	
	
	procedure FLUSHREG ( signal CE  : out STD_LOGIC;
								signal D   : out STD_LOGIC) is
	begin
		report "In FLUSHREG";
		CE <= '1';
		D <= '0';
		for i in 0 to 15 loop
			wait for 20ns;
		end loop;
		CE <= '0';
		wait for 20ns;
	end FLUSHREG;
	
	
	procedure runSeq (data : in STD_LOGIC_VECTOR(15 downto 0);
							   signal CE  : out STD_LOGIC;
								signal D   : out STD_LOGIC) is
	begin
		loadByte("1010101010111001", CE, D);
		report "In runSeq";
		wait for 200ns;
		FLUSHREG(CE,D);
	end runSeq;	
	
begin

	srl_test_inst : srl_test
		port map( 
			  keyIn => keyIn,
           CE => CE,
           rst => rst,
           clk => clk,
			  A0  => A0,
			  A1  => A1,
			  A2  => A2,
			  A3  => A3,
			  Q15 => Q15,
			  Q   => Q,
			  D   => D ,
           keyOut => keyOut
			  );

	
	clk <= not clk after 10 ns;

	runSeq("1010101010111001",CE, D);

end Behavioral;

