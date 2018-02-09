--------------------------------------------------------------------------------
-- Copyright (c) 1995-2013 Xilinx, Inc.  All rights reserved.
--------------------------------------------------------------------------------
--   ____  ____
--  /   /\/   /
-- /___/  \  /    Vendor: Xilinx
-- \   \   \/     Version: P.20131013
--  \   \         Application: netgen
--  /   /         Filename: keyGenController_v3_synthesis.vhd
-- /___/   /\     Timestamp: Wed Feb 07 22:35:56 2018
-- \   \  /  \ 
--  \___\/\___\
--             
-- Command	: -intstyle ise -ar Structure -tm keyGenController_v3 -w -dir netgen/synthesis -ofmt vhdl -sim keyGenController_v3.ngc keyGenController_v3_synthesis.vhd 
-- Device	: xc3s200-4-tq144
-- Input file	: keyGenController_v3.ngc
-- Output file	: E:\OneDrive\PC Documents\Important\University\Year 4\EEE6225\System-Design\VHDL\William\keyGeneration\netgen\synthesis\keyGenController_v3_synthesis.vhd
-- # of Entities	: 1
-- Design Name	: keyGenController_v3
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

entity keyGenController_v3 is
  port (
    clk : in STD_LOGIC := 'X'; 
    addrEnable : out STD_LOGIC; 
    ce : in STD_LOGIC := 'X'; 
    RConEn : out STD_LOGIC; 
    done : out STD_LOGIC; 
    RConSel : out STD_LOGIC; 
    inv : in STD_LOGIC := 'X'; 
    FRowSel : out STD_LOGIC 
  );
end keyGenController_v3;

architecture Structure of keyGenController_v3 is
  signal FRowSel_OBUF_1 : STD_LOGIC; 
  signal N0 : STD_LOGIC; 
  signal N1 : STD_LOGIC; 
  signal RConSel_OBUF_6 : STD_LOGIC; 
  signal SRL0Q15 : STD_LOGIC; 
  signal SRL1Q15 : STD_LOGIC; 
  signal addrEnable_OBUF_10 : STD_LOGIC; 
  signal ce_IBUF_12 : STD_LOGIC; 
  signal clk_BUFGP_14 : STD_LOGIC; 
  signal doneDel_16 : STD_LOGIC; 
  signal done_OBUF_17 : STD_LOGIC; 
  signal inv_IBUF_19 : STD_LOGIC; 
begin
  XST_GND : GND
    port map (
      G => N0
    );
  XST_VCC : VCC
    port map (
      P => N1
    );
  doneDel : FDE
    generic map(
      INIT => '0'
    )
    port map (
      C => clk_BUFGP_14,
      CE => ce_IBUF_12,
      D => done_OBUF_17,
      Q => doneDel_16
    );
  SRLC16E_0 : SRLC16E
    generic map(
      INIT => X"C003"
    )
    port map (
      A0 => N1,
      A1 => N0,
      A2 => N0,
      A3 => N0,
      CE => ce_IBUF_12,
      CLK => clk_BUFGP_14,
      D => SRL0Q15,
      Q => FRowSel_OBUF_1,
      Q15 => SRL0Q15
    );
  SRLC16E_1_0 : SRLC16E
    generic map(
      INIT => X"0001"
    )
    port map (
      A0 => N0,
      A1 => N0,
      A2 => N0,
      A3 => N0,
      CE => ce_IBUF_12,
      CLK => clk_BUFGP_14,
      D => SRL1Q15,
      Q => done_OBUF_17,
      Q15 => SRL1Q15
    );
  addrEnable1 : LUT2
    generic map(
      INIT => X"8"
    )
    port map (
      I0 => SRL0Q15,
      I1 => ce_IBUF_12,
      O => addrEnable_OBUF_10
    );
  RConSel1 : LUT3
    generic map(
      INIT => X"D8"
    )
    port map (
      I0 => inv_IBUF_19,
      I1 => SRL1Q15,
      I2 => done_OBUF_17,
      O => RConSel_OBUF_6
    );
  ce_IBUF : IBUF
    port map (
      I => ce,
      O => ce_IBUF_12
    );
  inv_IBUF : IBUF
    port map (
      I => inv,
      O => inv_IBUF_19
    );
  addrEnable_OBUF : OBUF
    port map (
      I => addrEnable_OBUF_10,
      O => addrEnable
    );
  RConEn_OBUF : OBUF
    port map (
      I => doneDel_16,
      O => RConEn
    );
  done_OBUF : OBUF
    port map (
      I => done_OBUF_17,
      O => done
    );
  RConSel_OBUF : OBUF
    port map (
      I => RConSel_OBUF_6,
      O => RConSel
    );
  FRowSel_OBUF : OBUF
    port map (
      I => FRowSel_OBUF_1,
      O => FRowSel
    );
  clk_BUFGP : BUFGP
    port map (
      I => clk,
      O => clk_BUFGP_14
    );

end Structure;

