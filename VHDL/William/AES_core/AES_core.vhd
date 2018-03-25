----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    23:34:21 03/22/2018 
-- Design Name: 
-- Module Name:    AES_core - Behavioral 
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

entity AES_core is
    Port ( dataIn : in  STD_LOGIC_VECTOR (7 downto 0);
           keyIn : in  STD_LOGIC_VECTOR (7 downto 0);
           inv : in  STD_LOGIC;
           clk : in  STD_LOGIC;
           rst : in  STD_LOGIC;
           keyInEn : in  STD_LOGIC;
           dataInEn : in  STD_LOGIC;
           keyInReady : out  STD_LOGIC;
           dataInReady : out  STD_LOGIC;
           q : out  STD_LOGIC_VECTOR (7 downto 0);
           qReady : out  STD_LOGIC);
end AES_core;

architecture Behavioral of AES_core is
component datapath is
    Port ( data : in  STD_LOGIC_VECTOR (7 downto 0);
           key0 : in  STD_LOGIC_VECTOR (7 downto 0);
           key1 : in  STD_LOGIC_VECTOR (7 downto 0);
           s0 : in  STD_LOGIC;
           s1 : in  STD_LOGIC;
           adrs : in  STD_LOGIC_VECTOR (3 downto 0);
           shft_r_en : in  STD_LOGIC;
           subBytesEn : in  STD_LOGIC;
           inv_en : in  STD_LOGIC;
           mx_clmn_en : in  STD_LOGIC;
           q : out  STD_LOGIC_VECTOR (7 downto 0);
           clk : in  STD_LOGIC;
           clk_en : in  STD_LOGIC;
           reset : in  STD_LOGIC);
end component;
component topController is
    Port ( keyIn : in  STD_LOGIC_VECTOR (7 downto 0);
           keyInEn : in  STD_LOGIC;
           inv : in  STD_LOGIC;
           stop : in  STD_LOGIC;
           keyInReady : out  STD_LOGIC;
           dataInReady : out  STD_LOGIC;
           dataInEn : in  STD_LOGIC;
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
end component;

signal key0 : STD_LOGIC_VECTOR (7 downto 0);
signal key1 : STD_LOGIC_VECTOR (7 downto 0);
signal dpS0 : STD_LOGIC;
signal dpS1 : STD_LOGIC;
signal dpAdrs : STD_LOGIC_VECTOR (3 downto 0);
signal dpmxclmnen : STD_LOGIC;
signal dpclken : STD_LOGIC;
signal dpshftren : STD_LOGIC;
signal dpsubbytesen : STD_LOGIC;


begin

controller : topController
    Port map ( 
			  keyIn => keyIn ,
           keyInEn => keyInEn ,
           inv  => inv ,
           stop => '0' ,
           keyInReady  => keyInReady ,
           dataInReady => dataInReady ,
           dataInEn => dataInEn ,
           clk => clk ,
           rst => rst ,
           keyOut1 => key0 ,
           keyOut0 => key1 ,
			  dpS0 => dpS0,
			  dpS1 => dpS1,
			  dpAdrs => dpAdrs,
			  dpmxclmnen => dpmxclmnen,
			  dpshftren => dpshftren,
			  dpsubbytesen => dpsubbytesen,
			  dpclken => dpclken
			  );
dataPath0 : datapath 
    Port map( 
	        data => dataIn ,
           key0 => key0 ,
           key1 => key1 ,
           s0 => dpS0 ,
           s1 => dpS1 ,
           adrs => dpAdrs ,
           shft_r_en => dpshftren ,
           subBytesEn => dpsubbytesen ,
           inv_en => inv ,
           mx_clmn_en  => dpmxclmnen ,
           q => q ,
           clk => clk ,
           clk_en => dpclken ,
           reset => rst 
			  );
end Behavioral;

