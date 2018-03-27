--------------------------------------------------------------------------------
-- Copyright (c) 1995-2013 Xilinx, Inc.  All rights reserved.
--------------------------------------------------------------------------------
--   ____  ____
--  /   /\/   /
-- /___/  \  /    Vendor: Xilinx
-- \   \   \/     Version: P.20131013
--  \   \         Application: netgen
--  /   /         Filename: MixColumns_map.vhd
-- /___/   /\     Timestamp: Fri Mar 02 04:27:41 2018
-- \   \  /  \ 
--  \___\/\___\
--             
-- Command	: -intstyle ise -s 4 -pcf MixColumns.pcf -rpw 100 -tpw 0 -ar Structure -tm MixColumns -w -dir netgen/map -ofmt vhdl -sim MixColumns_map.ncd MixColumns_map.vhd 
-- Device	: 3s200ft256-4 (PRODUCTION 1.39 2013-10-13)
-- Input file	: MixColumns_map.ncd
-- Output file	: C:\Users\lukel\Desktop\Uni\Fourth Year\system design\VHDL\MixColumns\netgen\map\MixColumns_map.vhd
-- # of Entities	: 1
-- Design Name	: MixColumns
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
library SIMPRIM;
use SIMPRIM.VCOMPONENTS.ALL;
use SIMPRIM.VPACKAGE.ALL;

entity MixColumns is
  port (
    clk : in STD_LOGIC := 'X'; 
    rst : in STD_LOGIC := 'X'; 
    byte_out : out STD_LOGIC_VECTOR ( 7 downto 0 ); 
    byte_in : in STD_LOGIC_VECTOR ( 7 downto 0 ) 
  );
end MixColumns;

architecture Structure of MixColumns is
  signal byte_in_6_IBUF_489 : STD_LOGIC; 
  signal byte_in_7_IBUF_491 : STD_LOGIC; 
  signal clk_BUFGP_IBUFG_496 : STD_LOGIC; 
  signal byte_in_0_IBUF_500 : STD_LOGIC; 
  signal byte_in_1_IBUF_501 : STD_LOGIC; 
  signal byte_in_2_IBUF_502 : STD_LOGIC; 
  signal rst_IBUF_503 : STD_LOGIC; 
  signal byte_in_3_IBUF_504 : STD_LOGIC; 
  signal byte_in_4_IBUF_505 : STD_LOGIC; 
  signal byte_in_5_IBUF_506 : STD_LOGIC; 
  signal clk_BUFGP : STD_LOGIC; 
  signal byte_in_6_INBUF : STD_LOGIC; 
  signal byte_out_0_O : STD_LOGIC; 
  signal byte_in_7_INBUF : STD_LOGIC; 
  signal byte_out_1_O : STD_LOGIC; 
  signal byte_out_2_O : STD_LOGIC; 
  signal byte_out_3_O : STD_LOGIC; 
  signal byte_out_4_O : STD_LOGIC; 
  signal clk_INBUF : STD_LOGIC; 
  signal byte_out_5_O : STD_LOGIC; 
  signal byte_out_6_O : STD_LOGIC; 
  signal byte_out_7_O : STD_LOGIC; 
  signal byte_in_0_INBUF : STD_LOGIC; 
  signal byte_in_1_INBUF : STD_LOGIC; 
  signal byte_in_2_INBUF : STD_LOGIC; 
  signal rst_INBUF : STD_LOGIC; 
  signal byte_in_3_INBUF : STD_LOGIC; 
  signal byte_in_4_INBUF : STD_LOGIC; 
  signal byte_in_5_INBUF : STD_LOGIC; 
  signal clk_BUFGP_BUFG_S_INVNOT : STD_LOGIC; 
  signal reg2_Q_4_DXMUX_731 : STD_LOGIC; 
  signal reg2_Q_4_F5MUX_729 : STD_LOGIC; 
  signal Mxor_s2_Result_4_1 : STD_LOGIC; 
  signal reg2_Q_4_BXINV_722 : STD_LOGIC; 
  signal Mxor_s2_Result_4_11_720 : STD_LOGIC; 
  signal reg2_Q_4_SRINV_714 : STD_LOGIC; 
  signal reg2_Q_4_CLKINV_713 : STD_LOGIC; 
  signal reg2_Q_1_DXMUX_765 : STD_LOGIC; 
  signal reg2_Q_1_F5MUX_763 : STD_LOGIC; 
  signal Mxor_s2_Result_1_1 : STD_LOGIC; 
  signal reg2_Q_1_BXINV_756 : STD_LOGIC; 
  signal Mxor_s2_Result_1_11_754 : STD_LOGIC; 
  signal reg2_Q_1_SRINV_748 : STD_LOGIC; 
  signal reg2_Q_1_CLKINV_747 : STD_LOGIC; 
  signal reg2_Q_3_DXMUX_799 : STD_LOGIC; 
  signal reg2_Q_3_F5MUX_797 : STD_LOGIC; 
  signal Mxor_s2_Result_3_1 : STD_LOGIC; 
  signal reg2_Q_3_BXINV_790 : STD_LOGIC; 
  signal Mxor_s2_Result_3_11_788 : STD_LOGIC; 
  signal reg2_Q_3_SRINV_782 : STD_LOGIC; 
  signal reg2_Q_3_CLKINV_781 : STD_LOGIC; 
  signal reg0_Q_1_DXMUX_837 : STD_LOGIC; 
  signal reg0_Q_1_DYMUX_824 : STD_LOGIC; 
  signal reg0_Q_1_SRINV_815 : STD_LOGIC; 
  signal reg0_Q_1_CLKINV_814 : STD_LOGIC; 
  signal reg6_Q_7_DXMUX_875 : STD_LOGIC; 
  signal reg6_Q_7_DYMUX_862 : STD_LOGIC; 
  signal reg6_Q_7_SRINV_853 : STD_LOGIC; 
  signal reg6_Q_7_CLKINV_852 : STD_LOGIC; 
  signal reg0_Q_3_DXMUX_913 : STD_LOGIC; 
  signal reg0_Q_3_DYMUX_900 : STD_LOGIC; 
  signal reg0_Q_3_SRINV_891 : STD_LOGIC; 
  signal reg0_Q_3_CLKINV_890 : STD_LOGIC; 
  signal reg0_Q_5_DXMUX_951 : STD_LOGIC; 
  signal reg0_Q_5_DYMUX_938 : STD_LOGIC; 
  signal reg0_Q_5_SRINV_929 : STD_LOGIC; 
  signal reg0_Q_5_CLKINV_928 : STD_LOGIC; 
  signal reg0_Q_7_DXMUX_989 : STD_LOGIC; 
  signal reg0_Q_7_DYMUX_976 : STD_LOGIC; 
  signal reg0_Q_7_SRINV_967 : STD_LOGIC; 
  signal reg0_Q_7_CLKINV_966 : STD_LOGIC; 
  signal reg1_Q_1_DXMUX_1027 : STD_LOGIC; 
  signal reg1_Q_1_DYMUX_1014 : STD_LOGIC; 
  signal reg1_Q_1_SRINV_1005 : STD_LOGIC; 
  signal reg1_Q_1_CLKINV_1004 : STD_LOGIC; 
  signal reg1_Q_3_DXMUX_1065 : STD_LOGIC; 
  signal reg1_Q_3_DYMUX_1052 : STD_LOGIC; 
  signal reg1_Q_3_SRINV_1043 : STD_LOGIC; 
  signal reg1_Q_3_CLKINV_1042 : STD_LOGIC; 
  signal reg1_Q_5_DXMUX_1103 : STD_LOGIC; 
  signal reg1_Q_5_DYMUX_1090 : STD_LOGIC; 
  signal reg1_Q_5_SRINV_1081 : STD_LOGIC; 
  signal reg1_Q_5_CLKINV_1080 : STD_LOGIC; 
  signal reg1_Q_7_DXMUX_1141 : STD_LOGIC; 
  signal reg1_Q_7_DYMUX_1128 : STD_LOGIC; 
  signal reg1_Q_7_SRINV_1119 : STD_LOGIC; 
  signal reg1_Q_7_CLKINV_1118 : STD_LOGIC; 
  signal reg2_Q_2_DXMUX_1179 : STD_LOGIC; 
  signal s2_2_Q : STD_LOGIC; 
  signal reg2_Q_2_DYMUX_1167 : STD_LOGIC; 
  signal s2_0_Q : STD_LOGIC; 
  signal reg2_Q_2_SRINV_1159 : STD_LOGIC; 
  signal reg2_Q_2_CLKINV_1158 : STD_LOGIC; 
  signal reg2_Q_5_DYMUX_1200 : STD_LOGIC; 
  signal s2_5_Q : STD_LOGIC; 
  signal reg2_Q_5_SRINV_1192 : STD_LOGIC; 
  signal reg2_Q_5_CLKINV_1191 : STD_LOGIC; 
  signal reg2_Q_7_DXMUX_1238 : STD_LOGIC; 
  signal s2_7_Q : STD_LOGIC; 
  signal reg2_Q_7_DYMUX_1226 : STD_LOGIC; 
  signal s2_6_Q : STD_LOGIC; 
  signal reg2_Q_7_SRINV_1218 : STD_LOGIC; 
  signal reg2_Q_7_CLKINV_1217 : STD_LOGIC; 
  signal reg3_Q_1_DXMUX_1276 : STD_LOGIC; 
  signal reg3_Q_1_DYMUX_1264 : STD_LOGIC; 
  signal reg3_Q_1_SRINV_1255 : STD_LOGIC; 
  signal reg3_Q_1_CLKINV_1254 : STD_LOGIC; 
  signal reg3_Q_3_DXMUX_1314 : STD_LOGIC; 
  signal reg3_Q_3_DYMUX_1302 : STD_LOGIC; 
  signal reg3_Q_3_SRINV_1293 : STD_LOGIC; 
  signal reg3_Q_3_CLKINV_1292 : STD_LOGIC; 
  signal reg3_Q_5_DXMUX_1352 : STD_LOGIC; 
  signal reg3_Q_5_DYMUX_1339 : STD_LOGIC; 
  signal reg3_Q_5_SRINV_1331 : STD_LOGIC; 
  signal reg3_Q_5_CLKINV_1330 : STD_LOGIC; 
  signal reg3_Q_7_DXMUX_1390 : STD_LOGIC; 
  signal reg3_Q_7_DYMUX_1377 : STD_LOGIC; 
  signal reg3_Q_7_SRINV_1368 : STD_LOGIC; 
  signal reg3_Q_7_CLKINV_1367 : STD_LOGIC; 
  signal reg4_Q_1_DXMUX_1428 : STD_LOGIC; 
  signal reg4_Q_1_DYMUX_1415 : STD_LOGIC; 
  signal reg4_Q_1_SRINV_1406 : STD_LOGIC; 
  signal reg4_Q_1_CLKINV_1405 : STD_LOGIC; 
  signal reg4_Q_3_DXMUX_1466 : STD_LOGIC; 
  signal reg4_Q_3_DYMUX_1453 : STD_LOGIC; 
  signal reg4_Q_3_SRINV_1444 : STD_LOGIC; 
  signal reg4_Q_3_CLKINV_1443 : STD_LOGIC; 
  signal reg4_Q_5_DXMUX_1504 : STD_LOGIC; 
  signal reg4_Q_5_DYMUX_1491 : STD_LOGIC; 
  signal reg4_Q_5_SRINV_1482 : STD_LOGIC; 
  signal reg4_Q_5_CLKINV_1481 : STD_LOGIC; 
  signal reg4_Q_7_DXMUX_1542 : STD_LOGIC; 
  signal reg4_Q_7_DYMUX_1529 : STD_LOGIC; 
  signal reg4_Q_7_SRINV_1520 : STD_LOGIC; 
  signal reg4_Q_7_CLKINV_1519 : STD_LOGIC; 
  signal reg5_Q_1_DXMUX_1580 : STD_LOGIC; 
  signal reg5_Q_1_DYMUX_1567 : STD_LOGIC; 
  signal reg5_Q_1_SRINV_1558 : STD_LOGIC; 
  signal reg5_Q_1_CLKINV_1557 : STD_LOGIC; 
  signal reg5_Q_3_DXMUX_1618 : STD_LOGIC; 
  signal reg5_Q_3_DYMUX_1605 : STD_LOGIC; 
  signal reg5_Q_3_SRINV_1596 : STD_LOGIC; 
  signal reg5_Q_3_CLKINV_1595 : STD_LOGIC; 
  signal reg5_Q_5_DXMUX_1656 : STD_LOGIC; 
  signal reg5_Q_5_DYMUX_1643 : STD_LOGIC; 
  signal reg5_Q_5_SRINV_1634 : STD_LOGIC; 
  signal reg5_Q_5_CLKINV_1633 : STD_LOGIC; 
  signal reg5_Q_7_DXMUX_1694 : STD_LOGIC; 
  signal reg5_Q_7_DYMUX_1681 : STD_LOGIC; 
  signal reg5_Q_7_SRINV_1672 : STD_LOGIC; 
  signal reg5_Q_7_CLKINV_1671 : STD_LOGIC; 
  signal reg6_Q_1_DXMUX_1732 : STD_LOGIC; 
  signal reg6_Q_1_DYMUX_1719 : STD_LOGIC; 
  signal reg6_Q_1_SRINV_1710 : STD_LOGIC; 
  signal reg6_Q_1_CLKINV_1709 : STD_LOGIC; 
  signal reg6_Q_3_DXMUX_1770 : STD_LOGIC; 
  signal reg6_Q_3_DYMUX_1757 : STD_LOGIC; 
  signal reg6_Q_3_SRINV_1748 : STD_LOGIC; 
  signal reg6_Q_3_CLKINV_1747 : STD_LOGIC; 
  signal reg6_Q_5_DXMUX_1808 : STD_LOGIC; 
  signal reg6_Q_5_DYMUX_1795 : STD_LOGIC; 
  signal reg6_Q_5_SRINV_1786 : STD_LOGIC; 
  signal reg6_Q_5_CLKINV_1785 : STD_LOGIC; 
  signal control_0_control_EN_temp_0_DYMUX_1820 : STD_LOGIC; 
  signal control_0_control_EN_temp_0_SRINV_1818 : STD_LOGIC; 
  signal control_0_control_EN_temp_0_CLKINV_1817 : STD_LOGIC; 
  signal control_0_control_EN_temp_1_DYMUX_1832 : STD_LOGIC; 
  signal control_0_control_EN_temp_1_SRINV_1830 : STD_LOGIC; 
  signal control_0_control_EN_temp_1_CLKINV_1829 : STD_LOGIC; 
  signal control_0_control_EN_temp_2_DYMUX_1844 : STD_LOGIC; 
  signal control_0_control_EN_temp_2_SRINV_1842 : STD_LOGIC; 
  signal control_0_control_EN_temp_2_CLKINV_1841 : STD_LOGIC; 
  signal control_0_control_EN_temp_3_DYMUX_1856 : STD_LOGIC; 
  signal control_0_control_EN_temp_3_SRINV_1854 : STD_LOGIC; 
  signal control_0_control_EN_temp_3_CLKINV_1853 : STD_LOGIC; 
  signal byte_out_1_OBUF_1882 : STD_LOGIC; 
  signal byte_out_0_OBUF_1874 : STD_LOGIC; 
  signal byte_out_3_OBUF_1906 : STD_LOGIC; 
  signal byte_out_2_OBUF_1898 : STD_LOGIC; 
  signal byte_out_5_OBUF_1930 : STD_LOGIC; 
  signal byte_out_4_OBUF_1922 : STD_LOGIC; 
  signal byte_out_7_OBUF_1954 : STD_LOGIC; 
  signal byte_out_6_OBUF_1946 : STD_LOGIC; 
  signal control_0_control_load_temp_1_DXMUX_1972 : STD_LOGIC; 
  signal control_0_control_load_temp_1_DYMUX_1966 : STD_LOGIC; 
  signal control_0_control_load_temp_1_SRINV_1964 : STD_LOGIC; 
  signal control_0_control_load_temp_1_CLKINV_1963 : STD_LOGIC; 
  signal control_0_control_load_temp_2_DYMUX_1984 : STD_LOGIC; 
  signal control_0_control_load_temp_2_SRINV_1982 : STD_LOGIC; 
  signal control_0_control_load_temp_2_CLKINV_1981 : STD_LOGIC; 
  signal control_0_control_load_temp_3_DYMUX_1996 : STD_LOGIC; 
  signal control_0_control_load_temp_3_SRINV_1994 : STD_LOGIC; 
  signal control_0_control_load_temp_3_CLKINV_1993 : STD_LOGIC; 
  signal GND : STD_LOGIC; 
  signal VCC : STD_LOGIC; 
  signal reg3_Q : STD_LOGIC_VECTOR ( 7 downto 0 ); 
  signal control_0_control_EN_temp : STD_LOGIC_VECTOR ( 3 downto 0 ); 
  signal reg2_Q : STD_LOGIC_VECTOR ( 7 downto 0 ); 
  signal reg1_Q : STD_LOGIC_VECTOR ( 7 downto 0 ); 
  signal reg0_Q : STD_LOGIC_VECTOR ( 7 downto 0 ); 
  signal control_0_control_load_temp : STD_LOGIC_VECTOR ( 3 downto 0 ); 
  signal reg6_Q : STD_LOGIC_VECTOR ( 7 downto 0 ); 
  signal reg5_Q : STD_LOGIC_VECTOR ( 7 downto 0 ); 
  signal reg4_Q : STD_LOGIC_VECTOR ( 7 downto 0 ); 
  signal s0 : STD_LOGIC_VECTOR ( 7 downto 0 ); 
  signal s19 : STD_LOGIC_VECTOR ( 7 downto 0 ); 
  signal s1 : STD_LOGIC_VECTOR ( 7 downto 0 ); 
  signal s3 : STD_LOGIC_VECTOR ( 7 downto 0 ); 
  signal s17 : STD_LOGIC_VECTOR ( 7 downto 0 ); 
  signal s15 : STD_LOGIC_VECTOR ( 7 downto 0 ); 
