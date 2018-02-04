/**********************************************************************/
/*   ____  ____                                                       */
/*  /   /\/   /                                                       */
/* /___/  \  /                                                        */
/* \   \   \/                                                       */
/*  \   \        Copyright (c) 2003-2009 Xilinx, Inc.                */
/*  /   /          All Right Reserved.                                 */
/* /---/   /\                                                         */
/* \   \  /  \                                                      */
/*  \___\/\___\                                                    */
/***********************************************************************/

/* This file is designed for use with ISim build 0x7708f090 */

#define XSI_HIDE_SYMBOL_SPEC true
#include "xsi.h"
#include <memory.h>
#ifdef __GNUC__
#include <stdlib.h>
#else
#include <malloc.h>
#define alloca _alloca
#endif
static const char *ng0 = "E:/OneDrive/PC Documents/Important/University/Year 4/EEE6225/System-Design/VHDL/William/keyGeneration/subBytes_CHEAT.vhd";
extern char *IEEE_P_2592010699;
extern char *IEEE_P_1242562249;

int ieee_p_1242562249_sub_1657552908_1035706684(char *, char *, char *);
unsigned char ieee_p_2592010699_sub_1744673427_503743352(char *, char *, unsigned int , unsigned int );
unsigned char ieee_p_2592010699_sub_2507238156_503743352(char *, unsigned char , unsigned char );


static void work_a_3716345144_1516540902_p_0(char *t0)
{
    char *t1;
    unsigned char t2;
    char *t3;
    char *t4;
    unsigned char t5;
    unsigned char t6;
    char *t7;
    char *t8;
    char *t9;
    char *t10;
    char *t11;
    char *t12;
    int t13;
    int t14;
    unsigned int t15;
    unsigned int t16;
    unsigned int t17;

LAB0:    xsi_set_current_line(297, ng0);
    t1 = (t0 + 992U);
    t2 = ieee_p_2592010699_sub_1744673427_503743352(IEEE_P_2592010699, t1, 0U, 0U);
    if (t2 != 0)
        goto LAB2;

LAB4:
LAB3:    t1 = (t0 + 4088);
    *((int *)t1) = 1;

LAB1:    return;
LAB2:    xsi_set_current_line(298, ng0);
    t3 = (t0 + 1192U);
    t4 = *((char **)t3);
    t5 = *((unsigned char *)t4);
    t6 = (t5 == (unsigned char)3);
    if (t6 != 0)
        goto LAB5;

LAB7:    xsi_set_current_line(301, ng0);
    t1 = (t0 + 2288U);
    t3 = *((char **)t1);
    t1 = (t0 + 1352U);
    t4 = *((char **)t1);
    t1 = (t0 + 7656U);
    t13 = ieee_p_1242562249_sub_1657552908_1035706684(IEEE_P_1242562249, t4, t1);
    t14 = (t13 - 0);
    t15 = (t14 * 1);
    xsi_vhdl_check_range_of_index(0, 255, 1, t13);
    t16 = (8U * t15);
    t17 = (0 + t16);
    t7 = (t3 + t17);
    t8 = (t0 + 4200);
    t9 = (t8 + 56U);
    t10 = *((char **)t9);
    t11 = (t10 + 56U);
    t12 = *((char **)t11);
    memcpy(t12, t7, 8U);
    xsi_driver_first_trans_fast(t8);

LAB6:    goto LAB3;

LAB5:    xsi_set_current_line(299, ng0);
    t3 = (t0 + 9835);
    t8 = (t0 + 4200);
    t9 = (t8 + 56U);
    t10 = *((char **)t9);
    t11 = (t10 + 56U);
    t12 = *((char **)t11);
    memcpy(t12, t3, 8U);
    xsi_driver_first_trans_fast(t8);
    goto LAB6;

}

