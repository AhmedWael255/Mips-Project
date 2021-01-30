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
static const char *ng0 = "E:/KHALED/Communication - Second Year/Second Term/Measurements/Project/VHDL Code/MIPs/Stack.vhd";
extern char *IEEE_P_2592010699;

unsigned char ieee_p_2592010699_sub_1744673427_503743352(char *, char *, unsigned int , unsigned int );


static void work_a_3772128646_3212880686_p_0(char *t0)
{
    char *t1;
    unsigned char t2;
    char *t3;
    char *t4;
    unsigned char t5;
    unsigned char t6;
    char *t7;
    int t8;
    unsigned char t9;
    char *t10;
    char *t11;
    char *t12;
    char *t13;
    int t14;
    unsigned int t15;
    unsigned int t16;
    unsigned int t17;
    unsigned char t18;
    int t19;
    char *t20;
    char *t21;
    char *t22;

LAB0:    xsi_set_current_line(28, ng0);
    t1 = (t0 + 992U);
    t2 = ieee_p_2592010699_sub_1744673427_503743352(IEEE_P_2592010699, t1, 0U, 0U);
    if (t2 != 0)
        goto LAB2;

LAB4:
LAB3:    xsi_set_current_line(51, ng0);
    t1 = (t0 + 992U);
    t5 = xsi_signal_has_event(t1);
    if (t5 == 1)
        goto LAB26;

LAB27:    t2 = (unsigned char)0;

LAB28:    if (t2 != 0)
        goto LAB23;

LAB25:
LAB24:    t1 = (t0 + 3592);
    *((int *)t1) = 1;

LAB1:    return;
LAB2:    xsi_set_current_line(29, ng0);
    t3 = (t0 + 1352U);
    t4 = *((char **)t3);
    t5 = *((unsigned char *)t4);
    t6 = (t5 == (unsigned char)3);
    if (t6 != 0)
        goto LAB5;

LAB7:
LAB6:    xsi_set_current_line(40, ng0);
    t1 = (t0 + 1512U);
    t3 = *((char **)t1);
    t2 = *((unsigned char *)t3);
    t5 = (t2 == (unsigned char)3);
    if (t5 != 0)
        goto LAB14;

LAB16:
LAB15:    goto LAB3;

LAB5:    xsi_set_current_line(30, ng0);
    t3 = (t0 + 2288U);
    t7 = *((char **)t3);
    t8 = *((int *)t7);
    t9 = (t8 == 31);
    if (t9 != 0)
        goto LAB8;

LAB10:    xsi_set_current_line(33, ng0);
    t1 = (t0 + 3672);
    t3 = (t1 + 56U);
    t4 = *((char **)t3);
    t7 = (t4 + 56U);
    t10 = *((char **)t7);
    *((unsigned char *)t10) = (unsigned char)2;
    xsi_driver_first_trans_fast(t1);

LAB9:    xsi_set_current_line(35, ng0);
    t1 = (t0 + 1992U);
    t3 = *((char **)t1);
    t2 = *((unsigned char *)t3);
    t5 = (t2 == (unsigned char)2);
    if (t5 != 0)
        goto LAB11;

LAB13:
LAB12:    goto LAB6;

LAB8:    xsi_set_current_line(31, ng0);
    t3 = (t0 + 3672);
    t10 = (t3 + 56U);
    t11 = *((char **)t10);
    t12 = (t11 + 56U);
    t13 = *((char **)t12);
    *((unsigned char *)t13) = (unsigned char)3;
    xsi_driver_first_trans_fast(t3);
    goto LAB9;

LAB11:    xsi_set_current_line(36, ng0);
    t1 = (t0 + 1192U);
    t4 = *((char **)t1);
    t1 = (t0 + 2288U);
    t7 = *((char **)t1);
    t8 = *((int *)t7);
    t14 = (t8 - 0);
    t15 = (t14 * 1);
    t16 = (32U * t15);
    t17 = (0U + t16);
    t1 = (t0 + 3736);
    t10 = (t1 + 56U);
    t11 = *((char **)t10);
    t12 = (t11 + 56U);
    t13 = *((char **)t12);
    memcpy(t13, t4, 32U);
    xsi_driver_first_trans_delta(t1, t17, 32U, 0LL);
    xsi_set_current_line(37, ng0);
    t1 = (t0 + 2288U);
    t3 = *((char **)t1);
    t8 = *((int *)t3);
    t14 = (t8 + 1);
    t1 = (t0 + 2288U);
    t4 = *((char **)t1);
    t1 = (t4 + 0);
    *((int *)t1) = t14;
    goto LAB12;

LAB14:    xsi_set_current_line(41, ng0);
    t1 = (t0 + 2288U);
    t4 = *((char **)t1);
    t8 = *((int *)t4);
    t6 = (t8 == 0);
    if (t6 != 0)
        goto LAB17;

LAB19:    xsi_set_current_line(44, ng0);
    t1 = (t0 + 3672);
    t3 = (t1 + 56U);
    t4 = *((char **)t3);
    t7 = (t4 + 56U);
    t10 = *((char **)t7);
    *((unsigned char *)t10) = (unsigned char)2;
    xsi_driver_first_trans_fast(t1);

LAB18:    xsi_set_current_line(46, ng0);
    t1 = (t0 + 1992U);
    t3 = *((char **)t1);
    t2 = *((unsigned char *)t3);
    t5 = (t2 == (unsigned char)2);
    if (t5 != 0)
        goto LAB20;

LAB22:
LAB21:    goto LAB15;

LAB17:    xsi_set_current_line(42, ng0);
    t1 = (t0 + 3672);
    t7 = (t1 + 56U);
    t10 = *((char **)t7);
    t11 = (t10 + 56U);
    t12 = *((char **)t11);
    *((unsigned char *)t12) = (unsigned char)3;
    xsi_driver_first_trans_fast(t1);
    goto LAB18;

LAB20:    xsi_set_current_line(47, ng0);
    t1 = (t0 + 2288U);
    t4 = *((char **)t1);
    t8 = *((int *)t4);
    t14 = (t8 - 1);
    t1 = (t0 + 2288U);
    t7 = *((char **)t1);
    t1 = (t7 + 0);
    *((int *)t1) = t14;
    goto LAB21;

LAB23:    xsi_set_current_line(52, ng0);
    t3 = (t0 + 2288U);
    t7 = *((char **)t3);
    t8 = *((int *)t7);
    t18 = (t8 == 0);
    if (t18 != 0)
        goto LAB29;

LAB31:    xsi_set_current_line(55, ng0);
    t1 = (t0 + 1832U);
    t3 = *((char **)t1);
    t1 = (t0 + 2288U);
    t4 = *((char **)t1);
    t8 = *((int *)t4);
    t14 = (t8 - 1);
    t19 = (t14 - 0);
    t15 = (t19 * 1);
    xsi_vhdl_check_range_of_index(0, 31, 1, t14);
    t16 = (32U * t15);
    t17 = (0 + t16);
    t1 = (t3 + t17);
    t7 = (t0 + 3800);
    t10 = (t7 + 56U);
    t11 = *((char **)t10);
    t12 = (t11 + 56U);
    t13 = *((char **)t12);
    memcpy(t13, t1, 32U);
    xsi_driver_first_trans_fast_port(t7);

LAB30:    goto LAB24;

LAB26:    t3 = (t0 + 1032U);
    t4 = *((char **)t3);
    t6 = *((unsigned char *)t4);
    t9 = (t6 == (unsigned char)2);
    t2 = t9;
    goto LAB28;

LAB29:    xsi_set_current_line(53, ng0);
    t3 = (t0 + 1832U);
    t10 = *((char **)t3);
    t3 = (t0 + 2288U);
    t11 = *((char **)t3);
    t14 = *((int *)t11);
    t19 = (t14 - 0);
    t15 = (t19 * 1);
    xsi_vhdl_check_range_of_index(0, 31, 1, t14);
    t16 = (32U * t15);
    t17 = (0 + t16);
    t3 = (t10 + t17);
    t12 = (t0 + 3800);
    t13 = (t12 + 56U);
    t20 = *((char **)t13);
    t21 = (t20 + 56U);
    t22 = *((char **)t21);
    memcpy(t22, t3, 32U);
    xsi_driver_first_trans_fast_port(t12);
    goto LAB30;

}


extern void work_a_3772128646_3212880686_init()
{
	static char *pe[] = {(void *)work_a_3772128646_3212880686_p_0};
	xsi_register_didat("work_a_3772128646_3212880686", "isim/tb_MIPS_isim_beh.exe.sim/work/a_3772128646_3212880686.didat");
	xsi_register_executes(pe);
}
