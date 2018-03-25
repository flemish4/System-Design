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
           inv : in  STD_LOGIC;
           stop : in  STD_LOGIC;
           keyInEn : in  STD_LOGIC;
           dataInEn : in  STD_LOGIC;
           keyInReady : out  STD_LOGIC;
           dataInReady : out  STD_LOGIC;
           clk : in  STD_LOGIC;
           rst : in  STD_LOGIC;
           keyOut1 : out  STD_LOGIC_VECTOR (7 downto 0);
           keyOut0 : out  STD_LOGIC_VECTOR (7 downto 0);
				dpS0 : out STD_LOGIC;
				dpS1 : out STD_LOGIC;
				dpAdrs : out STD_LOGIC_VECTOR (3 downto 0);
				dpmxclmnen : out STD_LOGIC;
				dpclken : out STD_LOGIC;
				dpshftren : out STD_LOGIC;
				dpsubbytesen : out STD_LOGIC
			  );
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

component FF is
    Port ( en : in  STD_LOGIC;
           clr : in  STD_LOGIC;
           rst : in  STD_LOGIC;
           clk : in  STD_LOGIC;
           q : out  STD_LOGIC);
end component;

component CEGen is
    Port ( keyInEn : in  STD_LOGIC;
           stop : in  STD_LOGIC;
           done : in  STD_LOGIC;
           clk : in  STD_LOGIC;
           ce : out  STD_LOGIC);
end component;

component keyStoreExt is
    Port ( keyIn : in  STD_LOGIC_VECTOR (7 downto 0);
           ce : in  STD_LOGIC;
           addr : in  STD_LOGIC_VECTOR (3 downto 0);
           clk : in  STD_LOGIC;
           rst : in  STD_LOGIC;
           keyOut : out  STD_LOGIC_VECTOR (7 downto 0));
end component;

component delay is
	generic ( del : integer := 2 ) ;
    Port ( D : in  STD_LOGIC;
           CLK : in  STD_LOGIC;
           Q : out  STD_LOGIC);
end component;

