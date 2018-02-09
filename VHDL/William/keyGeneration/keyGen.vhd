----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    14:16:36 01/24/2018 
-- Design Name: 
-- Module Name:    keyGen - Behavioral 
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

entity keyGen is
	generic ( subBytesN : integer := 2);
    Port ( keyIn : in  STD_LOGIC_VECTOR (7 downto 0);
           CLK : in  STD_LOGIC;
           RST : in  STD_LOGIC;
           INV : in  STD_LOGIC;
           --Start : in  STD_LOGIC;
			  CE : in STD_LOGIC;
           setupce : in  STD_LOGIC;
			  keyInEn : in STD_LOGIC;
			  done : out STD_LOGIC;
           keyout : out  STD_LOGIC_VECTOR (7 downto 0)
			  );
end keyGen;



architecture Behavioral of keyGen is

--component key_counter_v2 is
--	generic ( Ncycles : integer := 2);
--    Port ( rst : in  STD_LOGIC;
--           keyInEn : in  STD_LOGIC;
--           inv : in  STD_LOGIC;
--           start : in  STD_LOGIC;
--           clk : in  STD_LOGIC;
--			  SRLEnable : out STD_LOGIC;
--			  addrEnable : out STD_LOGIC;
--			  runAll  : out STD_LOGIC;
--			  RConEn  : out STD_LOGIC;
--			  RConSel : out STD_LOGIC;
--			  FRowSel : out STD_LOGIC;
--			  invDelSel : out STD_LOGIC;
--			  done : out STD_LOGIC
--			  );
--end component;

component keyGenController_v3 is
	generic ( Ncycles : integer := 2);
    Port ( --rst : in  STD_LOGIC;
           ce : in  STD_LOGIC;
           setupce : in  STD_LOGIC;
           keyInEn : in  STD_LOGIC;
           done : out  STD_LOGIC;
           inv : in  STD_LOGIC;
           clk : in  STD_LOGIC;
			  addrEnable : out STD_LOGIC;
			  RConEn  : out STD_LOGIC;
			  RConSel : out STD_LOGIC;
			  FRowSel : out STD_LOGIC
			  );
end component;

component srl16_8 is
    Port ( D : in  STD_LOGIC_VECTOR (7 downto 0);
           CE : in  STD_LOGIC;
           CLK : in  STD_LOGIC;
           Addr : in  STD_LOGIC_VECTOR (3 downto 0);
           Q : out  STD_LOGIC_VECTOR (7 downto 0);
           Q15 : out  STD_LOGIC_VECTOR (7 downto 0));
end component;

component addr_gen is
    Port ( 
			  --genEn : in STD_LOGIC;--------------------
           en : in  STD_LOGIC;
           inv : in  STD_LOGIC;
           rst : in  STD_LOGIC;
           clk : in  STD_LOGIC;
           addr : out  STD_LOGIC_VECTOR (3 downto 0));
end component;

component SUBBYTES is
    port (CLK    : in  std_logic;
          RESET  : in  std_logic;
          XIN    : in  std_logic_vector( 7 downto 0 );
          YOUT   : out std_logic_vector( 7 downto 0) );
end component SUBBYTES;

component RCon_gen is
    Port ( en : in  STD_LOGIC;
           clk : in  STD_LOGIC;
           --rst : in  STD_LOGIC;
           INV : in  STD_LOGIC;
           rcon : out  STD_LOGIC_VECTOR (7 downto 0));
end component;