static void work_a_3716345144_1516540902_p_1(char *t0)
{
    char *t1;
    unsigned char t2;
    char *t3;
    char *t4;
    int t5;
    unsigned int t6;
    unsigned int t7;
    unsigned int t8;
    unsigned char t9;
    char *t10;
    char *t11;
    int t12;
    unsigned int t13;
    unsigned int t14;
    unsigned int t15;
    unsigned char t16;
    unsigned char t17;
    char *t18;
    char *t19;
    int t20;
    unsigned int t21;
    unsigned int t22;
    unsigned int t23;
    unsigned char t24;
    unsigned char t25;
    char *t26;
    char *t27;
    int t28;
    unsigned int t29;
    unsigned int t30;
    unsigned int t31;
    unsigned char t32;
    unsigned char t33;
    char *t34;
    char *t35;
    int t36;
    unsigned int t37;
    unsigned int t38;
    unsigned int t39;
    unsigned char t40;
    unsigned char t41;
    unsigned char t42;
    char *t43;
    char *t44;
    char *t45;
    char *t46;
    char *t47;

LAB0:    xsi_set_current_line(311, ng0);
    t1 = (t0 + 992U);
    t2 = ieee_p_2592010699_sub_1744673427_503743352(IEEE_P_2592010699, t1, 0U, 0U);
    if (t2 != 0)
        goto LAB2;

LAB4:
LAB3:    t1 = (t0 + 4104);
    *((int *)t1) = 1;

LAB1:    return;
LAB2:    xsi_set_current_line(312, ng0);
    t3 = (t0 + 1832U);
    t4 = *((char **)t3);
    t5 = (7 - 7);
    t6 = (t5 * -1);
    t7 = (1U * t6);
    t8 = (0 + t7);
    t3 = (t4 + t8);
    t9 = *((unsigned char *)t3);
    t10 = (t0 + 1832U);
    t11 = *((char **)t10);
    t12 = (6 - 7);
    t13 = (t12 * -1);
    t14 = (1U * t13);
    t15 = (0 + t14);
    t10 = (t11 + t15);
    t16 = *((unsigned char *)t10);
    t17 = ieee_p_2592010699_sub_2507238156_503743352(IEEE_P_2592010699, t9, t16);
    t18 = (t0 + 1832U);
    t19 = *((char **)t18);
    t20 = (5 - 7);
    t21 = (t20 * -1);
    t22 = (1U * t21);
    t23 = (0 + t22);
    t18 = (t19 + t23);
    t24 = *((unsigned char *)t18);
    t25 = ieee_p_2592010699_sub_2507238156_503743352(IEEE_P_2592010699, t17, t24);
    t26 = (t0 + 1832U);
    t27 = *((char **)t26);
    t28 = (4 - 7);
    t29 = (t28 * -1);
    t30 = (1U * t29);
    t31 = (0 + t30);
    t26 = (t27 + t31);
    t32 = *((unsigned char *)t26);
    t33 = ieee_p_2592010699_sub_2507238156_503743352(IEEE_P_2592010699, t25, t32);
    t34 = (t0 + 1832U);
    t35 = *((char **)t34);
    t36 = (3 - 7);
    t37 = (t36 * -1);
    t38 = (1U * t37);
    t39 = (0 + t38);
    t34 = (t35 + t39);
    t40 = *((unsigned char *)t34);
    t41 = ieee_p_2592010699_sub_2507238156_503743352(IEEE_P_2592010699, t33, t40);
    t42 = ieee_p_2592010699_sub_2507238156_503743352(IEEE_P_2592010699, t41, (unsigned char)2);
    t43 = (t0 + 4264);
    t44 = (t43 + 56U);
    t45 = *((char **)t44);
    t46 = (t45 + 56U);
    t47 = *((char **)t46);
    *((unsigned char *)t47) = t42;
    xsi_driver_first_trans_delta(t43, 0U, 1, 0LL);
    xsi_set_current_line(313, ng0);
    t1 = (t0 + 1832U);
    t3 = *((char **)t1);
    t5 = (6 - 7);
    t6 = (t5 * -1);
    t7 = (1U * t6);
    t8 = (0 + t7);
    t1 = (t3 + t8);
    t2 = *((unsigned char *)t1);
    t4 = (t0 + 1832U);
    t10 = *((char **)t4);
    t12 = (5 - 7);
    t13 = (t12 * -1);
    t14 = (1U * t13);
    t15 = (0 + t14);
    t4 = (t10 + t15);
    t9 = *((unsigned char *)t4);
    t16 = ieee_p_2592010699_sub_2507238156_503743352(IEEE_P_2592010699, t2, t9);
    t11 = (t0 + 1832U);
    t18 = *((char **)t11);
    t20 = (4 - 7);
    t21 = (t20 * -1);
    t22 = (1U * t21);
    t23 = (0 + t22);
    t11 = (t18 + t23);
    t17 = *((unsigned char *)t11);
    t24 = ieee_p_2592010699_sub_2507238156_503743352(IEEE_P_2592010699, t16, t17);
    t19 = (t0 + 1832U);
    t26 = *((char **)t19);
    t28 = (3 - 7);
    t29 = (t28 * -1);
    t30 = (1U * t29);
    t31 = (0 + t30);
    t19 = (t26 + t31);
    t25 = *((unsigned char *)t19);
    t32 = ieee_p_2592010699_sub_2507238156_503743352(IEEE_P_2592010699, t24, t25);
    t27 = (t0 + 1832U);
    t34 = *((char **)t27);
    t36 = (2 - 7);
    t37 = (t36 * -1);
    t38 = (1U * t37);
    t39 = (0 + t38);
    t27 = (t34 + t39);
    t33 = *((unsigned char *)t27);
    t40 = ieee_p_2592010699_sub_2507238156_503743352(IEEE_P_2592010699, t32, t33);
    t41 = ieee_p_2592010699_sub_2507238156_503743352(IEEE_P_2592010699, t40, (unsigned char)3);
    t35 = (t0 + 4264);
    t43 = (t35 + 56U);
    t44 = *((char **)t43);
    t45 = (t44 + 56U);
    t46 = *((char **)t45);
    *((unsigned char *)t46) = t41;
    xsi_driver_first_trans_delta(t35, 1U, 1, 0LL);
    xsi_set_current_line(314, ng0);
    t1 = (t0 + 1832U);
    t3 = *((char **)t1);
    t5 = (5 - 7);
    t6 = (t5 * -1);
    t7 = (1U * t6);
    t8 = (0 + t7);
    t1 = (t3 + t8);
    t2 = *((unsigned char *)t1);
    t4 = (t0 + 1832U);
    t10 = *((char **)t4);
    t12 = (4 - 7);
    t13 = (t12 * -1);
    t14 = (1U * t13);
    t15 = (0 + t14);
    t4 = (t10 + t15);
    t9 = *((unsigned char *)t4);
    t16 = ieee_p_2592010699_sub_2507238156_503743352(IEEE_P_2592010699, t2, t9);
    t11 = (t0 + 1832U);
    t18 = *((char **)t11);
    t20 = (3 - 7);
    t21 = (t20 * -1);
    t22 = (1U * t21);
    t23 = (0 + t22);
    t11 = (t18 + t23);
    t17 = *((unsigned char *)t11);
    t24 = ieee_p_2592010699_sub_2507238156_503743352(IEEE_P_2592010699, t16, t17);
    t19 = (t0 + 1832U);
    t26 = *((char **)t19);
    t28 = (2 - 7);
    t29 = (t28 * -1);
    t30 = (1U * t29);
    t31 = (0 + t30);
    t19 = (t26 + t31);
    t25 = *((unsigned char *)t19);
    t32 = ieee_p_2592010699_sub_2507238156_503743352(IEEE_P_2592010699, t24, t25);
    t27 = (t0 + 1832U);
    t34 = *((char **)t27);
    t36 = (1 - 7);
    t37 = (t36 * -1);
    t38 = (1U * t37);
    t39 = (0 + t38);
    t27 = (t34 + t39);
    t33 = *((unsigned char *)t27);
    t40 = ieee_p_2592010699_sub_2507238156_503743352(IEEE_P_2592010699, t32, t33);
    t41 = ieee_p_2592010699_sub_2507238156_503743352(IEEE_P_2592010699, t40, (unsigned char)3);
    t35 = (t0 + 4264);
    t43 = (t35 + 56U);
    t44 = *((char **)t43);
    t45 = (t44 + 56U);
    t46 = *((char **)t45);
    *((unsigned char *)t46) = t41;
    xsi_driver_first_trans_delta(t35, 2U, 1, 0LL);
    xsi_set_current_line(315, ng0);
    t1 = (t0 + 1832U);
    t3 = *((char **)t1);
    t5 = (4 - 7);
    t6 = (t5 * -1);
    t7 = (1U * t6);
    t8 = (0 + t7);
    t1 = (t3 + t8);
    t2 = *((unsigned char *)t1);
    t4 = (t0 + 1832U);
    t10 = *((char **)t4);
    t12 = (3 - 7);
    t13 = (t12 * -1);
    t14 = (1U * t13);
    t15 = (0 + t14);
    t4 = (t10 + t15);
    t9 = *((unsigned char *)t4);
    t16 = ieee_p_2592010699_sub_2507238156_503743352(IEEE_P_2592010699, t2, t9);
    t11 = (t0 + 1832U);
    t18 = *((char **)t11);
    t20 = (2 - 7);
    t21 = (t20 * -1);
    t22 = (1U * t21);
    t23 = (0 + t22);
    t11 = (t18 + t23);
    t17 = *((unsigned char *)t11);
    t24 = ieee_p_2592010699_sub_2507238156_503743352(IEEE_P_2592010699, t16, t17);
    t19 = (t0 + 1832U);
    t26 = *((char **)t19);
    t28 = (1 - 7);
    t29 = (t28 * -1);
    t30 = (1U * t29);
    t31 = (0 + t30);
    t19 = (t26 + t31);
    t25 = *((unsigned char *)t19);
    t32 = ieee_p_2592010699_sub_2507238156_503743352(IEEE_P_2592010699, t24, t25);
    t27 = (t0 + 1832U);
    t34 = *((char **)t27);
    t36 = (0 - 7);
    t37 = (t36 * -1);
    t38 = (1U * t37);
    t39 = (0 + t38);
    t27 = (t34 + t39);
    t33 = *((unsigned char *)t27);
    t40 = ieee_p_2592010699_sub_2507238156_503743352(IEEE_P_2592010699, t32, t33);
    t41 = ieee_p_2592010699_sub_2507238156_503743352(IEEE_P_2592010699, t40, (unsigned char)2);
    t35 = (t0 + 4264);
    t43 = (t35 + 56U);
    t44 = *((char **)t43);
    t45 = (t44 + 56U);
    t46 = *((char **)t45);
    *((unsigned char *)t46) = t41;
    xsi_driver_first_trans_delta(t35, 3U, 1, 0LL);
    xsi_set_current_line(316, ng0);
    t1 = (t0 + 1832U);
    t3 = *((char **)t1);
    t5 = (7 - 7);
    t6 = (t5 * -1);
    t7 = (1U * t6);
    t8 = (0 + t7);
    t1 = (t3 + t8);
    t2 = *((unsigned char *)t1);
    t4 = (t0 + 1832U);
    t10 = *((char **)t4);
    t12 = (3 - 7);
    t13 = (t12 * -1);
    t14 = (1U * t13);
    t15 = (0 + t14);
    t4 = (t10 + t15);
    t9 = *((unsigned char *)t4);
    t16 = ieee_p_2592010699_sub_2507238156_503743352(IEEE_P_2592010699, t2, t9);
    t11 = (t0 + 1832U);
    t18 = *((char **)t11);
    t20 = (2 - 7);
    t21 = (t20 * -1);
    t22 = (1U * t21);
    t23 = (0 + t22);
    t11 = (t18 + t23);
    t17 = *((unsigned char *)t11);
    t24 = ieee_p_2592010699_sub_2507238156_503743352(IEEE_P_2592010699, t16, t17);
    t19 = (t0 + 1832U);
    t26 = *((char **)t19);
    t28 = (1 - 7);
    t29 = (t28 * -1);
    t30 = (1U * t29);
    t31 = (0 + t30);
    t19 = (t26 + t31);
    t25 = *((unsigned char *)t19);
    t32 = ieee_p_2592010699_sub_2507238156_503743352(IEEE_P_2592010699, t24, t25);
    t27 = (t0 + 1832U);
    t34 = *((char **)t27);
    t36 = (0 - 7);
    t37 = (t36 * -1);
    t38 = (1U * t37);
    t39 = (0 + t38);
    t27 = (t34 + t39);
    t33 = *((unsigned char *)t27);
    t40 = ieee_p_2592010699_sub_2507238156_503743352(IEEE_P_2592010699, t32, t33);
    t41 = ieee_p_2592010699_sub_2507238156_503743352(IEEE_P_2592010699, t40, (unsigned char)2);
    t35 = (t0 + 4264);
    t43 = (t35 + 56U);
    t44 = *((char **)t43);
    t45 = (t44 + 56U);
    t46 = *((char **)t45);
    *((unsigned char *)t46) = t41;
    xsi_driver_first_trans_delta(t35, 4U, 1, 0LL);
    xsi_set_current_line(317, ng0);
    t1 = (t0 + 1832U);
    t3 = *((char **)t1);
    t5 = (7 - 7);
    t6 = (t5 * -1);
    t7 = (1U * t6);
    t8 = (0 + t7);
    t1 = (t3 + t8);
    t2 = *((unsigned char *)t1);
    t4 = (t0 + 1832U);
    t10 = *((char **)t4);
    t12 = (6 - 7);
    t13 = (t12 * -1);
    t14 = (1U * t13);
    t15 = (0 + t14);
    t4 = (t10 + t15);
    t9 = *((unsigned char *)t4);
    t16 = ieee_p_2592010699_sub_2507238156_503743352(IEEE_P_2592010699, t2, t9);
    t11 = (t0 + 1832U);
    t18 = *((char **)t11);
    t20 = (2 - 7);
    t21 = (t20 * -1);
    t22 = (1U * t21);
    t23 = (0 + t22);
    t11 = (t18 + t23);
    t17 = *((unsigned char *)t11);
    t24 = ieee_p_2592010699_sub_2507238156_503743352(IEEE_P_2592010699, t16, t17);
    t19 = (t0 + 1832U);
    t26 = *((char **)t19);
    t28 = (1 - 7);
    t29 = (t28 * -1);
    t30 = (1U * t29);
    t31 = (0 + t30);
    t19 = (t26 + t31);
    t25 = *((unsigned char *)t19);
    t32 = ieee_p_2592010699_sub_2507238156_503743352(IEEE_P_2592010699, t24, t25);
    t27 = (t0 + 1832U);
    t34 = *((char **)t27);
    t36 = (0 - 7);
    t37 = (t36 * -1);
    t38 = (1U * t37);
    t39 = (0 + t38);
    t27 = (t34 + t39);
    t33 = *((unsigned char *)t27);
    t40 = ieee_p_2592010699_sub_2507238156_503743352(IEEE_P_2592010699, t32, t33);
    t41 = ieee_p_2592010699_sub_2507238156_503743352(IEEE_P_2592010699, t40, (unsigned char)2);
    t35 = (t0 + 4264);
    t43 = (t35 + 56U);
    t44 = *((char **)t43);
    t45 = (t44 + 56U);
    t46 = *((char **)t45);
    *((unsigned char *)t46) = t41;
    xsi_driver_first_trans_delta(t35, 5U, 1, 0LL);
    xsi_set_current_line(318, ng0);
    t1 = (t0 + 1832U);
    t3 = *((char **)t1);
    t5 = (7 - 7);
    t6 = (t5 * -1);
    t7 = (1U * t6);
    t8 = (0 + t7);
    t1 = (t3 + t8);
    t2 = *((unsigned char *)t1);
    t4 = (t0 + 1832U);
    t10 = *((char **)t4);
    t12 = (6 - 7);
    t13 = (t12 * -1);
    t14 = (1U * t13);
    t15 = (0 + t14);
    t4 = (t10 + t15);
    t9 = *((unsigned char *)t4);
    t16 = ieee_p_2592010699_sub_2507238156_503743352(IEEE_P_2592010699, t2, t9);
    t11 = (t0 + 1832U);
    t18 = *((char **)t11);
    t20 = (5 - 7);
    t21 = (t20 * -1);
    t22 = (1U * t21);
    t23 = (0 + t22);
    t11 = (t18 + t23);
    t17 = *((unsigned char *)t11);
    t24 = ieee_p_2592010699_sub_2507238156_503743352(IEEE_P_2592010699, t16, t17);
    t19 = (t0 + 1832U);
    t26 = *((char **)t19);
    t28 = (1 - 7);
    t29 = (t28 * -1);
    t30 = (1U * t29);
    t31 = (0 + t30);
    t19 = (t26 + t31);
    t25 = *((unsigned char *)t19);
    t32 = ieee_p_2592010699_sub_2507238156_503743352(IEEE_P_2592010699, t24, t25);
    t27 = (t0 + 1832U);
    t34 = *((char **)t27);
    t36 = (0 - 7);
    t37 = (t36 * -1);
    t38 = (1U * t37);
    t39 = (0 + t38);
    t27 = (t34 + t39);
    t33 = *((unsigned char *)t27);
    t40 = ieee_p_2592010699_sub_2507238156_503743352(IEEE_P_2592010699, t32, t33);
    t41 = ieee_p_2592010699_sub_2507238156_503743352(IEEE_P_2592010699, t40, (unsigned char)3);
    t35 = (t0 + 4264);
    t43 = (t35 + 56U);
    t44 = *((char **)t43);
    t45 = (t44 + 56U);
    t46 = *((char **)t45);
    *((unsigned char *)t46) = t41;
    xsi_driver_first_trans_delta(t35, 6U, 1, 0LL);
    xsi_set_current_line(319, ng0);
    t1 = (t0 + 1832U);
    t3 = *((char **)t1);
    t5 = (7 - 7);
    t6 = (t5 * -1);
    t7 = (1U * t6);
    t8 = (0 + t7);
    t1 = (t3 + t8);
    t2 = *((unsigned char *)t1);
    t4 = (t0 + 1832U);
    t10 = *((char **)t4);
    t12 = (6 - 7);
    t13 = (t12 * -1);
    t14 = (1U * t13);
    t15 = (0 + t14);
    t4 = (t10 + t15);
    t9 = *((unsigned char *)t4);
    t16 = ieee_p_2592010699_sub_2507238156_503743352(IEEE_P_2592010699, t2, t9);
    t11 = (t0 + 1832U);
    t18 = *((char **)t11);
    t20 = (5 - 7);
    t21 = (t20 * -1);
    t22 = (1U * t21);
    t23 = (0 + t22);
    t11 = (t18 + t23);
    t17 = *((unsigned char *)t11);
    t24 = ieee_p_2592010699_sub_2507238156_503743352(IEEE_P_2592010699, t16, t17);
    t19 = (t0 + 1832U);
    t26 = *((char **)t19);
    t28 = (4 - 7);
    t29 = (t28 * -1);
    t30 = (1U * t29);
    t31 = (0 + t30);
    t19 = (t26 + t31);
    t25 = *((unsigned char *)t19);
    t32 = ieee_p_2592010699_sub_2507238156_503743352(IEEE_P_2592010699, t24, t25);
    t27 = (t0 + 1832U);
    t34 = *((char **)t27);
    t36 = (0 - 7);
    t37 = (t36 * -1);
    t38 = (1U * t37);
    t39 = (0 + t38);
    t27 = (t34 + t39);
    t33 = *((unsigned char *)t27);
    t40 = ieee_p_2592010699_sub_2507238156_503743352(IEEE_P_2592010699, t32, t33);
    t41 = ieee_p_2592010699_sub_2507238156_503743352(IEEE_P_2592010699, t40, (unsigned char)3);
    t35 = (t0 + 4264);
    t43 = (t35 + 56U);
    t44 = *((char **)t43);
    t45 = (t44 + 56U);
    t46 = *((char **)t45);
    *((unsigned char *)t46) = t41;
    xsi_driver_first_trans_delta(t35, 7U, 1, 0LL);
    goto LAB3;

}

static void work_a_3716345144_1516540902_p_2(char *t0)
{
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    char *t6;
    char *t7;

LAB0:    xsi_set_current_line(347, ng0);

LAB3:    t1 = (t0 + 1992U);
    t2 = *((char **)t1);
    t1 = (t0 + 4328);
    t3 = (t1 + 56U);
    t4 = *((char **)t3);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    memcpy(t6, t2, 8U);
    xsi_driver_first_trans_fast_port(t1);

LAB2:    t7 = (t0 + 4120);
    *((int *)t7) = 1;

LAB1:    return;
LAB4:    goto LAB2;

}


extern void work_a_3716345144_1516540902_init()
{
	static char *pe[] = {(void *)work_a_3716345144_1516540902_p_0,(void *)work_a_3716345144_1516540902_p_1,(void *)work_a_3716345144_1516540902_p_2};
	xsi_register_didat("work_a_3716345144_1516540902", "isim/tb_keyGen_isim_beh.exe.sim/work/a_3716345144_1516540902.didat");
	xsi_register_executes(pe);
}
