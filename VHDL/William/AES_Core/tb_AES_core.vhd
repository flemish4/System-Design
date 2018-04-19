-- TestBench Template 

  LIBRARY ieee;
  USE ieee.std_logic_1164.ALL;
  USE ieee.numeric_std.ALL;

  ENTITY testbench IS
  END testbench;

  ARCHITECTURE behavior OF testbench IS 

  -- Component Declaration
component AES_core is
    Port ( 
			  dataIn : in  STD_LOGIC_VECTOR (7 downto 0);
           keyIn : in  STD_LOGIC_VECTOR (7 downto 0);
           inv : in  STD_LOGIC;
           clk : in  STD_LOGIC;
           rst : in  STD_LOGIC;
           keyInEn : in  STD_LOGIC;
           dataInEn : in  STD_LOGIC;
           keyInReady : out  STD_LOGIC;
           dataInReady : out  STD_LOGIC;
           q : out  STD_LOGIC_VECTOR (7 downto 0);
           qReady : out  STD_LOGIC
			  );
end component;

			 SIGNAL dataIn : STD_LOGIC_VECTOR (7 downto 0) := "00000000" ;
          SIGNAL keyIn : STD_LOGIC_VECTOR (7 downto 0) := "00000000" ;
          SIGNAL inv :   STD_LOGIC := '0' ;
          SIGNAL clk :   STD_LOGIC := '0' ;
          SIGNAL rst :   STD_LOGIC := '0' ;
          SIGNAL keyInEn :   STD_LOGIC := '0' ;
          SIGNAL dataInEn :   STD_LOGIC := '0' ;
          SIGNAL keyInReady :  STD_LOGIC := '0' ;
          SIGNAL dataInReady :   STD_LOGIC := '0' ;
          SIGNAL q :   STD_LOGIC_VECTOR (7 downto 0) := "00000000" ;
          SIGNAL qReady :   STD_LOGIC := '0' ;
			 
		-- Clock period definitions
		constant clk_period : time := 10 ns;
		-- type definition for 256 word x 8 bit Inverse ROM 
		type vectype is array (0 to 15) of std_logic_vector (7 downto 0);
		-- ROM invrom 
		constant testKey0  : vectype := ( 
			0 => x"54", 
			1 => x"68", 
			2 => x"61", 
			3 => x"74", 
			4 => x"73", 
			5 => x"20", 
			6 => x"6D", 
			7 => x"79", 
			8 => x"20", 
			9 => x"4B", 
			10 => x"75", 
			11 => x"6E", 
			12 => x"67", 
			13 => x"20", 
			14 => x"46", 
			15 => x"75" 
		);

		constant testData0  : vectype := (					

			0 => x"54", 
			1 => x"77", 
			2 => x"6F", 
			3 => x"20", 
			4 => x"4F", 
			5 => x"6E", 
			6 => x"65", 
			7 => x"20", 
			8 => x"4E", 
			9 => x"69", 
			10 => x"6E", 
			11 => x"65", 
			12 => x"20", 
			13 => x"54", 
			14 => x"77", 
			15 => x"6F" 
		);
		
		constant testData1  : vectype := (															

			0 => x"29", 
			1 => x"C3", 
			2 => x"50", 
			3 => x"5F", 
			4 => x"57", 
			5 => x"14", 
			6 => x"20", 
			7 => x"F6", 
			8 => x"40", 
			9 => x"22", 
			10 => x"99", 
			11 => x"B3", 
			12 => x"1A", 
			13 => x"02", 
			14 => x"D7", 
			15 => x"3A" 
		);
  BEGIN

  -- Component Instantiation
core0 : AES_core 
    Port map ( 
			  dataIn => dataIn,
           keyIn => keyIn,
           inv => inv,
           clk => clk,
           rst => rst,
           keyInEn => keyInEn,
           dataInEn => dataInEn,
           keyInReady => keyInReady,
           dataInReady => dataInReady,
           q => q,
           qReady => qReady
			  );

   -- Clock process definitions
   clk_process :process
   begin
		clk <= '0';
		wait for clk_period/2;
		clk <= '1';
		wait for clk_period/2;
   end process;
	
	
  --  Test Bench Statements
     key : PROCESS
     BEGIN
			inv <= '1'; ----- optional 
			--rst <= '1'; 
			wait for 20 ns;
			--rst <= '0';
			wait for 20 ns;
		  wait for 60 ns; -- wait until global set/reset completes
			wait for clk_period * 0.50001;
			
			while True loop
				if keyInReady = '1' then
					wait for CLK_period *3;
					keyInEn <= '1';
					for i in 0 to 15 loop
						keyIn <= testKey0(i);
						wait for CLK_period;
					end loop;
					keyInEn <= '0';
					wait for CLK_period;
				else
					wait for CLK_period;
				end if;
			end loop;

        -- Add user defined stimulus here

        --wait; -- will wait forever
     END PROCESS key;	
	  
  --  Test Bench Statements
     data : PROCESS
     BEGIN

        wait for 100 ns; -- wait until global set/reset completes
			wait for clk_period * 0.50001;
			while True loop
				if dataInReady = '1' then
					wait for CLK_period *3;
					dataInEn <= '1';
					for j in 0 to 15 loop
						if inv = '0' then
							dataIn <= testData0(j); --- testData0 for forward
						else 
							dataIn <= testData1(j); --- testData0 for forward
						end if;	
						wait for CLK_period;
					end loop;
					for j in 0 to 15 loop
						if inv = '0' then
							dataIn <= testData0(j); --- testData0 for forward
						else 
							dataIn <= testData1(j); --- testData0 for forward
						end if;	
						wait for CLK_period;
					end loop;
					dataInEn <= '0';
					wait for CLK_period;
				else
					wait for CLK_period;
				end if;
			end loop;

        -- Add user defined stimulus here

        --wait; -- will wait forever
     END PROCESS data;

  END;
