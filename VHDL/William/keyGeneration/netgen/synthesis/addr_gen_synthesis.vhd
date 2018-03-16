--------------------------------------------------------------------------------
-- Copyright (c) 1995-2013 Xilinx, Inc.  All rights reserved.
--------------------------------------------------------------------------------
--   ____  ____
--  /   /\/   /
-- /___/  \  /    Vendor: Xilinx
-- \   \   \/     Version: P.20131013
--  \   \         Application: netgen
--  /   /         Filename: addr_gen_synthesis.vhd
-- /___/   /\     Timestamp: Sun Mar 11 12:23:05 2018
-- \   \  /  \ 
--  \___\/\___\
--             
-- Command	: -intstyle ise -ar Structure -tm addr_gen -w -dir netgen/synthesis -ofmt vhdl -sim addr_gen.ngc addr_gen_synthesis.vhd 
-- Device	: xc3s200-4-tq144
-- Input file	: addr_gen.ngc
-- Output file	: E:\OneDrive\PC Documents\Important\University\Year 4\EEE6225\System-Design\VHDL\William\keyGeneration\netgen\synthesis\addr_gen_synthesis.vhd
-- # of Entities	: 1
-- Design Name	: addr_gen
-- Xilinx	: C:\Xilinx\14.7\ISE_DS\ISE\
--             
-- Purpose:    
--     This VHDL netlist is a verification model and uses simulation 
--     primitives which may not represent the true implementation of the 
--     device, however the netlist is functionally correct and should not 
--     be modified. This file cannot be synthesized and should only be used 
--     with supported simulation tools.
--             
-- Reference:  
--     Command Line Tools User Guide, Chapter 23
--     Synthesis and Simulation Design Guide, Chapter 6
--             
--------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
use UNISIM.VPKG.ALL;

entity addr_gen is
  port (
    clk : in STD_LOGIC := 'X'; 
    ce : in STD_LOGIC := 'X'; 
    en : in STD_LOGIC := 'X'; 
    rst : in STD_LOGIC := 'X'; 
    QAddrSel : out STD_LOGIC; 
    inv : in STD_LOGIC := 'X'; 
    addr : out STD_LOGIC_VECTOR ( 3 downto 0 ) 
  );
end addr_gen;

architecture Structure of addr_gen is
  signal N3 : STD_LOGIC; 
  signal QAddrSel_OBUF_2 : STD_LOGIC; 
  signal addr_0_OBUF_10 : STD_LOGIC; 
  signal addr_1_OBUF_11 : STD_LOGIC; 
  signal addr_2_OBUF_12 : STD_LOGIC; 
  signal addr_3_OBUF_13 : STD_LOGIC; 
  signal ce_IBUF_15 : STD_LOGIC; 
  signal clk_BUFGP_17 : STD_LOGIC; 
  signal counter_and0000_21 : STD_LOGIC; 
  signal counter_not0001 : STD_LOGIC; 
  signal en_IBUF_24 : STD_LOGIC; 
  signal inv_IBUF_26 : STD_LOGIC; 
  signal rst_IBUF_28 : STD_LOGIC; 
  signal Result : STD_LOGIC_VECTOR ( 2 downto 0 ); 
  signal counter : STD_LOGIC_VECTOR ( 2 downto 0 ); 
begin
  counter_0 : FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => clk_BUFGP_17,
      CE => counter_not0001,
      D => Result(0),
      R => counter_and0000_21,
      Q => counter(0)
    );
  counter_1 : FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => clk_BUFGP_17,
      CE => counter_not0001,
      D => Result(1),
      R => counter_and0000_21,
      Q => counter(1)
    );
  counter_2 : FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => clk_BUFGP_17,
      CE => counter_not0001,
      D => Result(2),
      R => counter_and0000_21,
      Q => counter(2)
    );
  counter_not00011 : LUT2
    generic map(
      INIT => X"8"
    )
    port map (
      I0 => en_IBUF_24,
      I1 => ce_IBUF_15,
      O => counter_not0001
    );
  QAddrSel1 : LUT3
    generic map(
      INIT => X"54"
    )
    port map (
      I0 => inv_IBUF_26,
      I1 => counter(1),
      I2 => counter(2),
      O => QAddrSel_OBUF_2
    );
  addr_3_1 : LUT4
    generic map(
      INIT => X"A8AA"
    )
    port map (
      I0 => inv_IBUF_26,
      I1 => counter(1),
      I2 => counter(2),
      I3 => counter(0),
      O => addr_3_OBUF_13
    );
  addr_2_1 : LUT4
    generic map(
      INIT => X"0008"
    )
    port map (
      I0 => counter(0),
      I1 => inv_IBUF_26,
      I2 => counter(1),
      I3 => counter(2),
      O => addr_2_OBUF_12
    );
  addr_1_1 : LUT4
    generic map(
      INIT => X"CDC8"
    )
    port map (
      I0 => counter(2),
      I1 => inv_IBUF_26,
      I2 => counter(1),
      I3 => counter(0),
      O => addr_1_OBUF_11
    );
  addr_0_1 : LUT4
    generic map(
      INIT => X"0110"
    )
    port map (
      I0 => counter(1),
      I1 => counter(2),
      I2 => inv_IBUF_26,
      I3 => counter(0),
      O => addr_0_OBUF_10
    );
  Mcount_counter_xor_1_11 : LUT2
    generic map(
      INIT => X"6"
    )
    port map (
      I0 => counter(1),
      I1 => counter(0),
      O => Result(1)
    );
  Mcount_counter_xor_2_11 : LUT3
    generic map(
      INIT => X"6A"
    )
    port map (
      I0 => counter(2),
      I1 => counter(1),
      I2 => counter(0),
      O => Result(2)
    );
  counter_and0000 : LUT4
    generic map(
      INIT => X"88C8"
    )
    port map (
      I0 => rst_IBUF_28,
      I1 => ce_IBUF_15,
      I2 => counter(2),
      I3 => N3,
      O => counter_and0000_21
    );
  ce_IBUF : IBUF
    port map (
      I => ce,
      O => ce_IBUF_15
    );
  en_IBUF : IBUF
    port map (
      I => en,
      O => en_IBUF_24
    );
  rst_IBUF : IBUF
    port map (
      I => rst,
      O => rst_IBUF_28
    );
  inv_IBUF : IBUF
    port map (
      I => inv,
      O => inv_IBUF_26
    );
  QAddrSel_OBUF : OBUF
    port map (
      I => QAddrSel_OBUF_2,
      O => QAddrSel
    );
  addr_3_OBUF : OBUF
    port map (
      I => addr_3_OBUF_13,
      O => addr(3)
    );
  addr_2_OBUF : OBUF
    port map (
      I => addr_2_OBUF_12,
      O => addr(2)
    );
  addr_1_OBUF : OBUF
    port map (
      I => addr_1_OBUF_11,
      O => addr(1)
    );
  addr_0_OBUF : OBUF
    port map (
      I => addr_0_OBUF_10,
      O => addr(0)
    );
  clk_BUFGP : BUFGP
    port map (
      I => clk,
      O => clk_BUFGP_17
    );
  Mcount_counter_xor_0_11_INV_0 : INV
    port map (
      I => counter(0),
      O => Result(0)
    );
  counter_and0000_SW0 : LUT2_L
    generic map(
      INIT => X"E"
    )
    port map (
      I0 => counter(1),
      I1 => counter(0),
      LO => N3
    );

end Structure;