component keyGen is
	generic ( subBytesN : integer := 3);
    Port ( keyIn : in  STD_LOGIC_VECTOR (7 downto 0);
           CLK : in  STD_LOGIC;
           RST : in  STD_LOGIC;
           INV : in  STD_LOGIC;
           addrOutSel : in  STD_LOGIC;
           addrOut : in  STD_LOGIC_VECTOR (3 downto 0);
           RConCounter : in  STD_LOGIC_VECTOR (3 downto 0);
			  CE : in STD_LOGIC;
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

component pulse_extender is
	generic ( del : integer := 16 ) ;
    Port ( d : in  STD_LOGIC;
           q : out  STD_LOGIC;
           clk : in  STD_LOGIC;
           rst : in  STD_LOGIC);
end component;


component counter is
    Port ( ce : in  STD_LOGIC;
           clk : in  STD_LOGIC;
           rst : in  STD_LOGIC;
           genInv : in  STD_LOGIC;
           genCE : in  STD_LOGIC;
           inv : in  STD_LOGIC;
           invf : in  STD_LOGIC;
           keyInEn : in  STD_LOGIC;
           genInEn : in  STD_LOGIC;
           storeCEDel1 : in  STD_LOGIC;
           done32 : out  STD_LOGIC;
           invTrans : out  STD_LOGIC;
           addrOutSel : out  STD_LOGIC;
           RInEn : out  STD_LOGIC;
           roundDone : out  STD_LOGIC;
           counterVal : out  STD_LOGIC_VECTOR (3 downto 0);
           upCounter : out  STD_LOGIC_VECTOR (3 downto 0);
           addr : out  STD_LOGIC_VECTOR (3 downto 0);
           roundCounter : out  STD_LOGIC_VECTOR (3 downto 0);
           RConCounter : out  STD_LOGIC_VECTOR (3 downto 0)
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

constant NCycles : integer := 3;
constant NRounds : integer := 11;
constant sysCycles : integer := 6;

signal storeIn  : STD_LOGIC_VECTOR (7 downto 0) ;
signal store0Out  : STD_LOGIC_VECTOR (7 downto 0) ;
signal store1Out  : STD_LOGIC_VECTOR (7 downto 0) ;
signal genKeyIn  : STD_LOGIC_VECTOR (7 downto 0) ;
signal genKeyOut  : STD_LOGIC_VECTOR (7 downto 0) ;
signal delayKeyOut  : STD_LOGIC_VECTOR (7 downto 0) ;
signal store0Addr  : STD_LOGIC_VECTOR (3 downto 0) ;
signal addr  : STD_LOGIC_VECTOR (3 downto 0) ;
signal roundCounter  : STD_LOGIC_VECTOR (3 downto 0) ;
signal RConCounter  : STD_LOGIC_VECTOR (3 downto 0) ;
signal upCounter  : STD_LOGIC_VECTOR (3 downto 0) ;
signal counterVal  : STD_LOGIC_VECTOR (3 downto 0) ;
signal genDone : STD_LOGIC ;
signal roundDone : STD_LOGIC ;
signal RInEn : STD_LOGIC ;
signal genInEn : STD_LOGIC ;
signal storeCE : STD_LOGIC ;
signal invF : STD_LOGIC ;
signal genInv : STD_LOGIC ;
signal genCE : std_logic;
signal counterCE : std_logic;
signal ce : std_logic;
signal addrOutSel : std_logic;
signal invTrans : std_logic;
signal storeCEDel0 : std_logic;
signal storeCEDel1 : std_logic;
signal invTransDel : std_logic;
signal store1InvEnClr : std_logic;
signal store1InvEn : std_logic;
signal store1CE : std_logic;
signal store1CEInv : std_logic;
signal keyInReadySet : std_logic;
signal keyInReadyClr : std_logic;
signal globalCEEnable : std_logic;
signal dataInReadyTemp : std_logic;
signal genCER : std_logic;
signal globalCEClear : std_logic;
signal dataReadyStart : std_logic;
signal dpmxclmnenSet : std_logic;
signal dpshtrenSet : std_logic;
 
begin

	invFGen0 : invF_gen
		 Port map ( en => keyInEn ,
				  clr => roundDone ,
				  inv => inv ,
				  clk => clk ,
				  rst => rst ,
				  invF => invF
				  );
				  
				
	 store1InvEnFF : FF
		 Port map ( en => invF,
				  clr => store1InvEnClr ,
				  rst => rst ,
				  clk => clk ,
				  q => store1InvEn
				  ); 
				  
--	CEGen_0 : CEGen 
--		 Port map ( keyInEn => keyInEn ,
--				  stop => stop ,
--				  done => gendone ,
--				  clk => clk ,
--				  ce => genCE );
	globalCEEnable <= dataInEn and dataInReadyTemp;
	globalCEClear <= '1' when genDone = '1' and upCounter = "1010" else
						  '0';
	genCE <= genCER or globalCEEnable;
	 CE_gen : FF
		 Port map ( en => globalCEEnable,
				  clr => globalCEClear ,
				  rst => rst ,
				  clk => clk ,
				  q => genCER
				  ); 	
				  
--	dataReadyStartClear <= '1' when upCounter = "0001" else
--						  '0';
	 dataReadyStart_gen : FF
		 Port map ( en => keyInReadySet,
				  clr => roundDone ,
				  rst => rst ,
				  clk => clk ,
				  q => dataReadyStart
				  ); 	
	storeCEDelayer0 : delay
	generic map ( del => 16)
    Port map (   D => storeCE,
					  CLK => CLK,
					  q => storeCEDel0);
	storeCEDelayer1 : delay
	generic map ( del => 16)
    Port map (   D => storeCEDel0,
					  CLK => CLK,
					  q => storeCEDel1);
	invTransDelayer : delay
	generic map ( del => 16)
    Port map (   D => invTrans,
					  CLK => CLK,
					  q => invTransDel);

	keyStoreExt0 : keyStoreExt
		 Port map ( keyIn => storeIn ,
				  ce => storeCE ,
				  addr => addr ,
				  clk => clk ,
				  rst => rst ,
				  keyOut => store0Out
				  );
	  
	keyStoreExt1 : keyStoreExt
		 Port map ( keyIn => storeIn ,
				  ce => store1CE ,
				  addr => store0Addr ,
				  clk => clk ,
				  rst => rst ,
				  keyOut => store1Out
				  );

	keyGen0 : keyGen
		generic map ( subBytesN => NCycles)
		 Port map ( keyIn => genKeyIn,
				  CLK => clk ,
				  RST => rst ,
				  INV => genInv ,
				  ce => ce ,
				  addrOutSel => addrOutSel,
				  addrOut => addr,
				  RConCounter => RConCounter,
				  keyInEn => genInEn ,
				  --done => genDone ,
				  keyout => genKeyOut
				  );

--	roundCounter0 : counter_srl
--		generic map ( endVal => NRounds)
--		 Port map ( ce => counterCE ,
--				  clk => clk ,
--				  q => roundDone
--				  );

--	RInEnExtender : pulse_extender
--		generic map ( del =>	15 ) 
--		 Port map ( d => roundDone ,
--				  q => RInEn ,
--				  clk => clk ,
--				  rst => rst
--				  );
	
	counter0 : counter 
		 Port map( ce => gence,
				  clk => clk,
				  rst => rst,
				  genInv => genInv,
				  genCE => genCE,
				  inv => inv,
				  invf => invf,
				  keyInEN => keyInEN,
				  done32 => genDone,
				  addr   => addr,
				  RInEn   => RInEn,
				  invTrans   => invTrans,
				  addrOutSel => addrOutSel,
				  storeCEDel1 => storeCEDel1,
				  roundCounter => roundCounter,
				  counterVal => counterVal,
				  upCounter => upCounter,
				  RConCounter => RConCounter,
				  roundDone => roundDone,
				  genInEn => genInEn
				  );
	
	keyDelay	 : srl16_8 
		 Port map ( D => genKeyOut ,
				  CE => genCE,
				  CLK => clk,
				  Addr => "0000",
				  --Q  => keyOut
				  Q15  => delayKeyOut 
				  );	
				  
	genKeyIn <= keyIn when keyInEn = '1' else
					store1Out;
	keyOut0 <= store0Out when keyInEn = '0' else
					genKeyOut when invTransDel = '1' else
					keyIn;
	storeIn <= genKeyOut; --keyIn when invF = '0' else
					--genKeyOut;
	genInEn <= keyInEn or RInEn or invTrans;
	storeCE <= (keyInEn or (invF and addroutsel)) ;
	keyOut1 <= genKeyOut when addrOutSel = '1' else
					delayKeyOut;
	genInv <= (inv and not invF)  or (invTrans and invF);
	counterCE <= genDone and genCE;
	ce <= (genCE and (not addroutsel)) or (genInEn and not genInv);
	store0Addr <= not addr when invf = '1' else
						addr;
	store1InvEnClr <= '1' when genInv = '1' and (roundCounter = "1001") and counterce = '1' else
							'0';
	store1CEInv <= '1' when store1InvEn = '1' and ((roundCounter = "1001" and addroutsel = '1') or roundCounter = "1010") else
						'0';
	store1CE <= store1CEInv when (inv = '1') else
					storeCEDel1;
					
	-- External Control signals
	
	dataInReadyTemp <= '1' when (((upCounter = "1011") or (upCounter = "0001" and dataReadyStart = '0') or (upCounter = "0000" )) and ((genInv = '1') or (inv = '0'))) else
							 '0';
	dataInReady <= dataInReadyTemp;
	keyInReadySet <= not genCE;		
	keyInReadyClr <= 	'1' when counterVal = x"F" else
							'0';
	keyInReadyFF : FF
		Port map ( 	en => keyInReadySet,
						clr => keyInReadyCLr ,
						rst => rst ,
						clk => clk ,
						q => keyInReady
						); 
	
	dpadrs <= "1101" when inv = '0' else
			  "1001";
	dpsubBytesEn <= genCE;
	dpclkEn <= genCE;
	dps0 <= dataInReadyTemp and dataInEn;
	
	dpshtrenSet <= '1' when counterVal = "0010" else '0';
	dpshftrenGen : FF
		Port map ( 	en => dpshtrenSet,
						clr => '0' ,
						rst => rst ,
						clk => clk ,
						q => dpshftren
						); 
	dpmxclmnenSet <= '1' when counterVal = "1100" else '0';
	dpmxclmnenGen : FF
		Port map ( 	en => dpmxclmnenSet,
						clr => '0' ,
						rst => rst ,
						clk => clk ,
						q => dpmxclmnen
						); 
	
end Behavioral;

