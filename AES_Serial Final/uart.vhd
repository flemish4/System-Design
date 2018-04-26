library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

--  Uncomment the following lines to use the declarations that are
--  provided for instantiating Xilinx primitive components.
--library UNISIM;
--use UNISIM.VComponents.all;


------------------------------------------------------------------------
-- This module impliments a serial I/O Universal Asynchronous Receiver
-- Transmitter (UART).  It provides a wrapper for the Xilinx code and is
-- used to simplify the top level definition.
------------------------------------------------------------------------
-- Version: 1.01, Apr 2016
-- Written: T. Good, University of Sheffield
------------------------------------------------------------------------


entity uart is
	 Generic ( Clock_Frequency_Hz : integer );
    Port ( clk,rst : in std_logic;  -- clock & reset signals
	 		  TxD : out std_logic;  	-- serial data for transmission
           RxD : in std_logic;		-- serial data for reception
           TxDataByte : in  std_logic_vector(7 downto 0); -- data byte to transmit
           RxDataByte : out std_logic_vector(7 downto 0); -- data byte received
			  TxDataStrobe : in std_logic; -- control line: transmit this byte
			  RxDataStrobe : in std_logic;  -- control line: acknowledge received byte
           --TxBufferFull : out std_logic; -- status line: transmit buffer is full
           RxDataReady : out std_logic); -- status line: data recieved and ready for reading
end uart;

architecture RTL of uart is

------------------------------------------------------------------------
-- Component Declarations
------------------------------------------------------------------------

	component uart_clock
	 Generic ( Clock_Frequency_Hz : integer );
    Port ( clk : in std_logic;
           en_16_x_baud : out std_logic);
	end component;

component uart_tx6 is
  Port (             data_in : in std_logic_vector(7 downto 0);
                en_16_x_baud : in std_logic;
                  serial_out : out std_logic;
                buffer_write : in std_logic;
         buffer_data_present : out std_logic;
            buffer_half_full : out std_logic;
                buffer_full : out std_logic;
                buffer_reset : in std_logic;
                         clk : in std_logic);
  end component;
  
component uart_rx6 is
  Port (           serial_in : in std_logic;
                en_16_x_baud : in std_logic;
                    data_out : out std_logic_vector(7 downto 0);
                 buffer_read : in std_logic;
         buffer_data_present : out std_logic;
            buffer_half_full : out std_logic;
                 buffer_full : out std_logic;
                buffer_reset : in std_logic;
                         clk : in std_logic);
  end component;

------------------------------------------------------------------------
-- Signal Declarations
------------------------------------------------------------------------

	signal baud_x_16_clock : std_logic;

------------------------------------------------------------------------
-- Module Implementation
------------------------------------------------------------------------

begin

	baud_clock_generator: uart_clock 
				generic map (Clock_Frequency_Hz)
				port map (clk, baud_x_16_clock);

	
 -- uart_tx/rx6 instantiation
	transmitter: uart_tx6 port map ( data_in=>TxDataByte, buffer_write=>TxDataStrobe,
											  buffer_reset=>rst, en_16_x_baud=>baud_x_16_clock,
											  serial_out=>TxD, --buffer_full=>TxBufferFull,
											  clk=>clk);

	receiver: uart_rx6 port map ( serial_in=>RxD, clk=>clk,
										  data_out=>RxDataByte, buffer_read=>RxDataStrobe,
										  buffer_reset=>rst, en_16_x_baud=>baud_x_16_clock,
										  buffer_data_present=>RxDataReady);	
end RTL;
