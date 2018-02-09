----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    14:29:43 02/06/2018 
-- Design Name: 
-- Module Name:    topController - Behavioral 
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

entity topController is
    Port ( keyIn : in  STD_LOGIC_VECTOR (7 downto 0);
           keyInEn : in  STD_LOGIC;
           inv : in  STD_LOGIC;
           stop : in  STD_LOGIC;
           clk : in  STD_LOGIC;
           rst : in  STD_LOGIC;
           keyOut : out  STD_LOGIC_VECTOR (7 downto 0));
end topController;

architecture Behavioral of topController is

component invF_gen is
    Port ( en : in  STD_LOGIC;
           clr : in  STD_LOGIC;
           inv : in  STD_LOGIC;
           clk : in  STD_LOGIC;
           rst : in  STD_LOGIC;
           invF : out  STD_LOGIC);
end component;

component CEGen is
    Port ( keyInEn : in  STD_LOGIC;
           stop : in  STD_LOGIC;
           done : in  STD_LOGIC;
           clk : in  STD_LOGIC;
           ce : out  STD_LOGIC);
end component;

component setupCEgen is
    Port ( inv : in  STD_LOGIC;
           clk : in  STD_LOGIC;
           setupce : out  STD_LOGIC);
end component;

component keyStoreExt is
    Port ( keyIn : in  STD_LOGIC_VECTOR (7 downto 0);
           ce : in  STD_LOGIC;
           inv : in  STD_LOGIC;
           start : in  STD_LOGIC;
           clk : in  STD_LOGIC;
           rst : in  STD_LOGIC;
           keyOut : out  STD_LOGIC_VECTOR (7 downto 0));
end component;

component keyGen is
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
end component;

component counter_srl is
	generic ( endVal : integer := 10);
    Port ( ce : in  STD_LOGIC;
           clk : in  STD_LOGIC;
           q : out  STD_LOGIC);
end component;

--component delay is
--	generic ( del : integer := 2 ) ;
--    Port ( D : in  STD_LOGIC;
--           CLK : in  STD_LOGIC;
--           Q : out  STD_LOGIC);
--end component;

--component startBlockgen is
--    Port ( roundDone : in  STD_LOGIC;
--			  startShift : in  STD_LOGIC;
--           rst : in  STD_LOGIC;
--           clk : in  STD_LOGIC;
--           startBlock : out  STD_LOGIC);
--end component;

component pulse_extender is
	generic ( del : integer := 16 ) ;
    Port ( d : in  STD_LOGIC;
           q : out  STD_LOGIC;
           clk : in  STD_LOGIC;
           rst : in  STD_LOGIC);
end component;

--component invRstGen is
--    Port ( invF : in  STD_LOGIC;
--           clk : in  STD_LOGIC;
--           invRst : out  STD_LOGIC);
--end component;

constant NCycles : integer := 2;
constant NRounds : integer := 11;
constant sysCycles : integer := 6;

signal storeOut  : STD_LOGIC_VECTOR (7 downto 0) ;
signal genKeyIn  : STD_LOGIC_VECTOR (7 downto 0) ;
signal genKeyOut  : STD_LOGIC_VECTOR (7 downto 0) ;
signal storeIn  : STD_LOGIC_VECTOR (7 downto 0) ;
signal genDone : STD_LOGIC ;
signal roundDone : STD_LOGIC ;
--signal startShift : STD_LOGIC ;
signal RInEn : STD_LOGIC ;
signal genInEn : STD_LOGIC ;
signal storeCE : STD_LOGIC ;
--signal nStart : STD_LOGIC ;
--signal genStart : STD_LOGIC ;
signal invF : STD_LOGIC ;
--signal startBlock : STD_LOGIC ;
signal genInv : STD_LOGIC ;
--signal invRst : STD_LOGIC ;
--signal genRst : STD_LOGIC ;
signal setupce : std_logic;
signal ce : std_logic;
signal counterCE : std_logic;

begin

	invFGen0 : invF_gen
		 Port map ( en => keyInEn ,
				  clr => roundDone ,
				  inv => inv ,
				  clk => clk ,
				  rst => rst ,
				  invF => invF
				  );
				  
	CEGen_0 : CEGen 
		 Port map ( keyInEn => keyInEn ,
				  stop => stop ,
				  done => gendone ,
				  clk => clk ,
				  ce => ce );

	setupCEgen_0 : setupCEgen 
		 Port map ( inv => inv ,
				  clk => clk ,
				  setupce => setupce );

	keyStoreExt0 : keyStoreExt
		 Port map ( keyIn => storeIn ,
				  ce => storeCE ,
				  inv => inv ,
				  start => roundDone ,
				  clk => clk ,
				  rst => rst ,
				  keyOut => storeOut
				  );

	keyGen0 : keyGen
		generic map ( subBytesN => NCycles)
		 Port map ( keyIn => genKeyIn,
				  CLK => clk ,
				  RST => rst ,
				  INV => genInv ,
				  ce => ce ,
				  setupce => setupce ,
				  keyInEn => genInEn ,
				  done => genDone ,
				  keyout => genKeyOut
				  );

	roundCounter : counter_srl
		generic map ( endVal => NRounds)
		 Port map ( ce => counterCE ,
				  clk => clk ,
				  q => roundDone
				  );

--	keyGenDelay : delay
--		generic map ( del => NCycles + sysCycles)
--		 Port map ( D => roundDone ,
--				  CLK => clk ,
--				  Q => startShift
--				  );


--	systemDelay : delay
--		generic map ( del => sysCycles )
--		 Port map ( D => genDone ,
--				  CLK => clk ,
--				  Q => nStart
--				  );
	
--	blockGen : startBlockgen 
--	Port map ( roundDone => roundDone ,
--			  startShift => startShift ,
--           rst => rst ,
--           clk => clk ,
--           startBlock => startBlock
--			  );
	
	RInEnExtender : pulse_extender
		generic map ( del =>	15 ) 
		 Port map ( d => roundDone ,
				  q => RInEn ,
				  clk => clk ,
				  rst => rst
				  );
				  
--	invRstGen0 : invRstGen
--		 Port map ( invF => invF ,
--				  clk =>	clk ,
--				  invRst =>	invRst
--				  );
	
	genKeyIn <= keyIn when keyInEn = '1' else
					storeOut;
	storeIn <= keyIn when invF = '0' else
					genKeyOut;
	genInEn <= keyInEn or RInEn;
	storeCE <= (keyInEn or invF) ;--and not genDone;
	--genStart <= nStart and not startBlock;
	keyOut <= genKeyOut;
	genInv <= inv and not invF;
	--genRst <= invRst or rst;
	counterCE <= genDone and CE;
end Behavioral;

