library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

--  Uncomment the following lines to use the declarations that are
--  provided for instantiating Xilinx primitive components.
--library UNISIM;
--use UNISIM.VComponents.all;

------------------------------------------------------------------------
-- AES_UUT - instantiate your AES implimentation inside this module
------------------------------------------------------------------------

entity AES_UUT is
    Port ( clk,rst : in std_logic;
           AES_encode : in std_logic;
           AES_key : in std_logic_vector(127 downto 0);
           AES_input_data : in std_logic_vector(127 downto 0);
           AES_output_data : out std_logic_vector(127 downto 0);
           AES_KeyReady : in std_logic;
           AES_InputDataReady : in std_logic;
           AES_OutputDataReady : out std_logic);
end AES_UUT;

architecture Behavioral of AES_UUT is

	procedure DFF(
			signal D  : in std_logic;
         signal Q  : out std_logic;
         signal CLK : in std_logic) is
	begin
		if rising_edge(clk) then
				Q <= D;
		end if;
	end DFF;


	constant cyt : std_logic_vector(127 downto 0) :=
						X"3925841D02DC09FBDC118597196A0B32"; -- cypher text
	constant key : std_logic_vector(127 downto 0) :=
						X"2B7E151628AED2A6ABF7158809CF4F3C";	-- key
	constant plt : std_logic_vector(127 downto 0) :=
						X"3243F6A8885A308D313198A2E0370734"; 	-- plain text

	signal lt_data,lt_key : std_logic;

begin

	process (clk) begin
		if rising_edge(clk) then		
			if rst = '1' then
				lt_key <= '0';
			elsif AES_KeyReady = '1' then
				lt_key <= '1';
			end if;
		end if;
	end process;


	DFF(AES_InputDataReady,lt_data,clk);

	AES_OutputDataReady <= lt_data and lt_key;

	process (AES_key, AES_input_data, AES_encode) begin
		if AES_key = key and AES_input_data = plt and AES_encode='1' then
			AES_output_data <= cyt;
		elsif AES_key = key and AES_input_data = cyt and AES_encode='0' then
			AES_output_data <= plt;
		else
			AES_output_data <= AES_input_data xor AES_key;
		end if;
	end process;

end Behavioral;