begin
  byte_in_6_IBUF : X_BUF
    generic map(
      PATHPULSE => 605 ps
    )
    port map (
      I => byte_in(6),
      O => byte_in_6_INBUF
    );
  byte_out_0_OBUF : X_OBUF
    port map (
      I => byte_out_0_O,
      O => byte_out(0)
    );
  byte_in_7_IBUF : X_BUF
    generic map(
      PATHPULSE => 605 ps
    )
    port map (
      I => byte_in(7),
      O => byte_in_7_INBUF
    );
  byte_in_7_IFF_IMUX : X_BUF
    generic map(
      PATHPULSE => 605 ps
    )
    port map (
      I => byte_in_7_INBUF,
      O => byte_in_7_IBUF_491
    );
  byte_out_1_OBUF : X_OBUF
    port map (
      I => byte_out_1_O,
      O => byte_out(1)
    );
  byte_out_2_OBUF : X_OBUF
    port map (
      I => byte_out_2_O,
      O => byte_out(2)
    );
  byte_out_3_OBUF : X_OBUF
    port map (
      I => byte_out_3_O,
      O => byte_out(3)
    );
  byte_out_4_OBUF : X_OBUF
    port map (
      I => byte_out_4_O,
      O => byte_out(4)
    );
  clk_BUFGP_IBUFG : X_BUF
    generic map(
      PATHPULSE => 605 ps
    )
    port map (
      I => clk,
      O => clk_INBUF
    );
  byte_out_5_OBUF : X_OBUF
    port map (
      I => byte_out_5_O,
      O => byte_out(5)
    );
  byte_out_6_OBUF : X_OBUF
    port map (
      I => byte_out_6_O,
      O => byte_out(6)
    );
  byte_out_7_OBUF : X_OBUF
    port map (
      I => byte_out_7_O,
      O => byte_out(7)
    );
  byte_in_0_IBUF : X_BUF
    generic map(
      PATHPULSE => 605 ps
    )
    port map (
      I => byte_in(0),
      O => byte_in_0_INBUF
    );
  byte_in_1_IBUF : X_BUF
    generic map(
      PATHPULSE => 605 ps
    )
    port map (
      I => byte_in(1),
      O => byte_in_1_INBUF
    );
  byte_in_2_IBUF : X_BUF
    generic map(
      PATHPULSE => 605 ps
    )
    port map (
      I => byte_in(2),
      O => byte_in_2_INBUF
    );
  rst_IBUF : X_BUF
    generic map(
      PATHPULSE => 605 ps
    )
    port map (
      I => rst,
      O => rst_INBUF
    );
  byte_in_3_IBUF : X_BUF
    generic map(
      PATHPULSE => 605 ps
    )
    port map (
      I => byte_in(3),
      O => byte_in_3_INBUF
    );
  byte_in_4_IBUF : X_BUF
    generic map(
      PATHPULSE => 605 ps
    )
    port map (
      I => byte_in(4),
      O => byte_in_4_INBUF
    );
  byte_in_5_IBUF : X_BUF
    generic map(
      PATHPULSE => 605 ps
    )
    port map (
      I => byte_in(5),
      O => byte_in_5_INBUF
    );
  byte_in_5_IFF_IMUX : X_BUF
    generic map(
      PATHPULSE => 605 ps
    )
    port map (
      I => byte_in_5_INBUF,
      O => byte_in_5_IBUF_506
    );
  clk_BUFGP_BUFG : X_BUFGMUX
    port map (
      I0 => clk_BUFGP_IBUFG_496,
      I1 => GND,
      S => clk_BUFGP_BUFG_S_INVNOT,
      O => clk_BUFGP
    );
  clk_BUFGP_BUFG_SINV : X_INV
    generic map(
      PATHPULSE => 605 ps
    )
    port map (
      I => '1',
      O => clk_BUFGP_BUFG_S_INVNOT
    );
  Mxor_s2_Result_4_11 : X_LUT4
    generic map(
      INIT => X"6996"
    )
    port map (
      ADR0 => control_0_control_EN_temp(3),
      ADR1 => byte_in_4_IBUF_505,
      ADR2 => byte_in_7_IBUF_491,
      ADR3 => byte_in_3_IBUF_504,
      O => Mxor_s2_Result_4_1
    );
  reg2_Q_4 : X_SFF
    generic map(
      INIT => '0'
    )
    port map (
      I => reg2_Q_4_DXMUX_731,
      CE => VCC,
      CLK => reg2_Q_4_CLKINV_713,
      SET => GND,
      RST => GND,
      SSET => GND,
      SRST => reg2_Q_4_SRINV_714,
      O => reg2_Q(4)
    );
  reg2_Q_4_DXMUX : X_BUF
    generic map(
      PATHPULSE => 605 ps
    )
    port map (
      I => reg2_Q_4_F5MUX_729,
      O => reg2_Q_4_DXMUX_731
    );
  reg2_Q_4_F5MUX : X_MUX2
    port map (
      IA => Mxor_s2_Result_4_11_720,
      IB => Mxor_s2_Result_4_1,
      SEL => reg2_Q_4_BXINV_722,
      O => reg2_Q_4_F5MUX_729
    );
  reg2_Q_4_BXINV : X_BUF
    generic map(
      PATHPULSE => 605 ps
    )
    port map (
      I => reg3_Q(4),
      O => reg2_Q_4_BXINV_722
    );
  reg2_Q_4_SRINV : X_BUF
    generic map(
      PATHPULSE => 605 ps
    )
    port map (
      I => rst_IBUF_503,
      O => reg2_Q_4_SRINV_714
    );
  reg2_Q_4_CLKINV : X_BUF
    generic map(
      PATHPULSE => 605 ps
    )
    port map (
      I => clk_BUFGP,
      O => reg2_Q_4_CLKINV_713
    );
  Mxor_s2_Result_4_12 : X_LUT4
    generic map(
      INIT => X"9696"
    )
    port map (
      ADR0 => byte_in_4_IBUF_505,
      ADR1 => byte_in_7_IBUF_491,
      ADR2 => byte_in_3_IBUF_504,
      ADR3 => VCC,
      O => Mxor_s2_Result_4_11_720
    );
  Mxor_s2_Result_1_11 : X_LUT4
    generic map(
      INIT => X"6996"
    )
    port map (
      ADR0 => control_0_control_EN_temp(3),
      ADR1 => byte_in_1_IBUF_501,
      ADR2 => byte_in_7_IBUF_491,
      ADR3 => byte_in_0_IBUF_500,
      O => Mxor_s2_Result_1_1
    );
  reg2_Q_1 : X_SFF
    generic map(
      INIT => '0'
    )
    port map (
      I => reg2_Q_1_DXMUX_765,
      CE => VCC,
      CLK => reg2_Q_1_CLKINV_747,
      SET => GND,
      RST => GND,
      SSET => GND,
      SRST => reg2_Q_1_SRINV_748,
      O => reg2_Q(1)
    );
  reg2_Q_1_DXMUX : X_BUF
    generic map(
      PATHPULSE => 605 ps
    )
    port map (
      I => reg2_Q_1_F5MUX_763,
      O => reg2_Q_1_DXMUX_765
    );
  reg2_Q_1_F5MUX : X_MUX2
    port map (
      IA => Mxor_s2_Result_1_11_754,
      IB => Mxor_s2_Result_1_1,
      SEL => reg2_Q_1_BXINV_756,
      O => reg2_Q_1_F5MUX_763
    );
  reg2_Q_1_BXINV : X_BUF
    generic map(
      PATHPULSE => 605 ps
    )
    port map (
      I => reg3_Q(1),
      O => reg2_Q_1_BXINV_756
    );
  reg2_Q_1_SRINV : X_BUF
    generic map(
      PATHPULSE => 605 ps
    )
    port map (
      I => rst_IBUF_503,
      O => reg2_Q_1_SRINV_748
    );
  reg2_Q_1_CLKINV : X_BUF
    generic map(
      PATHPULSE => 605 ps
    )
    port map (
      I => clk_BUFGP,
      O => reg2_Q_1_CLKINV_747
    );
  Mxor_s2_Result_1_12 : X_LUT4
    generic map(
      INIT => X"9696"
    )
    port map (
      ADR0 => byte_in_1_IBUF_501,
      ADR1 => byte_in_7_IBUF_491,
      ADR2 => byte_in_0_IBUF_500,
      ADR3 => VCC,
      O => Mxor_s2_Result_1_11_754
    );
  Mxor_s2_Result_3_11 : X_LUT4
    generic map(
      INIT => X"6996"
    )
    port map (
      ADR0 => control_0_control_EN_temp(3),
      ADR1 => byte_in_3_IBUF_504,
      ADR2 => byte_in_7_IBUF_491,
      ADR3 => byte_in_2_IBUF_502,
      O => Mxor_s2_Result_3_1
    );
  reg2_Q_3 : X_SFF
    generic map(
      INIT => '0'
    )
    port map (
      I => reg2_Q_3_DXMUX_799,
      CE => VCC,
      CLK => reg2_Q_3_CLKINV_781,
      SET => GND,
      RST => GND,
      SSET => GND,
      SRST => reg2_Q_3_SRINV_782,
      O => reg2_Q(3)
    );
  reg2_Q_3_DXMUX : X_BUF
    generic map(
      PATHPULSE => 605 ps
    )
    port map (
      I => reg2_Q_3_F5MUX_797,
      O => reg2_Q_3_DXMUX_799
    );
  reg2_Q_3_F5MUX : X_MUX2
    port map (
      IA => Mxor_s2_Result_3_11_788,
      IB => Mxor_s2_Result_3_1,
      SEL => reg2_Q_3_BXINV_790,
      O => reg2_Q_3_F5MUX_797
    );
  reg2_Q_3_BXINV : X_BUF
    generic map(
      PATHPULSE => 605 ps
    )
    port map (
      I => reg3_Q(3),
      O => reg2_Q_3_BXINV_790
    );
  reg2_Q_3_SRINV : X_BUF
    generic map(
      PATHPULSE => 605 ps
    )
    port map (
      I => rst_IBUF_503,
      O => reg2_Q_3_SRINV_782
    );
  reg2_Q_3_CLKINV : X_BUF
    generic map(
      PATHPULSE => 605 ps
    )
    port map (
      I => clk_BUFGP,
      O => reg2_Q_3_CLKINV_781
    );
  Mxor_s2_Result_3_12 : X_LUT4
    generic map(
      INIT => X"9696"
    )
    port map (
      ADR0 => byte_in_3_IBUF_504,
      ADR1 => byte_in_7_IBUF_491,
      ADR2 => byte_in_2_IBUF_502,
      ADR3 => VCC,
      O => Mxor_s2_Result_3_11_788
    );
  reg0_Q_1_DXMUX : X_BUF
    generic map(
      PATHPULSE => 605 ps
    )
    port map (
      I => s0(1),
      O => reg0_Q_1_DXMUX_837
    );
  reg0_Q_1_DYMUX : X_BUF
    generic map(
      PATHPULSE => 605 ps
    )
    port map (
      I => s0(0),
      O => reg0_Q_1_DYMUX_824
    );
  reg0_Q_1_SRINV : X_BUF
    generic map(
      PATHPULSE => 605 ps
    )
    port map (
      I => rst_IBUF_503,
      O => reg0_Q_1_SRINV_815
    );
  reg0_Q_1_CLKINV : X_BUF
    generic map(
      PATHPULSE => 605 ps
    )
    port map (
      I => clk_BUFGP,
      O => reg0_Q_1_CLKINV_814
    );
  reg6_Q_7_DXMUX : X_BUF
    generic map(
      PATHPULSE => 605 ps
    )
    port map (
      I => s19(7),
      O => reg6_Q_7_DXMUX_875
    );
  reg6_Q_7_DYMUX : X_BUF
    generic map(
      PATHPULSE => 605 ps
    )
    port map (
      I => s19(6),
      O => reg6_Q_7_DYMUX_862
    );
  reg6_Q_7_SRINV : X_BUF
    generic map(
      PATHPULSE => 605 ps
    )
    port map (
      I => rst_IBUF_503,
      O => reg6_Q_7_SRINV_853
    );
  reg6_Q_7_CLKINV : X_BUF
    generic map(
      PATHPULSE => 605 ps
    )
    port map (
      I => clk_BUFGP,
      O => reg6_Q_7_CLKINV_852
    );
  reg0_Q_3_DXMUX : X_BUF
    generic map(
      PATHPULSE => 605 ps
    )
    port map (
      I => s0(3),
      O => reg0_Q_3_DXMUX_913
    );
  reg0_Q_3_DYMUX : X_BUF
    generic map(
      PATHPULSE => 605 ps
    )
    port map (
      I => s0(2),
      O => reg0_Q_3_DYMUX_900
    );
  reg0_Q_3_SRINV : X_BUF
    generic map(
      PATHPULSE => 605 ps
    )
    port map (
      I => rst_IBUF_503,
      O => reg0_Q_3_SRINV_891
    );
  reg0_Q_3_CLKINV : X_BUF
    generic map(
      PATHPULSE => 605 ps
    )
    port map (
      I => clk_BUFGP,
      O => reg0_Q_3_CLKINV_890
    );
  reg0_Q_5_DXMUX : X_BUF
    generic map(
      PATHPULSE => 605 ps
    )
    port map (
      I => s0(5),
      O => reg0_Q_5_DXMUX_951
    );
  reg0_Q_5_DYMUX : X_BUF
    generic map(
      PATHPULSE => 605 ps
    )
    port map (
      I => s0(4),
      O => reg0_Q_5_DYMUX_938
    );
  reg0_Q_5_SRINV : X_BUF
    generic map(
      PATHPULSE => 605 ps
    )
    port map (
      I => rst_IBUF_503,
      O => reg0_Q_5_SRINV_929
    );
  reg0_Q_5_CLKINV : X_BUF
    generic map(
      PATHPULSE => 605 ps
    )
    port map (
      I => clk_BUFGP,
      O => reg0_Q_5_CLKINV_928
    );
  reg0_Q_7_DXMUX : X_BUF
    generic map(
      PATHPULSE => 605 ps
    )
    port map (
      I => s0(7),
      O => reg0_Q_7_DXMUX_989
    );
  reg0_Q_7_DYMUX : X_BUF
    generic map(
      PATHPULSE => 605 ps
    )
    port map (
      I => s0(6),
      O => reg0_Q_7_DYMUX_976
    );
  reg0_Q_7_SRINV : X_BUF
    generic map(
      PATHPULSE => 605 ps
    )
    port map (
      I => rst_IBUF_503,
      O => reg0_Q_7_SRINV_967
    );
  reg0_Q_7_CLKINV : X_BUF
    generic map(
      PATHPULSE => 605 ps
    )
    port map (
      I => clk_BUFGP,
      O => reg0_Q_7_CLKINV_966
    );
  reg1_Q_1_DXMUX : X_BUF
    generic map(
      PATHPULSE => 605 ps
    )
    port map (
      I => s1(1),
      O => reg1_Q_1_DXMUX_1027
    );
  reg1_Q_1_DYMUX : X_BUF
    generic map(
      PATHPULSE => 605 ps
    )
    port map (
      I => s1(0),
      O => reg1_Q_1_DYMUX_1014
    );
  reg1_Q_1_SRINV : X_BUF
    generic map(
      PATHPULSE => 605 ps
    )
    port map (
      I => rst_IBUF_503,
      O => reg1_Q_1_SRINV_1005
    );
  reg1_Q_1_CLKINV : X_BUF
    generic map(
      PATHPULSE => 605 ps
    )
    port map (
      I => clk_BUFGP,
      O => reg1_Q_1_CLKINV_1004
    );
  reg1_Q_1 : X_SFF
    generic map(
      INIT => '0'
    )
    port map (
      I => reg1_Q_1_DXMUX_1027,
      CE => VCC,
      CLK => reg1_Q_1_CLKINV_1004,
      SET => GND,
      RST => GND,
      SSET => GND,
      SRST => reg1_Q_1_SRINV_1005,
      O => reg1_Q(1)
    );
  reg1_Q_2 : X_SFF
    generic map(
      INIT => '0'
    )
    port map (
      I => reg1_Q_3_DYMUX_1052,
      CE => VCC,
      CLK => reg1_Q_3_CLKINV_1042,
      SET => GND,
      RST => GND,
      SSET => GND,
      SRST => reg1_Q_3_SRINV_1043,
      O => reg1_Q(2)
    );
  Mxor_s1_Result_3_1 : X_LUT4
    generic map(
      INIT => X"6A6A"
    )
    port map (
      ADR0 => byte_in_3_IBUF_504,
      ADR1 => reg2_Q(3),
      ADR2 => control_0_control_EN_temp(3),
      ADR3 => VCC,
      O => s1(3)
    );
  reg1_Q_3 : X_SFF
    generic map(
      INIT => '0'
    )
    port map (
      I => reg1_Q_3_DXMUX_1065,
      CE => VCC,
      CLK => reg1_Q_3_CLKINV_1042,
      SET => GND,
      RST => GND,
      SSET => GND,
      SRST => reg1_Q_3_SRINV_1043,
      O => reg1_Q(3)
    );
  reg1_Q_3_DXMUX : X_BUF
    generic map(
      PATHPULSE => 605 ps
    )
    port map (
      I => s1(3),
      O => reg1_Q_3_DXMUX_1065
    );
  reg1_Q_3_DYMUX : X_BUF
    generic map(
      PATHPULSE => 605 ps
    )
    port map (
      I => s1(2),
      O => reg1_Q_3_DYMUX_1052
    );
  reg1_Q_3_SRINV : X_BUF
    generic map(
      PATHPULSE => 605 ps
    )
    port map (
      I => rst_IBUF_503,
      O => reg1_Q_3_SRINV_1043
    );
  reg1_Q_3_CLKINV : X_BUF
    generic map(
      PATHPULSE => 605 ps
    )
    port map (
      I => clk_BUFGP,
      O => reg1_Q_3_CLKINV_1042
    );
  Mxor_s1_Result_2_1 : X_LUT4
    generic map(
      INIT => X"6A6A"
    )
    port map (
      ADR0 => byte_in_2_IBUF_502,
      ADR1 => reg2_Q(2),
      ADR2 => control_0_control_EN_temp(3),
      ADR3 => VCC,
      O => s1(2)
    );
  reg1_Q_4 : X_SFF
    generic map(
      INIT => '0'
    )
    port map (
      I => reg1_Q_5_DYMUX_1090,
      CE => VCC,
      CLK => reg1_Q_5_CLKINV_1080,
      SET => GND,
      RST => GND,
      SSET => GND,
      SRST => reg1_Q_5_SRINV_1081,
      O => reg1_Q(4)
    );
  Mxor_s1_Result_5_1 : X_LUT4
    generic map(
      INIT => X"6A6A"
    )
    port map (
      ADR0 => byte_in_5_IBUF_506,
      ADR1 => reg2_Q(5),
      ADR2 => control_0_control_EN_temp(3),
      ADR3 => VCC,
      O => s1(5)
    );
  reg1_Q_5 : X_SFF
    generic map(
      INIT => '0'
    )
    port map (
      I => reg1_Q_5_DXMUX_1103,
      CE => VCC,
      CLK => reg1_Q_5_CLKINV_1080,
      SET => GND,
      RST => GND,
      SSET => GND,
      SRST => reg1_Q_5_SRINV_1081,
      O => reg1_Q(5)
    );
  reg1_Q_5_DXMUX : X_BUF
    generic map(
      PATHPULSE => 605 ps
    )
    port map (
      I => s1(5),
      O => reg1_Q_5_DXMUX_1103
    );
  reg1_Q_5_DYMUX : X_BUF
    generic map(
      PATHPULSE => 605 ps
    )
    port map (
      I => s1(4),
      O => reg1_Q_5_DYMUX_1090
    );
  reg1_Q_5_SRINV : X_BUF
    generic map(
      PATHPULSE => 605 ps
    )
    port map (
      I => rst_IBUF_503,
      O => reg1_Q_5_SRINV_1081
    );
  reg1_Q_5_CLKINV : X_BUF
    generic map(
      PATHPULSE => 605 ps
    )
    port map (
      I => clk_BUFGP,
      O => reg1_Q_5_CLKINV_1080
    );
  Mxor_s1_Result_4_1 : X_LUT4
    generic map(
      INIT => X"6A6A"
    )
    port map (
      ADR0 => byte_in_4_IBUF_505,
      ADR1 => reg2_Q(4),
      ADR2 => control_0_control_EN_temp(3),
      ADR3 => VCC,
      O => s1(4)
    );
  reg1_Q_7_DXMUX : X_BUF
    generic map(
      PATHPULSE => 605 ps
    )
    port map (
      I => s1(7),
      O => reg1_Q_7_DXMUX_1141
    );
  reg1_Q_7_DYMUX : X_BUF
    generic map(
      PATHPULSE => 605 ps
    )
    port map (
      I => s1(6),
      O => reg1_Q_7_DYMUX_1128
    );
  reg1_Q_7_SRINV : X_BUF
    generic map(
      PATHPULSE => 605 ps
    )
    port map (
      I => rst_IBUF_503,
      O => reg1_Q_7_SRINV_1119
    );
  reg1_Q_7_CLKINV : X_BUF
    generic map(
      PATHPULSE => 605 ps
    )
    port map (
      I => clk_BUFGP,
      O => reg1_Q_7_CLKINV_1118
    );
  reg2_Q_2_DXMUX : X_BUF
    generic map(
      PATHPULSE => 605 ps
    )
    port map (
      I => s2_2_Q,
      O => reg2_Q_2_DXMUX_1179
    );
  reg2_Q_2_DYMUX : X_BUF
    generic map(
      PATHPULSE => 605 ps
    )
    port map (
      I => s2_0_Q,
      O => reg2_Q_2_DYMUX_1167
    );
  reg2_Q_2_SRINV : X_BUF
    generic map(
      PATHPULSE => 605 ps
    )
    port map (
      I => rst_IBUF_503,
      O => reg2_Q_2_SRINV_1159
    );
  reg2_Q_2_CLKINV : X_BUF
    generic map(
      PATHPULSE => 605 ps
    )
    port map (
      I => clk_BUFGP,
      O => reg2_Q_2_CLKINV_1158
    );
  reg2_Q_5_DYMUX : X_BUF
    generic map(
      PATHPULSE => 605 ps
    )
    port map (
      I => s2_5_Q,
      O => reg2_Q_5_DYMUX_1200
    );
  reg2_Q_5_SRINV : X_BUF
    generic map(
      PATHPULSE => 605 ps
    )
    port map (
      I => rst_IBUF_503,
      O => reg2_Q_5_SRINV_1192
    );
  reg2_Q_5_CLKINV : X_BUF
    generic map(
      PATHPULSE => 605 ps
    )
    port map (
      I => clk_BUFGP,
      O => reg2_Q_5_CLKINV_1191
    );
  reg2_Q_7_DXMUX : X_BUF
    generic map(
      PATHPULSE => 605 ps
    )
    port map (
      I => s2_7_Q,
      O => reg2_Q_7_DXMUX_1238
    );
  reg2_Q_7_DYMUX : X_BUF
    generic map(
      PATHPULSE => 605 ps
    )
    port map (
      I => s2_6_Q,
      O => reg2_Q_7_DYMUX_1226
    );
  reg2_Q_7_SRINV : X_BUF
    generic map(
      PATHPULSE => 605 ps
    )
    port map (
      I => rst_IBUF_503,
      O => reg2_Q_7_SRINV_1218
    );
  reg2_Q_7_CLKINV : X_BUF
    generic map(
      PATHPULSE => 605 ps
    )
    port map (
      I => clk_BUFGP,
      O => reg2_Q_7_CLKINV_1217
    );
  reg3_Q_1_DXMUX : X_BUF
    generic map(
      PATHPULSE => 605 ps
    )
    port map (
      I => s3(1),
      O => reg3_Q_1_DXMUX_1276
    );
  reg3_Q_1_DYMUX : X_BUF
    generic map(
      PATHPULSE => 605 ps
    )
    port map (
      I => s3(0),
      O => reg3_Q_1_DYMUX_1264
    );
  reg3_Q_1_SRINV : X_BUF
    generic map(
      PATHPULSE => 605 ps
    )
    port map (
      I => rst_IBUF_503,
      O => reg3_Q_1_SRINV_1255
    );
  reg3_Q_1_CLKINV : X_BUF
    generic map(
      PATHPULSE => 605 ps
    )
    port map (
      I => clk_BUFGP,
      O => reg3_Q_1_CLKINV_1254
    );
  reg3_Q_3_DXMUX : X_BUF
    generic map(
      PATHPULSE => 605 ps
    )
    port map (
      I => s3(3),
      O => reg3_Q_3_DXMUX_1314
    );
  reg3_Q_3_DYMUX : X_BUF
    generic map(
      PATHPULSE => 605 ps
    )
    port map (
      I => s3(2),
      O => reg3_Q_3_DYMUX_1302
    );
  reg3_Q_3_SRINV : X_BUF
    generic map(
      PATHPULSE => 605 ps
    )
    port map (
      I => rst_IBUF_503,
      O => reg3_Q_3_SRINV_1293
    );
  reg3_Q_3_CLKINV : X_BUF
    generic map(
      PATHPULSE => 605 ps
    )
    port map (
      I => clk_BUFGP,
      O => reg3_Q_3_CLKINV_1292
    );
  reg3_Q_4 : X_SFF
    generic map(
      INIT => '0'
    )
    port map (
      I => reg3_Q_5_DYMUX_1339,
      CE => VCC,
      CLK => reg3_Q_5_CLKINV_1330,
      SET => GND,
      RST => GND,
      SSET => GND,
      SRST => reg3_Q_5_SRINV_1331,
      O => reg3_Q(4)
    );
  Mxor_s3_Result_5_1 : X_LUT4
    generic map(
      INIT => X"6A6A"
    )
    port map (
      ADR0 => byte_in_4_IBUF_505,
      ADR1 => reg0_Q(5),
      ADR2 => control_0_control_EN_temp(3),
      ADR3 => VCC,
      O => s3(5)
    );
  reg3_Q_5 : X_SFF
    generic map(
      INIT => '0'
    )
    port map (
      I => reg3_Q_5_DXMUX_1352,
      CE => VCC,
      CLK => reg3_Q_5_CLKINV_1330,
      SET => GND,
      RST => GND,
      SSET => GND,
      SRST => reg3_Q_5_SRINV_1331,
      O => reg3_Q(5)
    );
  reg3_Q_5_DXMUX : X_BUF
    generic map(
      PATHPULSE => 605 ps
    )
    port map (
      I => s3(5),
      O => reg3_Q_5_DXMUX_1352
    );
  reg3_Q_5_DYMUX : X_BUF
    generic map(
      PATHPULSE => 605 ps
    )
    port map (
      I => s3(4),
      O => reg3_Q_5_DYMUX_1339
    );
  reg3_Q_5_SRINV : X_BUF
    generic map(
      PATHPULSE => 605 ps
    )
    port map (
      I => rst_IBUF_503,
      O => reg3_Q_5_SRINV_1331
    );
  reg3_Q_5_CLKINV : X_BUF
    generic map(
      PATHPULSE => 605 ps
    )
    port map (
      I => clk_BUFGP,
      O => reg3_Q_5_CLKINV_1330
    );
  Mxor_s3_Result_4_1 : X_LUT4
    generic map(
      INIT => X"9666"
    )
    port map (
      ADR0 => byte_in_3_IBUF_504,
      ADR1 => byte_in_7_IBUF_491,
      ADR2 => reg0_Q(4),
      ADR3 => control_0_control_EN_temp(3),
      O => s3(4)
    );
  reg3_Q_6 : X_SFF
    generic map(
      INIT => '0'
    )
    port map (
      I => reg3_Q_7_DYMUX_1377,
      CE => VCC,
      CLK => reg3_Q_7_CLKINV_1367,
      SET => GND,
      RST => GND,
      SSET => GND,
      SRST => reg3_Q_7_SRINV_1368,
      O => reg3_Q(6)
    );
  Mxor_s3_Result_7_1 : X_LUT4
    generic map(
      INIT => X"6A6A"
    )
    port map (
      ADR0 => byte_in_6_IBUF_489,
      ADR1 => reg0_Q(7),
      ADR2 => control_0_control_EN_temp(3),
      ADR3 => VCC,
      O => s3(7)
    );
  reg3_Q_7 : X_SFF
    generic map(
      INIT => '0'
    )
    port map (
      I => reg3_Q_7_DXMUX_1390,
      CE => VCC,
      CLK => reg3_Q_7_CLKINV_1367,
      SET => GND,
      RST => GND,
      SSET => GND,
      SRST => reg3_Q_7_SRINV_1368,
      O => reg3_Q(7)
    );
  reg3_Q_7_DXMUX : X_BUF
    generic map(
      PATHPULSE => 605 ps
    )
    port map (
      I => s3(7),
      O => reg3_Q_7_DXMUX_1390
    );
  reg3_Q_7_DYMUX : X_BUF
    generic map(
      PATHPULSE => 605 ps
    )
    port map (
      I => s3(6),
      O => reg3_Q_7_DYMUX_1377
    );
  reg3_Q_7_SRINV : X_BUF
    generic map(
      PATHPULSE => 605 ps
    )
    port map (
      I => rst_IBUF_503,
      O => reg3_Q_7_SRINV_1368
    );
  reg3_Q_7_CLKINV : X_BUF
    generic map(
      PATHPULSE => 605 ps
    )
    port map (
      I => clk_BUFGP,
      O => reg3_Q_7_CLKINV_1367
    );
  Mxor_s3_Result_6_1 : X_LUT4
    generic map(
      INIT => X"6A6A"
    )
    port map (
      ADR0 => byte_in_5_IBUF_506,
      ADR1 => reg0_Q(6),
      ADR2 => control_0_control_EN_temp(3),
      ADR3 => VCC,
      O => s3(6)
    );
  reg4_Q_0 : X_SFF
    generic map(
      INIT => '0'
    )
    port map (
      I => reg4_Q_1_DYMUX_1415,
      CE => VCC,
      CLK => reg4_Q_1_CLKINV_1405,
      SET => GND,
      RST => GND,
      SSET => GND,
      SRST => reg4_Q_1_SRINV_1406,
      O => reg4_Q(0)
    );
  mux1_X_1_1 : X_LUT4
    generic map(
      INIT => X"CACA"
    )
    port map (
      ADR0 => reg5_Q(1),
      ADR1 => reg1_Q(1),
      ADR2 => control_0_control_load_temp(3),
      ADR3 => VCC,
      O => s17(1)
    );
  reg4_Q_1_DXMUX : X_BUF
    generic map(
      PATHPULSE => 605 ps
    )
    port map (
      I => s17(1),
      O => reg4_Q_1_DXMUX_1428
    );
  reg4_Q_1_DYMUX : X_BUF
    generic map(
      PATHPULSE => 605 ps
    )
    port map (
      I => s17(0),
      O => reg4_Q_1_DYMUX_1415
    );
  reg4_Q_1_SRINV : X_BUF
    generic map(
      PATHPULSE => 605 ps
    )
    port map (
      I => rst_IBUF_503,
      O => reg4_Q_1_SRINV_1406
    );
  reg4_Q_1_CLKINV : X_BUF
    generic map(
      PATHPULSE => 605 ps
    )
    port map (
      I => clk_BUFGP,
      O => reg4_Q_1_CLKINV_1405
    );
  mux1_X_0_1 : X_LUT4
    generic map(
      INIT => X"CACA"
    )
    port map (
      ADR0 => reg5_Q(0),
      ADR1 => reg1_Q(0),
      ADR2 => control_0_control_load_temp(3),
      ADR3 => VCC,
      O => s17(0)
    );
  reg4_Q_3_DXMUX : X_BUF
    generic map(
      PATHPULSE => 605 ps
    )
    port map (
      I => s17(3),
      O => reg4_Q_3_DXMUX_1466
    );
  reg4_Q_3_DYMUX : X_BUF
    generic map(
      PATHPULSE => 605 ps
    )
    port map (
      I => s17(2),
      O => reg4_Q_3_DYMUX_1453
    );
  reg4_Q_3_SRINV : X_BUF
    generic map(
      PATHPULSE => 605 ps
    )
    port map (
      I => rst_IBUF_503,
      O => reg4_Q_3_SRINV_1444
    );
  reg4_Q_3_CLKINV : X_BUF
    generic map(
      PATHPULSE => 605 ps
    )
    port map (
      I => clk_BUFGP,
      O => reg4_Q_3_CLKINV_1443
    );
  reg4_Q_5_DXMUX : X_BUF
    generic map(
      PATHPULSE => 605 ps
    )
    port map (
      I => s17(5),
      O => reg4_Q_5_DXMUX_1504
    );
  reg4_Q_5_DYMUX : X_BUF
    generic map(
      PATHPULSE => 605 ps
    )
    port map (
      I => s17(4),
      O => reg4_Q_5_DYMUX_1491
    );
  reg4_Q_5_SRINV : X_BUF
    generic map(
      PATHPULSE => 605 ps
    )
    port map (
      I => rst_IBUF_503,
      O => reg4_Q_5_SRINV_1482
    );
  reg4_Q_5_CLKINV : X_BUF
    generic map(
      PATHPULSE => 605 ps
    )
    port map (
      I => clk_BUFGP,
      O => reg4_Q_5_CLKINV_1481
    );
  reg4_Q_7_DXMUX : X_BUF
    generic map(
      PATHPULSE => 605 ps
    )
    port map (
      I => s17(7),
      O => reg4_Q_7_DXMUX_1542
    );
  reg4_Q_7_DYMUX : X_BUF
    generic map(
      PATHPULSE => 605 ps
    )
    port map (
      I => s17(6),
      O => reg4_Q_7_DYMUX_1529
    );
  reg4_Q_7_SRINV : X_BUF
    generic map(
      PATHPULSE => 605 ps
    )
    port map (
      I => rst_IBUF_503,
      O => reg4_Q_7_SRINV_1520
    );
  reg4_Q_7_CLKINV : X_BUF
    generic map(
      PATHPULSE => 605 ps
    )
    port map (
      I => clk_BUFGP,
      O => reg4_Q_7_CLKINV_1519
    );
  reg5_Q_1_DXMUX : X_BUF
    generic map(
      PATHPULSE => 605 ps
    )
    port map (
      I => s15(1),
      O => reg5_Q_1_DXMUX_1580
    );
  reg5_Q_1_DYMUX : X_BUF
    generic map(
      PATHPULSE => 605 ps
    )
    port map (
      I => s15(0),
      O => reg5_Q_1_DYMUX_1567
    );
  reg5_Q_1_SRINV : X_BUF
    generic map(
      PATHPULSE => 605 ps
    )
    port map (
      I => rst_IBUF_503,
      O => reg5_Q_1_SRINV_1558
    );
  reg5_Q_1_CLKINV : X_BUF
    generic map(
      PATHPULSE => 605 ps
    )
    port map (
      I => clk_BUFGP,
      O => reg5_Q_1_CLKINV_1557
    );
  reg5_Q_3_DXMUX : X_BUF
    generic map(
      PATHPULSE => 605 ps
    )
    port map (
      I => s15(3),
      O => reg5_Q_3_DXMUX_1618
    );
  reg5_Q_3_DYMUX : X_BUF
    generic map(
      PATHPULSE => 605 ps
    )
    port map (
      I => s15(2),
      O => reg5_Q_3_DYMUX_1605
    );
  reg5_Q_3_SRINV : X_BUF
    generic map(
      PATHPULSE => 605 ps
    )
    port map (
      I => rst_IBUF_503,
      O => reg5_Q_3_SRINV_1596
    );
  reg5_Q_3_CLKINV : X_BUF
    generic map(
      PATHPULSE => 605 ps
    )
    port map (
      I => clk_BUFGP,
      O => reg5_Q_3_CLKINV_1595
    );
  mux0_X_5_1 : X_LUT4
    generic map(
      INIT => X"CACA"
    )
    port map (
      ADR0 => reg6_Q(5),
      ADR1 => reg2_Q(5),
      ADR2 => control_0_control_load_temp(3),
      ADR3 => VCC,
      O => s15(5)
    );
  reg5_Q_5 : X_SFF
    generic map(
      INIT => '0'
    )
    port map (
      I => reg5_Q_5_DXMUX_1656,
      CE => VCC,
      CLK => reg5_Q_5_CLKINV_1633,
      SET => GND,
      RST => GND,
      SSET => GND,
      SRST => reg5_Q_5_SRINV_1634,
      O => reg5_Q(5)
    );
  reg5_Q_5_DXMUX : X_BUF
    generic map(
      PATHPULSE => 605 ps
    )
    port map (
      I => s15(5),
      O => reg5_Q_5_DXMUX_1656
    );
  reg5_Q_5_DYMUX : X_BUF
    generic map(
      PATHPULSE => 605 ps
    )
    port map (
      I => s15(4),
      O => reg5_Q_5_DYMUX_1643
    );
  reg5_Q_5_SRINV : X_BUF
    generic map(
      PATHPULSE => 605 ps
    )
    port map (
      I => rst_IBUF_503,
      O => reg5_Q_5_SRINV_1634
    );
  reg5_Q_5_CLKINV : X_BUF
    generic map(
      PATHPULSE => 605 ps
    )
    port map (
      I => clk_BUFGP,
      O => reg5_Q_5_CLKINV_1633
    );
  reg5_Q_4 : X_SFF
    generic map(
      INIT => '0'
    )
    port map (
      I => reg5_Q_5_DYMUX_1643,
      CE => VCC,
      CLK => reg5_Q_5_CLKINV_1633,
      SET => GND,
      RST => GND,
      SSET => GND,
      SRST => reg5_Q_5_SRINV_1634,
      O => reg5_Q(4)
    );
  reg5_Q_6 : X_SFF
    generic map(
      INIT => '0'
    )
    port map (
      I => reg5_Q_7_DYMUX_1681,
      CE => VCC,
      CLK => reg5_Q_7_CLKINV_1671,
      SET => GND,
      RST => GND,
      SSET => GND,
      SRST => reg5_Q_7_SRINV_1672,
      O => reg5_Q(6)
    );
  mux0_X_7_1 : X_LUT4
    generic map(
      INIT => X"CACA"
    )
    port map (
      ADR0 => reg6_Q(7),
      ADR1 => reg2_Q(7),
      ADR2 => control_0_control_load_temp(3),
      ADR3 => VCC,
      O => s15(7)
    );
  reg5_Q_7 : X_SFF
    generic map(
      INIT => '0'
    )
    port map (
      I => reg5_Q_7_DXMUX_1694,
      CE => VCC,
      CLK => reg5_Q_7_CLKINV_1671,
      SET => GND,
      RST => GND,
      SSET => GND,
      SRST => reg5_Q_7_SRINV_1672,
      O => reg5_Q(7)
    );
  reg5_Q_7_DXMUX : X_BUF
    generic map(
      PATHPULSE => 605 ps
    )
    port map (
      I => s15(7),
      O => reg5_Q_7_DXMUX_1694
    );
  reg5_Q_7_DYMUX : X_BUF
    generic map(
      PATHPULSE => 605 ps
    )
    port map (
      I => s15(6),
      O => reg5_Q_7_DYMUX_1681
    );
  reg5_Q_7_SRINV : X_BUF
    generic map(
      PATHPULSE => 605 ps
    )
    port map (
      I => rst_IBUF_503,
      O => reg5_Q_7_SRINV_1672
    );
  reg5_Q_7_CLKINV : X_BUF
    generic map(
      PATHPULSE => 605 ps
    )
    port map (
      I => clk_BUFGP,
      O => reg5_Q_7_CLKINV_1671
    );
  mux0_X_6_1 : X_LUT4
    generic map(
      INIT => X"CACA"
    )
    port map (
      ADR0 => reg6_Q(6),
      ADR1 => reg2_Q(6),
      ADR2 => control_0_control_load_temp(3),
      ADR3 => VCC,
      O => s15(6)
    );
  reg6_Q_0 : X_SFF
    generic map(
      INIT => '0'
    )
    port map (
      I => reg6_Q_1_DYMUX_1719,
      CE => VCC,
      CLK => reg6_Q_1_CLKINV_1709,
      SET => GND,
      RST => GND,
      SSET => GND,
      SRST => reg6_Q_1_SRINV_1710,
      O => reg6_Q(0)
    );
  reg6_Q_1_DXMUX : X_BUF
    generic map(
      PATHPULSE => 605 ps
    )
    port map (
      I => s19(1),
      O => reg6_Q_1_DXMUX_1732
    );
  reg6_Q_1_DYMUX : X_BUF
    generic map(
      PATHPULSE => 605 ps
    )
    port map (
      I => s19(0),
      O => reg6_Q_1_DYMUX_1719
    );
  reg6_Q_1_SRINV : X_BUF
    generic map(
      PATHPULSE => 605 ps
    )
    port map (
      I => rst_IBUF_503,
      O => reg6_Q_1_SRINV_1710
    );
  reg6_Q_1_CLKINV : X_BUF
    generic map(
      PATHPULSE => 605 ps
    )
    port map (
      I => clk_BUFGP,
      O => reg6_Q_1_CLKINV_1709
    );
  mux3_X_0_1 : X_LUT4
    generic map(
      INIT => X"CACA"
    )
    port map (
      ADR0 => byte_in_0_IBUF_500,
      ADR1 => reg3_Q(0),
      ADR2 => control_0_control_load_temp(3),
      ADR3 => VCC,
      O => s19(0)
    );
  reg6_Q_3_DXMUX : X_BUF
    generic map(
      PATHPULSE => 605 ps
    )
    port map (
      I => s19(3),
      O => reg6_Q_3_DXMUX_1770
    );
  reg6_Q_3_DYMUX : X_BUF
    generic map(
      PATHPULSE => 605 ps
    )
    port map (
      I => s19(2),
      O => reg6_Q_3_DYMUX_1757
    );
  reg6_Q_3_SRINV : X_BUF
    generic map(
      PATHPULSE => 605 ps
    )
    port map (
      I => rst_IBUF_503,
      O => reg6_Q_3_SRINV_1748
    );
  reg6_Q_3_CLKINV : X_BUF
    generic map(
      PATHPULSE => 605 ps
    )
    port map (
      I => clk_BUFGP,
      O => reg6_Q_3_CLKINV_1747
    );
  reg6_Q_5_DXMUX : X_BUF
    generic map(
      PATHPULSE => 605 ps
    )
    port map (
      I => s19(5),
      O => reg6_Q_5_DXMUX_1808
    );
  reg6_Q_5_DYMUX : X_BUF
    generic map(
      PATHPULSE => 605 ps
    )
    port map (
      I => s19(4),
      O => reg6_Q_5_DYMUX_1795
    );
  reg6_Q_5_SRINV : X_BUF
    generic map(
      PATHPULSE => 605 ps
    )
    port map (
      I => rst_IBUF_503,
      O => reg6_Q_5_SRINV_1786
    );
  reg6_Q_5_CLKINV : X_BUF
    generic map(
      PATHPULSE => 605 ps
    )
    port map (
      I => clk_BUFGP,
      O => reg6_Q_5_CLKINV_1785
    );
  control_0_control_EN_temp_0_DYMUX : X_BUF
    generic map(
      PATHPULSE => 605 ps
    )
    port map (
      I => rst_IBUF_503,
      O => control_0_control_EN_temp_0_DYMUX_1820
    );
  control_0_control_EN_temp_0_SRINV : X_BUF
    generic map(
      PATHPULSE => 605 ps
    )
    port map (
      I => control_0_control_EN_temp(3),
      O => control_0_control_EN_temp_0_SRINV_1818
    );
  control_0_control_EN_temp_0_CLKINV : X_BUF
    generic map(
      PATHPULSE => 605 ps
    )
    port map (
      I => clk_BUFGP,
      O => control_0_control_EN_temp_0_CLKINV_1817
    );
  control_0_control_EN_temp_1_DYMUX : X_BUF
    generic map(
      PATHPULSE => 605 ps
    )
    port map (
      I => rst_IBUF_503,
      O => control_0_control_EN_temp_1_DYMUX_1832
    );
  control_0_control_EN_temp_1_SRINV : X_BUF
    generic map(
      PATHPULSE => 605 ps
    )
    port map (
      I => control_0_control_EN_temp(0),
      O => control_0_control_EN_temp_1_SRINV_1830
    );
  control_0_control_EN_temp_1_CLKINV : X_BUF
    generic map(
      PATHPULSE => 605 ps
    )
    port map (
      I => clk_BUFGP,
      O => control_0_control_EN_temp_1_CLKINV_1829
    );
  control_0_control_EN_temp_2_DYMUX : X_BUF
    generic map(
      PATHPULSE => 605 ps
    )
    port map (
      I => control_0_control_EN_temp(1),
      O => control_0_control_EN_temp_2_DYMUX_1844
    );
  control_0_control_EN_temp_2_SRINV : X_BUF
    generic map(
      PATHPULSE => 605 ps
    )
    port map (
      I => rst_IBUF_503,
      O => control_0_control_EN_temp_2_SRINV_1842
    );
  control_0_control_EN_temp_2_CLKINV : X_BUF
    generic map(
      PATHPULSE => 605 ps
    )
    port map (
      I => clk_BUFGP,
      O => control_0_control_EN_temp_2_CLKINV_1841
    );
  control_0_control_EN_temp_3_DYMUX : X_BUF
    generic map(
      PATHPULSE => 605 ps
    )
    port map (
      I => rst_IBUF_503,
      O => control_0_control_EN_temp_3_DYMUX_1856
    );
  control_0_control_EN_temp_3_SRINV : X_BUF
    generic map(
      PATHPULSE => 605 ps
    )
    port map (
      I => control_0_control_EN_temp(2),
      O => control_0_control_EN_temp_3_SRINV_1854
    );
  control_0_control_EN_temp_3_CLKINV : X_BUF
    generic map(
      PATHPULSE => 605 ps
    )
    port map (
      I => clk_BUFGP,
      O => control_0_control_EN_temp_3_CLKINV_1853
    );
  mux2_X_7_1 : X_LUT4
    generic map(
      INIT => X"E4E4"
    )
    port map (
      ADR0 => control_0_control_load_temp(3),
      ADR1 => reg4_Q(7),
      ADR2 => reg0_Q(7),
      ADR3 => VCC,
      O => byte_out_7_OBUF_1954
    );
  mux2_X_6_1 : X_LUT4
    generic map(
      INIT => X"E4E4"
    )
    port map (
      ADR0 => control_0_control_load_temp(3),
      ADR1 => reg4_Q(6),
      ADR2 => reg0_Q(6),
      ADR3 => VCC,
      O => byte_out_6_OBUF_1946
    );
  control_0_control_load_temp_0 : X_SFF
    generic map(
      INIT => '0'
    )
    port map (
      I => control_0_control_load_temp_1_DYMUX_1966,
      CE => VCC,
      CLK => control_0_control_load_temp_1_CLKINV_1963,
      SET => GND,
      RST => GND,
      SSET => GND,
      SRST => control_0_control_load_temp_1_SRINV_1964,
      O => control_0_control_load_temp(0)
    );
  control_0_control_load_temp_1 : X_SFF
    generic map(
      INIT => '0'
    )
    port map (
      I => control_0_control_load_temp_1_DXMUX_1972,
      CE => VCC,
      CLK => control_0_control_load_temp_1_CLKINV_1963,
      SET => GND,
      RST => GND,
      SSET => GND,
      SRST => control_0_control_load_temp_1_SRINV_1964,
      O => control_0_control_load_temp(1)
    );
  control_0_control_load_temp_1_DXMUX : X_BUF
    generic map(
      PATHPULSE => 605 ps
    )
    port map (
      I => control_0_control_load_temp(0),
      O => control_0_control_load_temp_1_DXMUX_1972
    );
  control_0_control_load_temp_1_DYMUX : X_BUF
    generic map(
      PATHPULSE => 605 ps
    )
    port map (
      I => control_0_control_load_temp(3),
      O => control_0_control_load_temp_1_DYMUX_1966
    );
  control_0_control_load_temp_1_SRINV : X_BUF
    generic map(
      PATHPULSE => 605 ps
    )
    port map (
      I => rst_IBUF_503,
      O => control_0_control_load_temp_1_SRINV_1964
    );
  control_0_control_load_temp_1_CLKINV : X_BUF
    generic map(
      PATHPULSE => 605 ps
    )
    port map (
      I => clk_BUFGP,
      O => control_0_control_load_temp_1_CLKINV_1963
    );
  control_0_control_load_temp_2_DYMUX : X_BUF
    generic map(
      PATHPULSE => 605 ps
    )
    port map (
      I => rst_IBUF_503,
      O => control_0_control_load_temp_2_DYMUX_1984
    );
  control_0_control_load_temp_2_SRINV : X_BUF
    generic map(
      PATHPULSE => 605 ps
    )
    port map (
      I => control_0_control_load_temp(1),
      O => control_0_control_load_temp_2_SRINV_1982
    );
  control_0_control_load_temp_2_CLKINV : X_BUF
    generic map(
      PATHPULSE => 605 ps
    )
    port map (
      I => clk_BUFGP,
      O => control_0_control_load_temp_2_CLKINV_1981
    );
  control_0_control_load_temp_3_DYMUX : X_BUF
    generic map(
      PATHPULSE => 605 ps
    )
    port map (
      I => control_0_control_load_temp(2),
      O => control_0_control_load_temp_3_DYMUX_1996
    );
  control_0_control_load_temp_3_SRINV : X_BUF
    generic map(
      PATHPULSE => 605 ps
    )
    port map (
      I => rst_IBUF_503,
      O => control_0_control_load_temp_3_SRINV_1994
    );
  control_0_control_load_temp_3_CLKINV : X_BUF
    generic map(
      PATHPULSE => 605 ps
    )
    port map (
      I => clk_BUFGP,
      O => control_0_control_load_temp_3_CLKINV_1993
    );
  byte_in_6_IFF_IMUX : X_BUF
    generic map(
      PATHPULSE => 605 ps
    )
    port map (
      I => byte_in_6_INBUF,
      O => byte_in_6_IBUF_489
    );
  clk_IFF_IMUX : X_BUF
    generic map(
      PATHPULSE => 605 ps
    )
    port map (
      I => clk_INBUF,
      O => clk_BUFGP_IBUFG_496
    );
  byte_in_0_IFF_IMUX : X_BUF
    generic map(
      PATHPULSE => 605 ps
    )
    port map (
      I => byte_in_0_INBUF,
      O => byte_in_0_IBUF_500
    );
  byte_in_1_IFF_IMUX : X_BUF
    generic map(
      PATHPULSE => 605 ps
    )
    port map (
      I => byte_in_1_INBUF,
      O => byte_in_1_IBUF_501
    );
  byte_in_2_IFF_IMUX : X_BUF
    generic map(
      PATHPULSE => 605 ps
    )
    port map (
      I => byte_in_2_INBUF,
      O => byte_in_2_IBUF_502
    );
  rst_IFF_IMUX : X_BUF
    generic map(
      PATHPULSE => 605 ps
    )
    port map (
      I => rst_INBUF,
      O => rst_IBUF_503
    );
  byte_in_3_IFF_IMUX : X_BUF
    generic map(
      PATHPULSE => 605 ps
    )
    port map (
      I => byte_in_3_INBUF,
      O => byte_in_3_IBUF_504
    );
  byte_in_4_IFF_IMUX : X_BUF
    generic map(
      PATHPULSE => 605 ps
    )
    port map (
      I => byte_in_4_INBUF,
      O => byte_in_4_IBUF_505
    );
  Mxor_s0_Result_0_1 : X_LUT4
    generic map(
      INIT => X"6A6A"
    )
    port map (
      ADR0 => byte_in_0_IBUF_500,
      ADR1 => reg1_Q(0),
      ADR2 => control_0_control_EN_temp(3),
      ADR3 => VCC,
      O => s0(0)
    );
  reg0_Q_0 : X_SFF
    generic map(
      INIT => '0'
    )
    port map (
      I => reg0_Q_1_DYMUX_824,
      CE => VCC,
      CLK => reg0_Q_1_CLKINV_814,
      SET => GND,
      RST => GND,
      SSET => GND,
      SRST => reg0_Q_1_SRINV_815,
      O => reg0_Q(0)
    );
  Mxor_s0_Result_1_1 : X_LUT4
    generic map(
      INIT => X"6A6A"
    )
    port map (
      ADR0 => byte_in_1_IBUF_501,
      ADR1 => reg1_Q(1),
      ADR2 => control_0_control_EN_temp(3),
      ADR3 => VCC,
      O => s0(1)
    );
  reg0_Q_1 : X_SFF
    generic map(
      INIT => '0'
    )
    port map (
      I => reg0_Q_1_DXMUX_837,
      CE => VCC,
      CLK => reg0_Q_1_CLKINV_814,
      SET => GND,
      RST => GND,
      SSET => GND,
      SRST => reg0_Q_1_SRINV_815,
      O => reg0_Q(1)
    );
  mux3_X_6_1 : X_LUT4
    generic map(
      INIT => X"CACA"
    )
    port map (
      ADR0 => byte_in_6_IBUF_489,
      ADR1 => reg3_Q(6),
      ADR2 => control_0_control_load_temp(3),
      ADR3 => VCC,
      O => s19(6)
    );
  reg6_Q_6 : X_SFF
    generic map(
      INIT => '0'
    )
    port map (
      I => reg6_Q_7_DYMUX_862,
      CE => VCC,
      CLK => reg6_Q_7_CLKINV_852,
      SET => GND,
      RST => GND,
      SSET => GND,
      SRST => reg6_Q_7_SRINV_853,
      O => reg6_Q(6)
    );
  mux3_X_7_1 : X_LUT4
    generic map(
      INIT => X"CACA"
    )
    port map (
      ADR0 => byte_in_7_IBUF_491,
      ADR1 => reg3_Q(7),
      ADR2 => control_0_control_load_temp(3),
      ADR3 => VCC,
      O => s19(7)
    );
  reg6_Q_7 : X_SFF
    generic map(
      INIT => '0'
    )
    port map (
      I => reg6_Q_7_DXMUX_875,
      CE => VCC,
      CLK => reg6_Q_7_CLKINV_852,
      SET => GND,
      RST => GND,
      SSET => GND,
      SRST => reg6_Q_7_SRINV_853,
      O => reg6_Q(7)
    );
  Mxor_s0_Result_2_1 : X_LUT4
    generic map(
      INIT => X"6A6A"
    )
    port map (
      ADR0 => byte_in_2_IBUF_502,
      ADR1 => reg1_Q(2),
      ADR2 => control_0_control_EN_temp(3),
      ADR3 => VCC,
      O => s0(2)
    );
  reg0_Q_2 : X_SFF
    generic map(
      INIT => '0'
    )
    port map (
      I => reg0_Q_3_DYMUX_900,
      CE => VCC,
      CLK => reg0_Q_3_CLKINV_890,
      SET => GND,
      RST => GND,
      SSET => GND,
      SRST => reg0_Q_3_SRINV_891,
      O => reg0_Q(2)
    );
  Mxor_s0_Result_3_1 : X_LUT4
    generic map(
      INIT => X"6A6A"
    )
    port map (
      ADR0 => byte_in_3_IBUF_504,
      ADR1 => reg1_Q(3),
      ADR2 => control_0_control_EN_temp(3),
      ADR3 => VCC,
      O => s0(3)
    );
  reg0_Q_3 : X_SFF
    generic map(
      INIT => '0'
    )
    port map (
      I => reg0_Q_3_DXMUX_913,
      CE => VCC,
      CLK => reg0_Q_3_CLKINV_890,
      SET => GND,
      RST => GND,
      SSET => GND,
      SRST => reg0_Q_3_SRINV_891,
      O => reg0_Q(3)
    );
  Mxor_s0_Result_4_1 : X_LUT4
    generic map(
      INIT => X"6A6A"
    )
    port map (
      ADR0 => byte_in_4_IBUF_505,
      ADR1 => reg1_Q(4),
      ADR2 => control_0_control_EN_temp(3),
      ADR3 => VCC,
      O => s0(4)
    );
  reg0_Q_4 : X_SFF
    generic map(
      INIT => '0'
    )
    port map (
      I => reg0_Q_5_DYMUX_938,
      CE => VCC,
      CLK => reg0_Q_5_CLKINV_928,
      SET => GND,
      RST => GND,
      SSET => GND,
      SRST => reg0_Q_5_SRINV_929,
      O => reg0_Q(4)
    );
  Mxor_s0_Result_5_1 : X_LUT4
    generic map(
      INIT => X"6A6A"
    )
    port map (
      ADR0 => byte_in_5_IBUF_506,
      ADR1 => reg1_Q(5),
      ADR2 => control_0_control_EN_temp(3),
      ADR3 => VCC,
      O => s0(5)
    );
  reg0_Q_5 : X_SFF
    generic map(
      INIT => '0'
    )
    port map (
      I => reg0_Q_5_DXMUX_951,
      CE => VCC,
      CLK => reg0_Q_5_CLKINV_928,
      SET => GND,
      RST => GND,
      SSET => GND,
      SRST => reg0_Q_5_SRINV_929,
      O => reg0_Q(5)
    );
  Mxor_s0_Result_6_1 : X_LUT4
    generic map(
      INIT => X"6A6A"
    )
    port map (
      ADR0 => byte_in_6_IBUF_489,
      ADR1 => reg1_Q(6),
      ADR2 => control_0_control_EN_temp(3),
      ADR3 => VCC,
      O => s0(6)
    );
  reg0_Q_6 : X_SFF
    generic map(
      INIT => '0'
    )
    port map (
      I => reg0_Q_7_DYMUX_976,
      CE => VCC,
      CLK => reg0_Q_7_CLKINV_966,
      SET => GND,
      RST => GND,
      SSET => GND,
      SRST => reg0_Q_7_SRINV_967,
      O => reg0_Q(6)
    );
  Mxor_s0_Result_7_1 : X_LUT4
    generic map(
      INIT => X"6A6A"
    )
    port map (
      ADR0 => byte_in_7_IBUF_491,
      ADR1 => reg1_Q(7),
      ADR2 => control_0_control_EN_temp(3),
      ADR3 => VCC,
      O => s0(7)
    );
  reg0_Q_7 : X_SFF
    generic map(
      INIT => '0'
    )
    port map (
      I => reg0_Q_7_DXMUX_989,
      CE => VCC,
      CLK => reg0_Q_7_CLKINV_966,
      SET => GND,
      RST => GND,
      SSET => GND,
      SRST => reg0_Q_7_SRINV_967,
      O => reg0_Q(7)
    );
  Mxor_s1_Result_0_1 : X_LUT4
    generic map(
      INIT => X"6A6A"
    )
    port map (
      ADR0 => byte_in_0_IBUF_500,
      ADR1 => reg2_Q(0),
      ADR2 => control_0_control_EN_temp(3),
      ADR3 => VCC,
      O => s1(0)
    );
  reg1_Q_0 : X_SFF
    generic map(
      INIT => '0'
    )
    port map (
      I => reg1_Q_1_DYMUX_1014,
      CE => VCC,
      CLK => reg1_Q_1_CLKINV_1004,
      SET => GND,
      RST => GND,
      SSET => GND,
      SRST => reg1_Q_1_SRINV_1005,
      O => reg1_Q(0)
    );
  Mxor_s1_Result_1_1 : X_LUT4
    generic map(
      INIT => X"6A6A"
    )
    port map (
      ADR0 => byte_in_1_IBUF_501,
      ADR1 => reg2_Q(1),
      ADR2 => control_0_control_EN_temp(3),
      ADR3 => VCC,
      O => s1(1)
    );
  Mxor_s1_Result_6_1 : X_LUT4
    generic map(
      INIT => X"6A6A"
    )
    port map (
      ADR0 => byte_in_6_IBUF_489,
      ADR1 => reg2_Q(6),
      ADR2 => control_0_control_EN_temp(3),
      ADR3 => VCC,
      O => s1(6)
    );
  reg1_Q_6 : X_SFF
    generic map(
      INIT => '0'
    )
    port map (
      I => reg1_Q_7_DYMUX_1128,
      CE => VCC,
      CLK => reg1_Q_7_CLKINV_1118,
      SET => GND,
      RST => GND,
      SSET => GND,
      SRST => reg1_Q_7_SRINV_1119,
      O => reg1_Q(6)
    );
  Mxor_s1_Result_7_1 : X_LUT4
    generic map(
      INIT => X"6A6A"
    )
    port map (
      ADR0 => byte_in_7_IBUF_491,
      ADR1 => reg2_Q(7),
      ADR2 => control_0_control_EN_temp(3),
      ADR3 => VCC,
      O => s1(7)
    );
  reg1_Q_7 : X_SFF
    generic map(
      INIT => '0'
    )
    port map (
      I => reg1_Q_7_DXMUX_1141,
      CE => VCC,
      CLK => reg1_Q_7_CLKINV_1118,
      SET => GND,
      RST => GND,
      SSET => GND,
      SRST => reg1_Q_7_SRINV_1119,
      O => reg1_Q(7)
    );
  Mxor_s2_Result_0_1 : X_LUT4
    generic map(
      INIT => X"9666"
    )
    port map (
      ADR0 => byte_in_0_IBUF_500,
      ADR1 => byte_in_7_IBUF_491,
      ADR2 => reg3_Q(0),
      ADR3 => control_0_control_EN_temp(3),
      O => s2_0_Q
    );
  reg2_Q_0 : X_SFF
    generic map(
      INIT => '0'
    )
    port map (
      I => reg2_Q_2_DYMUX_1167,
      CE => VCC,
      CLK => reg2_Q_2_CLKINV_1158,
      SET => GND,
      RST => GND,
      SSET => GND,
      SRST => reg2_Q_2_SRINV_1159,
      O => reg2_Q(0)
    );
  Mxor_s2_Result_2_1 : X_LUT4
    generic map(
      INIT => X"9666"
    )
    port map (
      ADR0 => byte_in_2_IBUF_502,
      ADR1 => byte_in_1_IBUF_501,
      ADR2 => reg3_Q(2),
      ADR3 => control_0_control_EN_temp(3),
      O => s2_2_Q
    );
  reg2_Q_2 : X_SFF
    generic map(
      INIT => '0'
    )
    port map (
      I => reg2_Q_2_DXMUX_1179,
      CE => VCC,
      CLK => reg2_Q_2_CLKINV_1158,
      SET => GND,
      RST => GND,
      SSET => GND,
      SRST => reg2_Q_2_SRINV_1159,
      O => reg2_Q(2)
    );
  Mxor_s2_Result_5_1 : X_LUT4
    generic map(
      INIT => X"9666"
    )
    port map (
      ADR0 => byte_in_5_IBUF_506,
      ADR1 => byte_in_4_IBUF_505,
      ADR2 => reg3_Q(5),
      ADR3 => control_0_control_EN_temp(3),
      O => s2_5_Q
    );
  reg2_Q_5 : X_SFF
    generic map(
      INIT => '0'
    )
    port map (
      I => reg2_Q_5_DYMUX_1200,
      CE => VCC,
      CLK => reg2_Q_5_CLKINV_1191,
      SET => GND,
      RST => GND,
      SSET => GND,
      SRST => reg2_Q_5_SRINV_1192,
      O => reg2_Q(5)
    );
  Mxor_s2_Result_6_1 : X_LUT4
    generic map(
      INIT => X"9666"
    )
    port map (
      ADR0 => byte_in_6_IBUF_489,
      ADR1 => byte_in_5_IBUF_506,
      ADR2 => reg3_Q(6),
      ADR3 => control_0_control_EN_temp(3),
      O => s2_6_Q
    );
  reg2_Q_6 : X_SFF
    generic map(
      INIT => '0'
    )
    port map (
      I => reg2_Q_7_DYMUX_1226,
      CE => VCC,
      CLK => reg2_Q_7_CLKINV_1217,
      SET => GND,
      RST => GND,
      SSET => GND,
      SRST => reg2_Q_7_SRINV_1218,
      O => reg2_Q(6)
    );
  Mxor_s2_Result_7_1 : X_LUT4
    generic map(
      INIT => X"9666"
    )
    port map (
      ADR0 => byte_in_7_IBUF_491,
      ADR1 => byte_in_6_IBUF_489,
      ADR2 => reg3_Q(7),
      ADR3 => control_0_control_EN_temp(3),
      O => s2_7_Q
    );
  reg2_Q_7 : X_SFF
    generic map(
      INIT => '0'
    )
    port map (
      I => reg2_Q_7_DXMUX_1238,
      CE => VCC,
      CLK => reg2_Q_7_CLKINV_1217,
      SET => GND,
      RST => GND,
      SSET => GND,
      SRST => reg2_Q_7_SRINV_1218,
      O => reg2_Q(7)
    );
  Mxor_s3_Result_0_1 : X_LUT4
    generic map(
      INIT => X"6A6A"
    )
    port map (
      ADR0 => byte_in_7_IBUF_491,
      ADR1 => reg0_Q(0),
      ADR2 => control_0_control_EN_temp(3),
      ADR3 => VCC,
      O => s3(0)
    );
  reg3_Q_0 : X_SFF
    generic map(
      INIT => '0'
    )
    port map (
      I => reg3_Q_1_DYMUX_1264,
      CE => VCC,
      CLK => reg3_Q_1_CLKINV_1254,
      SET => GND,
      RST => GND,
      SSET => GND,
      SRST => reg3_Q_1_SRINV_1255,
      O => reg3_Q(0)
    );
  Mxor_s3_Result_1_1 : X_LUT4
    generic map(
      INIT => X"9666"
    )
    port map (
      ADR0 => byte_in_0_IBUF_500,
      ADR1 => byte_in_7_IBUF_491,
      ADR2 => reg0_Q(1),
      ADR3 => control_0_control_EN_temp(3),
      O => s3(1)
    );
  reg3_Q_1 : X_SFF
    generic map(
      INIT => '0'
    )
    port map (
      I => reg3_Q_1_DXMUX_1276,
      CE => VCC,
      CLK => reg3_Q_1_CLKINV_1254,
      SET => GND,
      RST => GND,
      SSET => GND,
      SRST => reg3_Q_1_SRINV_1255,
      O => reg3_Q(1)
    );
  Mxor_s3_Result_2_1 : X_LUT4
    generic map(
      INIT => X"6A6A"
    )
    port map (
      ADR0 => byte_in_1_IBUF_501,
      ADR1 => reg0_Q(2),
      ADR2 => control_0_control_EN_temp(3),
      ADR3 => VCC,
      O => s3(2)
    );
  reg3_Q_2 : X_SFF
    generic map(
      INIT => '0'
    )
    port map (
      I => reg3_Q_3_DYMUX_1302,
      CE => VCC,
      CLK => reg3_Q_3_CLKINV_1292,
      SET => GND,
      RST => GND,
      SSET => GND,
      SRST => reg3_Q_3_SRINV_1293,
      O => reg3_Q(2)
    );
  Mxor_s3_Result_3_1 : X_LUT4
    generic map(
      INIT => X"9666"
    )
    port map (
      ADR0 => byte_in_2_IBUF_502,
      ADR1 => byte_in_7_IBUF_491,
      ADR2 => reg0_Q(3),
      ADR3 => control_0_control_EN_temp(3),
      O => s3(3)
    );
  reg3_Q_3 : X_SFF
    generic map(
      INIT => '0'
    )
    port map (
      I => reg3_Q_3_DXMUX_1314,
      CE => VCC,
      CLK => reg3_Q_3_CLKINV_1292,
      SET => GND,
      RST => GND,
      SSET => GND,
      SRST => reg3_Q_3_SRINV_1293,
      O => reg3_Q(3)
    );
  reg4_Q_1 : X_SFF
    generic map(
      INIT => '0'
    )
    port map (
      I => reg4_Q_1_DXMUX_1428,
      CE => VCC,
      CLK => reg4_Q_1_CLKINV_1405,
      SET => GND,
      RST => GND,
      SSET => GND,
      SRST => reg4_Q_1_SRINV_1406,
      O => reg4_Q(1)
    );
  mux1_X_2_1 : X_LUT4
    generic map(
      INIT => X"CACA"
    )
    port map (
      ADR0 => reg5_Q(2),
      ADR1 => reg1_Q(2),
      ADR2 => control_0_control_load_temp(3),
      ADR3 => VCC,
      O => s17(2)
    );
  reg4_Q_2 : X_SFF
    generic map(
      INIT => '0'
    )
    port map (
      I => reg4_Q_3_DYMUX_1453,
      CE => VCC,
      CLK => reg4_Q_3_CLKINV_1443,
      SET => GND,
      RST => GND,
      SSET => GND,
      SRST => reg4_Q_3_SRINV_1444,
      O => reg4_Q(2)
    );
  mux1_X_3_1 : X_LUT4
    generic map(
      INIT => X"CACA"
    )
    port map (
      ADR0 => reg5_Q(3),
      ADR1 => reg1_Q(3),
      ADR2 => control_0_control_load_temp(3),
      ADR3 => VCC,
      O => s17(3)
    );
  reg4_Q_3 : X_SFF
    generic map(
      INIT => '0'
    )
    port map (
      I => reg4_Q_3_DXMUX_1466,
      CE => VCC,
      CLK => reg4_Q_3_CLKINV_1443,
      SET => GND,
      RST => GND,
      SSET => GND,
      SRST => reg4_Q_3_SRINV_1444,
      O => reg4_Q(3)
    );
  mux1_X_4_1 : X_LUT4
    generic map(
      INIT => X"CACA"
    )
    port map (
      ADR0 => reg5_Q(4),
      ADR1 => reg1_Q(4),
      ADR2 => control_0_control_load_temp(3),
      ADR3 => VCC,
      O => s17(4)
    );
  reg4_Q_4 : X_SFF
    generic map(
      INIT => '0'
    )
    port map (
      I => reg4_Q_5_DYMUX_1491,
      CE => VCC,
      CLK => reg4_Q_5_CLKINV_1481,
      SET => GND,
      RST => GND,
      SSET => GND,
      SRST => reg4_Q_5_SRINV_1482,
      O => reg4_Q(4)
    );
  mux1_X_5_1 : X_LUT4
    generic map(
      INIT => X"CACA"
    )
    port map (
      ADR0 => reg5_Q(5),
      ADR1 => reg1_Q(5),
      ADR2 => control_0_control_load_temp(3),
      ADR3 => VCC,
      O => s17(5)
    );
  reg4_Q_5 : X_SFF
    generic map(
      INIT => '0'
    )
    port map (
      I => reg4_Q_5_DXMUX_1504,
      CE => VCC,
      CLK => reg4_Q_5_CLKINV_1481,
      SET => GND,
      RST => GND,
      SSET => GND,
      SRST => reg4_Q_5_SRINV_1482,
      O => reg4_Q(5)
    );
  mux1_X_6_1 : X_LUT4
    generic map(
      INIT => X"CACA"
    )
    port map (
      ADR0 => reg5_Q(6),
      ADR1 => reg1_Q(6),
      ADR2 => control_0_control_load_temp(3),
      ADR3 => VCC,
      O => s17(6)
    );
  reg4_Q_6 : X_SFF
    generic map(
      INIT => '0'
    )
    port map (
      I => reg4_Q_7_DYMUX_1529,
      CE => VCC,
      CLK => reg4_Q_7_CLKINV_1519,
      SET => GND,
      RST => GND,
      SSET => GND,
      SRST => reg4_Q_7_SRINV_1520,
      O => reg4_Q(6)
    );
  mux1_X_7_1 : X_LUT4
    generic map(
      INIT => X"CACA"
    )
    port map (
      ADR0 => reg5_Q(7),
      ADR1 => reg1_Q(7),
      ADR2 => control_0_control_load_temp(3),
      ADR3 => VCC,
      O => s17(7)
    );
  reg4_Q_7 : X_SFF
    generic map(
      INIT => '0'
    )
    port map (
      I => reg4_Q_7_DXMUX_1542,
      CE => VCC,
      CLK => reg4_Q_7_CLKINV_1519,
      SET => GND,
      RST => GND,
      SSET => GND,
      SRST => reg4_Q_7_SRINV_1520,
      O => reg4_Q(7)
    );
  mux0_X_0_1 : X_LUT4
    generic map(
      INIT => X"CACA"
    )
    port map (
      ADR0 => reg6_Q(0),
      ADR1 => reg2_Q(0),
      ADR2 => control_0_control_load_temp(3),
      ADR3 => VCC,
      O => s15(0)
    );
  reg5_Q_0 : X_SFF
    generic map(
      INIT => '0'
    )
    port map (
      I => reg5_Q_1_DYMUX_1567,
      CE => VCC,
      CLK => reg5_Q_1_CLKINV_1557,
      SET => GND,
      RST => GND,
      SSET => GND,
      SRST => reg5_Q_1_SRINV_1558,
      O => reg5_Q(0)
    );
  mux0_X_1_1 : X_LUT4
    generic map(
      INIT => X"CACA"
    )
    port map (
      ADR0 => reg6_Q(1),
      ADR1 => reg2_Q(1),
      ADR2 => control_0_control_load_temp(3),
      ADR3 => VCC,
      O => s15(1)
    );
  reg5_Q_1 : X_SFF
    generic map(
      INIT => '0'
    )
    port map (
      I => reg5_Q_1_DXMUX_1580,
      CE => VCC,
      CLK => reg5_Q_1_CLKINV_1557,
      SET => GND,
      RST => GND,
      SSET => GND,
      SRST => reg5_Q_1_SRINV_1558,
      O => reg5_Q(1)
    );
  mux0_X_2_1 : X_LUT4
    generic map(
      INIT => X"CACA"
    )
    port map (
      ADR0 => reg6_Q(2),
      ADR1 => reg2_Q(2),
      ADR2 => control_0_control_load_temp(3),
      ADR3 => VCC,
      O => s15(2)
    );
  reg5_Q_2 : X_SFF
    generic map(
      INIT => '0'
    )
    port map (
      I => reg5_Q_3_DYMUX_1605,
      CE => VCC,
      CLK => reg5_Q_3_CLKINV_1595,
      SET => GND,
      RST => GND,
      SSET => GND,
      SRST => reg5_Q_3_SRINV_1596,
      O => reg5_Q(2)
    );
  mux0_X_3_1 : X_LUT4
    generic map(
      INIT => X"CACA"
    )
    port map (
      ADR0 => reg6_Q(3),
      ADR1 => reg2_Q(3),
      ADR2 => control_0_control_load_temp(3),
      ADR3 => VCC,
      O => s15(3)
    );
  reg5_Q_3 : X_SFF
    generic map(
      INIT => '0'
    )
    port map (
      I => reg5_Q_3_DXMUX_1618,
      CE => VCC,
      CLK => reg5_Q_3_CLKINV_1595,
      SET => GND,
      RST => GND,
      SSET => GND,
      SRST => reg5_Q_3_SRINV_1596,
      O => reg5_Q(3)
    );
  mux0_X_4_1 : X_LUT4
    generic map(
      INIT => X"CACA"
    )
    port map (
      ADR0 => reg6_Q(4),
      ADR1 => reg2_Q(4),
      ADR2 => control_0_control_load_temp(3),
      ADR3 => VCC,
      O => s15(4)
    );
  mux3_X_1_1 : X_LUT4
    generic map(
      INIT => X"CACA"
    )
    port map (
      ADR0 => byte_in_1_IBUF_501,
      ADR1 => reg3_Q(1),
      ADR2 => control_0_control_load_temp(3),
      ADR3 => VCC,
      O => s19(1)
    );
  reg6_Q_1 : X_SFF
    generic map(
      INIT => '0'
    )
    port map (
      I => reg6_Q_1_DXMUX_1732,
      CE => VCC,
      CLK => reg6_Q_1_CLKINV_1709,
      SET => GND,
      RST => GND,
      SSET => GND,
      SRST => reg6_Q_1_SRINV_1710,
      O => reg6_Q(1)
    );
  mux3_X_2_1 : X_LUT4
    generic map(
      INIT => X"CACA"
    )
    port map (
      ADR0 => byte_in_2_IBUF_502,
      ADR1 => reg3_Q(2),
      ADR2 => control_0_control_load_temp(3),
      ADR3 => VCC,
      O => s19(2)
    );
  reg6_Q_2 : X_SFF
    generic map(
      INIT => '0'
    )
    port map (
      I => reg6_Q_3_DYMUX_1757,
      CE => VCC,
      CLK => reg6_Q_3_CLKINV_1747,
      SET => GND,
      RST => GND,
      SSET => GND,
      SRST => reg6_Q_3_SRINV_1748,
      O => reg6_Q(2)
    );
  mux3_X_3_1 : X_LUT4
    generic map(
      INIT => X"CACA"
    )
    port map (
      ADR0 => byte_in_3_IBUF_504,
      ADR1 => reg3_Q(3),
      ADR2 => control_0_control_load_temp(3),
      ADR3 => VCC,
      O => s19(3)
    );
  reg6_Q_3 : X_SFF
    generic map(
      INIT => '0'
    )
    port map (
      I => reg6_Q_3_DXMUX_1770,
      CE => VCC,
      CLK => reg6_Q_3_CLKINV_1747,
      SET => GND,
      RST => GND,
      SSET => GND,
      SRST => reg6_Q_3_SRINV_1748,
      O => reg6_Q(3)
    );
  mux3_X_4_1 : X_LUT4
    generic map(
      INIT => X"CACA"
    )
    port map (
      ADR0 => byte_in_4_IBUF_505,
      ADR1 => reg3_Q(4),
      ADR2 => control_0_control_load_temp(3),
      ADR3 => VCC,
      O => s19(4)
    );
  reg6_Q_4 : X_SFF
    generic map(
      INIT => '0'
    )
    port map (
      I => reg6_Q_5_DYMUX_1795,
      CE => VCC,
      CLK => reg6_Q_5_CLKINV_1785,
      SET => GND,
      RST => GND,
      SSET => GND,
      SRST => reg6_Q_5_SRINV_1786,
      O => reg6_Q(4)
    );
  mux3_X_5_1 : X_LUT4
    generic map(
      INIT => X"CACA"
    )
    port map (
      ADR0 => byte_in_5_IBUF_506,
      ADR1 => reg3_Q(5),
      ADR2 => control_0_control_load_temp(3),
      ADR3 => VCC,
      O => s19(5)
    );
  reg6_Q_5 : X_SFF
    generic map(
      INIT => '0'
    )
    port map (
      I => reg6_Q_5_DXMUX_1808,
      CE => VCC,
      CLK => reg6_Q_5_CLKINV_1785,
      SET => GND,
      RST => GND,
      SSET => GND,
      SRST => reg6_Q_5_SRINV_1786,
      O => reg6_Q(5)
    );
  control_0_control_EN_temp_0 : X_SFF
    generic map(
      INIT => '1'
    )
    port map (
      I => control_0_control_EN_temp_0_DYMUX_1820,
      CE => VCC,
      CLK => control_0_control_EN_temp_0_CLKINV_1817,
      SET => GND,
      RST => GND,
      SSET => control_0_control_EN_temp_0_SRINV_1818,
      SRST => GND,
      O => control_0_control_EN_temp(0)
    );
  control_0_control_EN_temp_1 : X_SFF
    generic map(
      INIT => '1'
    )
    port map (
      I => control_0_control_EN_temp_1_DYMUX_1832,
      CE => VCC,
      CLK => control_0_control_EN_temp_1_CLKINV_1829,
      SET => GND,
      RST => GND,
      SSET => control_0_control_EN_temp_1_SRINV_1830,
      SRST => GND,
      O => control_0_control_EN_temp(1)
    );
  control_0_control_EN_temp_2 : X_SFF
    generic map(
      INIT => '0'
    )
    port map (
      I => control_0_control_EN_temp_2_DYMUX_1844,
      CE => VCC,
      CLK => control_0_control_EN_temp_2_CLKINV_1841,
      SET => GND,
      RST => GND,
      SSET => GND,
      SRST => control_0_control_EN_temp_2_SRINV_1842,
      O => control_0_control_EN_temp(2)
    );
  control_0_control_EN_temp_3 : X_SFF
    generic map(
      INIT => '1'
    )
    port map (
      I => control_0_control_EN_temp_3_DYMUX_1856,
      CE => VCC,
      CLK => control_0_control_EN_temp_3_CLKINV_1853,
      SET => GND,
      RST => GND,
      SSET => control_0_control_EN_temp_3_SRINV_1854,
      SRST => GND,
      O => control_0_control_EN_temp(3)
    );
  mux2_X_0_1 : X_LUT4
    generic map(
      INIT => X"E4E4"
    )
    port map (
      ADR0 => control_0_control_load_temp(3),
      ADR1 => reg4_Q(0),
      ADR2 => reg0_Q(0),
      ADR3 => VCC,
      O => byte_out_0_OBUF_1874
    );
  mux2_X_1_1 : X_LUT4
    generic map(
      INIT => X"E4E4"
    )
    port map (
      ADR0 => control_0_control_load_temp(3),
      ADR1 => reg4_Q(1),
      ADR2 => reg0_Q(1),
      ADR3 => VCC,
      O => byte_out_1_OBUF_1882
    );
  mux2_X_2_1 : X_LUT4
    generic map(
      INIT => X"E4E4"
    )
    port map (
      ADR0 => control_0_control_load_temp(3),
      ADR1 => reg4_Q(2),
      ADR2 => reg0_Q(2),
      ADR3 => VCC,
      O => byte_out_2_OBUF_1898
    );
  mux2_X_3_1 : X_LUT4
    generic map(
      INIT => X"E4E4"
    )
    port map (
      ADR0 => control_0_control_load_temp(3),
      ADR1 => reg4_Q(3),
      ADR2 => reg0_Q(3),
      ADR3 => VCC,
      O => byte_out_3_OBUF_1906
    );
  mux2_X_4_1 : X_LUT4
    generic map(
      INIT => X"E4E4"
    )
    port map (
      ADR0 => control_0_control_load_temp(3),
      ADR1 => reg4_Q(4),
      ADR2 => reg0_Q(4),
      ADR3 => VCC,
      O => byte_out_4_OBUF_1922
    );
  mux2_X_5_1 : X_LUT4
    generic map(
      INIT => X"E4E4"
    )
    port map (
      ADR0 => control_0_control_load_temp(3),
      ADR1 => reg4_Q(5),
      ADR2 => reg0_Q(5),
      ADR3 => VCC,
      O => byte_out_5_OBUF_1930
    );
  control_0_control_load_temp_2 : X_SFF
    generic map(
      INIT => '1'
    )
    port map (
      I => control_0_control_load_temp_2_DYMUX_1984,
      CE => VCC,
      CLK => control_0_control_load_temp_2_CLKINV_1981,
      SET => GND,
      RST => GND,
      SSET => control_0_control_load_temp_2_SRINV_1982,
      SRST => GND,
      O => control_0_control_load_temp(2)
    );
  control_0_control_load_temp_3 : X_SFF
    generic map(
      INIT => '0'
    )
    port map (
      I => control_0_control_load_temp_3_DYMUX_1996,
      CE => VCC,
      CLK => control_0_control_load_temp_3_CLKINV_1993,
      SET => GND,
      RST => GND,
      SSET => GND,
      SRST => control_0_control_load_temp_3_SRINV_1994,
      O => control_0_control_load_temp(3)
    );
  byte_out_0_OUTPUT_OFF_OMUX : X_BUF
    generic map(
      PATHPULSE => 605 ps
    )
    port map (
      I => byte_out_0_OBUF_1874,
      O => byte_out_0_O
    );
  byte_out_1_OUTPUT_OFF_OMUX : X_BUF
    generic map(
      PATHPULSE => 605 ps
    )
    port map (
      I => byte_out_1_OBUF_1882,
      O => byte_out_1_O
    );
  byte_out_2_OUTPUT_OFF_OMUX : X_BUF
    generic map(
      PATHPULSE => 605 ps
    )
    port map (
      I => byte_out_2_OBUF_1898,
      O => byte_out_2_O
    );
  byte_out_3_OUTPUT_OFF_OMUX : X_BUF
    generic map(
      PATHPULSE => 605 ps
    )
    port map (
      I => byte_out_3_OBUF_1906,
      O => byte_out_3_O
    );
  byte_out_4_OUTPUT_OFF_OMUX : X_BUF
    generic map(
      PATHPULSE => 605 ps
    )
    port map (
      I => byte_out_4_OBUF_1922,
      O => byte_out_4_O
    );
  byte_out_5_OUTPUT_OFF_OMUX : X_BUF
    generic map(
      PATHPULSE => 605 ps
    )
    port map (
      I => byte_out_5_OBUF_1930,
      O => byte_out_5_O
    );
  byte_out_6_OUTPUT_OFF_OMUX : X_BUF
    generic map(
      PATHPULSE => 605 ps
    )
    port map (
      I => byte_out_6_OBUF_1946,
      O => byte_out_6_O
    );
  byte_out_7_OUTPUT_OFF_OMUX : X_BUF
    generic map(
      PATHPULSE => 605 ps
    )
    port map (
      I => byte_out_7_OBUF_1954,
      O => byte_out_7_O
    );
  NlwBlock_MixColumns_GND : X_ZERO
    port map (
      O => GND
    );
  NlwBlock_MixColumns_VCC : X_ONE
    port map (
      O => VCC
    );
  NlwBlockROC : X_ROC
    generic map (ROC_WIDTH => 100 ns)
    port map (O => GSR);
  NlwBlockTOC : X_TOC
    port map (O => GTS);

end Structure;