--signal SrlEn : STD_LOGIC ;
signal RConEn : STD_LOGIC ;
signal AddrEn : STD_LOGIC ;
--signal shiftEn : STD_LOGIC ;
signal newKey  : STD_LOGIC_VECTOR (7 downto 0) ;
signal QAddr  : STD_LOGIC_VECTOR (7 downto 0) ;
signal Q15  : STD_LOGIC_VECTOR (7 downto 0) ;
signal SubOut  : STD_LOGIC_VECTOR (7 downto 0) ;
signal Rcon  : STD_LOGIC_VECTOR (7 downto 0) ;
signal RconOut  : STD_LOGIC_VECTOR (7 downto 0) ;
signal RconSel : STD_LOGIC ;
signal QAddrFirst  : STD_LOGIC_VECTOR (7 downto 0) ;
signal QMux  : STD_LOGIC_VECTOR (7 downto 0) ;
signal calcKey  : STD_LOGIC_VECTOR (7 downto 0) ;
signal Addr  : STD_LOGIC_VECTOR (3 downto 0) ;
signal FRowSel : STD_LOGIC;
--signal genEn : STD_LOGIC;
--signal invDelSel : STD_LOGIC;
--signal invDelKey  : STD_LOGIC_VECTOR (7 downto 0) ;
constant invDelAddrI : integer := subBytesN -1;
constant invDelAddr  : std_logic_vector (3 downto 0) := std_logic_vector(to_unsigned(invDelAddrI, 4));
signal QAddrDel  : STD_LOGIC_VECTOR (7 downto 0) ;
--signal FQMux  : STD_LOGIC_VECTOR (7 downto 0) ;
--signal invQMux  : STD_LOGIC_VECTOR (7 downto 0) ;


begin
--controller : key_counter_v2--------------------------------------------------------
--	generic map ( Ncycles => 2)
--    Port map (   rst => rst,
--					  done => done,
--					  keyInEn => keyInEn,
--					  start => start,
--					  inv => inv,
--					  clk => clk,
--					  SRLEnable => SrlEn,
--					  addrEnable => AddrEn,
--					  runAll  => genEn,
--					  RConEn  => RConEn,
--					  RConSel => RconSel,
--					  FRowSel => FRowSel,
--					  invDelSel => invDelSel);

controller : keyGenController_v3 
	generic map ( Ncycles => 2)
    Port map ( --rst : in  STD_LOGIC;
           keyInEn  => keyInEn ,
           ce  => CE ,
           setupce  => setupCE ,
           done  => done ,
           inv  => inv ,
           clk  => clk ,
			  addrEnable  => AddrEn ,
			  RConEn   => RConEn ,
			  RConSel  => RConSel ,
			  FRowSel  => FRowSel
			  );
			  
keyStore : srl16_8 
    Port map ( D => newKey ,
           CE => CE,
           CLK => clk,
           Addr => Addr,
           Q  => QAddr,
           Q15  => Q15 );

addr_generator : addr_gen 
    Port map ( 
			  --genEn => genEn,
           en => AddrEn,
           inv => inv,
           rst => rst,
           clk => clk,
           addr => addr );

subByte : SUBBYTES 
    port map (CLK    => clk,
          RESET  => rst,
          XIN    => QAddr,
          YOUT   => SubOut );

RCon_generator : RCon_gen
    Port map ( en => RConEn ,
           clk => clk,
           --rst => rst,
           INV => INV,
           rcon => Rcon );
			  
QAddrDelayer : srl16_8 
    Port map ( D => QAddr ,
           CE => CE, 
           CLK => clk,
           Addr => invDelAddr,
           Q  => QAddrDel 
           --Q15  => Q15 
			  );
			    
	keyOut <= newKey;
	newKey <= keyIn when keyInEn = '1' else 
				 calcKey;
	--shiftEn <= keyInEn or srlEn;---------------------------
	RConOut <= subOut xor RCon;
	QAddrFirst <= RConOut when RConSel = '1' else
					  subOut;
--	FQMux <= QAddrFirst when FRowSel = '1' else
--			   QAddr;
	QMux <= QAddrDel when FRowSel = '0' else
				  QaddrFirst;
--	QMux <= FQMux when inv = '0' else
--			  invQMux;
	calcKey <= Q15 xor QMux;
   
end Behavioral;

