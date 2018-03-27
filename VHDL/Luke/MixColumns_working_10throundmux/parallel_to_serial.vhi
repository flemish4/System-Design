
-- VHDL Instantiation Created from source file parallel_to_serial.vhd -- 23:02:39 02/21/2018
--
-- Notes: 
-- 1) This instantiation template has been automatically generated using types
-- std_logic and std_logic_vector for the ports of the instantiated module
-- 2) To use this template to instantiate this entity, cut-and-paste and then edit

	COMPONENT parallel_to_serial
	PORT(
		load : IN std_logic;
		clk : IN std_logic;
		rst : IN std_logic;
		serial_in : IN std_logic_vector(7 downto 0);
		parallel_in : IN std_logic_vector(31 downto 0);          
		serial_out : OUT std_logic_vector(7 downto 0)
		);
	END COMPONENT;

	Inst_parallel_to_serial: parallel_to_serial PORT MAP(
		load => ,
		clk => ,
		rst => ,
		serial_in => ,
		serial_out => ,
		parallel_in => 
	);


