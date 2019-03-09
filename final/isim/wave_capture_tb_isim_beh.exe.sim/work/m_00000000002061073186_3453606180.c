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

/* This file is designed for use with ISim build 0x8ef4fb42 */

#define XSI_HIDE_SYMBOL_SPEC true
#include "xsi.h"
#include <memory.h>
#ifdef __GNUC__
#include <stdlib.h>
#else
#include <malloc.h>
#define alloca _alloca
#endif
static const char *ng0 = "//afs/ir/class/ee108/groups/12/lab5/sine_reader.v";
static unsigned int ng1[] = {2U, 0U};
static unsigned int ng2[] = {0U, 0U};
static unsigned int ng3[] = {1023U, 0U};
static unsigned int ng4[] = {1U, 0U};
static unsigned int ng5[] = {3U, 0U};



static void NetDecl_21_0(char *t0)
{
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    char *t6;
    char *t7;
    unsigned int t8;
    unsigned int t9;
    char *t10;
    unsigned int t11;
    unsigned int t12;
    char *t13;
    unsigned int t14;
    unsigned int t15;

LAB0:    t1 = (t0 + 2732U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(21, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 4028);
    t4 = (t3 + 32U);
    t5 = *((char **)t4);
    t6 = (t5 + 40U);
    t7 = *((char **)t6);
    memset(t7, 0, 8);
    t8 = 63U;
    t9 = t8;
    t10 = (t2 + 4);
    t11 = *((unsigned int *)t2);
    t8 = (t8 & t11);
    t12 = *((unsigned int *)t10);
    t9 = (t9 & t12);
    t13 = (t7 + 4);
    t14 = *((unsigned int *)t7);
    *((unsigned int *)t7) = (t14 | t8);
    t15 = *((unsigned int *)t13);
    *((unsigned int *)t13) = (t15 | t9);
    xsi_driver_vfirst_trans(t3, 0, 5U);

LAB1:    return;
}

static void NetDecl_24_1(char *t0)
{
    char t3[8];
    char *t1;
    char *t2;
    char *t4;
    char *t5;
    unsigned int t6;
    unsigned int t7;
    unsigned int t8;
    unsigned int t9;
    unsigned int t10;
    unsigned int t11;
    char *t12;
    char *t13;
    char *t14;
    char *t15;
    char *t16;
    unsigned int t17;
    unsigned int t18;
    char *t19;
    unsigned int t20;
    unsigned int t21;
    char *t22;
    unsigned int t23;
    unsigned int t24;
    char *t25;

LAB0:    t1 = (t0 + 2876U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(24, ng0);
    t2 = (t0 + 784U);
    t4 = *((char **)t2);
    memset(t3, 0, 8);
    t2 = (t3 + 4);
    t5 = (t4 + 4);
    t6 = *((unsigned int *)t4);
    t7 = (t6 >> 10);
    *((unsigned int *)t3) = t7;
    t8 = *((unsigned int *)t5);
    t9 = (t8 >> 10);
    *((unsigned int *)t2) = t9;
    t10 = *((unsigned int *)t3);
    *((unsigned int *)t3) = (t10 & 1023U);
    t11 = *((unsigned int *)t2);
    *((unsigned int *)t2) = (t11 & 1023U);
    t12 = (t0 + 4064);
    t13 = (t12 + 32U);
    t14 = *((char **)t13);
    t15 = (t14 + 40U);
    t16 = *((char **)t15);
    memset(t16, 0, 8);
    t17 = 1023U;
    t18 = t17;
    t19 = (t3 + 4);
    t20 = *((unsigned int *)t3);
    t17 = (t17 & t20);
    t21 = *((unsigned int *)t19);
    t18 = (t18 & t21);
    t22 = (t16 + 4);
    t23 = *((unsigned int *)t16);
    *((unsigned int *)t16) = (t23 | t17);
    t24 = *((unsigned int *)t22);
    *((unsigned int *)t22) = (t24 | t18);
    xsi_driver_vfirst_trans(t12, 0, 9U);
    t25 = (t0 + 3936);
    *((int *)t25) = 1;

LAB1:    return;
}

static void NetDecl_25_2(char *t0)
{
    char t3[8];
    char *t1;
    char *t2;
    char *t4;
    char *t5;
    unsigned int t6;
    unsigned int t7;
    unsigned int t8;
    unsigned int t9;
    unsigned int t10;
    unsigned int t11;
    char *t12;
    char *t13;
    char *t14;
    char *t15;
    char *t16;
    unsigned int t17;
    unsigned int t18;
    char *t19;
    unsigned int t20;
    unsigned int t21;
    char *t22;
    unsigned int t23;
    unsigned int t24;
    char *t25;

LAB0:    t1 = (t0 + 3020U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(25, ng0);
    t2 = (t0 + 1152U);
    t4 = *((char **)t2);
    memset(t3, 0, 8);
    t2 = (t3 + 4);
    t5 = (t4 + 4);
    t6 = *((unsigned int *)t4);
    t7 = (t6 >> 10);
    *((unsigned int *)t3) = t7;
    t8 = *((unsigned int *)t5);
    t9 = (t8 >> 10);
    *((unsigned int *)t2) = t9;
    t10 = *((unsigned int *)t3);
    *((unsigned int *)t3) = (t10 & 1023U);
    t11 = *((unsigned int *)t2);
    *((unsigned int *)t2) = (t11 & 1023U);
    t12 = (t0 + 4100);
    t13 = (t12 + 32U);
    t14 = *((char **)t13);
    t15 = (t14 + 40U);
    t16 = *((char **)t15);
    memset(t16, 0, 8);
    t17 = 1023U;
    t18 = t17;
    t19 = (t3 + 4);
    t20 = *((unsigned int *)t3);
    t17 = (t17 & t20);
    t21 = *((unsigned int *)t19);
    t18 = (t18 & t21);
    t22 = (t16 + 4);
    t23 = *((unsigned int *)t16);
    *((unsigned int *)t16) = (t23 | t17);
    t24 = *((unsigned int *)t22);
    *((unsigned int *)t22) = (t24 | t18);
    xsi_driver_vfirst_trans(t12, 0, 9U);
    t25 = (t0 + 3944);
    *((int *)t25) = 1;

LAB1:    return;
}

static void NetDecl_26_3(char *t0)
{
    char t3[8];
    char *t1;
    char *t2;
    char *t4;
    char *t5;
    unsigned int t6;
    unsigned int t7;
    unsigned int t8;
    unsigned int t9;
    unsigned int t10;
    unsigned int t11;
    char *t12;
    char *t13;
    char *t14;
    char *t15;
    char *t16;
    unsigned int t17;
    unsigned int t18;
    char *t19;
    unsigned int t20;
    unsigned int t21;
    char *t22;
    unsigned int t23;
    unsigned int t24;
    char *t25;

LAB0:    t1 = (t0 + 3164U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(26, ng0);
    t2 = (t0 + 1244U);
    t4 = *((char **)t2);
    memset(t3, 0, 8);
    t2 = (t3 + 4);
    t5 = (t4 + 4);
    t6 = *((unsigned int *)t4);
    t7 = (t6 >> 10);
    *((unsigned int *)t3) = t7;
    t8 = *((unsigned int *)t5);
    t9 = (t8 >> 10);
    *((unsigned int *)t2) = t9;
    t10 = *((unsigned int *)t3);
    *((unsigned int *)t3) = (t10 & 1023U);
    t11 = *((unsigned int *)t2);
    *((unsigned int *)t2) = (t11 & 1023U);
    t12 = (t0 + 4136);
    t13 = (t12 + 32U);
    t14 = *((char **)t13);
    t15 = (t14 + 40U);
    t16 = *((char **)t15);
    memset(t16, 0, 8);
    t17 = 1023U;
    t18 = t17;
    t19 = (t3 + 4);
    t20 = *((unsigned int *)t3);
    t17 = (t17 & t20);
    t21 = *((unsigned int *)t19);
    t18 = (t18 & t21);
    t22 = (t16 + 4);
    t23 = *((unsigned int *)t16);
    *((unsigned int *)t16) = (t23 | t17);
    t24 = *((unsigned int *)t22);
    *((unsigned int *)t22) = (t24 | t18);
    xsi_driver_vfirst_trans(t12, 0, 9U);
    t25 = (t0 + 3952);
    *((int *)t25) = 1;

LAB1:    return;
}

static void Cont_44_4(char *t0)
{
    char t4[8];
    char t6[8];
    char *t1;
    char *t2;
    char *t3;
    char *t5;
    char *t7;
    char *t8;
    char *t9;
    char *t10;
    char *t11;
    unsigned int t12;
    unsigned int t13;
    char *t14;
    unsigned int t15;
    unsigned int t16;
    char *t17;
    unsigned int t18;
    unsigned int t19;
    char *t20;

LAB0:    t1 = (t0 + 3308U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(44, ng0);
    t2 = (t0 + 1244U);
    t3 = *((char **)t2);
    t2 = (t0 + 784U);
    t5 = *((char **)t2);
    t2 = ((char*)((ng2)));
    xsi_vlogtype_concat(t4, 22, 22, 2U, t2, 2, t5, 20);
    memset(t6, 0, 8);
    xsi_vlog_unsigned_add(t6, 22, t3, 22, t4, 22);
    t7 = (t0 + 4172);
    t8 = (t7 + 32U);
    t9 = *((char **)t8);
    t10 = (t9 + 40U);
    t11 = *((char **)t10);
    memset(t11, 0, 8);
    t12 = 4194303U;
    t13 = t12;
    t14 = (t6 + 4);
    t15 = *((unsigned int *)t6);
    t12 = (t12 & t15);
    t16 = *((unsigned int *)t14);
    t13 = (t13 & t16);
    t17 = (t11 + 4);
    t18 = *((unsigned int *)t11);
    *((unsigned int *)t11) = (t18 | t12);
    t19 = *((unsigned int *)t17);
    *((unsigned int *)t17) = (t19 | t13);
    xsi_driver_vfirst_trans(t7, 0, 21);
    t20 = (t0 + 3960);
    *((int *)t20) = 1;

LAB1:    return;
}

static void Always_60_5(char *t0)
{
    char t7[8];
    char t8[8];
    char t9[8];
    char t20[8];
    char t47[8];
    char t63[8];
    char t73[8];
    char t74[8];
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    int t6;
    char *t10;
    char *t11;
    char *t12;
    unsigned int t13;
    unsigned int t14;
    unsigned int t15;
    unsigned int t16;
    unsigned int t17;
    unsigned int t18;
    char *t19;
    char *t21;
    char *t22;
    unsigned int t23;
    unsigned int t24;
    unsigned int t25;
    unsigned int t26;
    unsigned int t27;
    unsigned int t28;
    unsigned int t29;
    unsigned int t30;
    unsigned int t31;
    unsigned int t32;
    unsigned int t33;
    unsigned int t34;
    char *t35;
    char *t36;
    unsigned int t37;
    unsigned int t38;
    unsigned int t39;
    unsigned int t40;
    unsigned int t41;
    char *t42;
    char *t43;
    unsigned int t44;
    unsigned int t45;
    unsigned int t46;
    char *t48;
    char *t49;
    char *t50;
    unsigned int t51;
    unsigned int t52;
    unsigned int t53;
    unsigned int t54;
    unsigned int t55;
    unsigned int t56;
    unsigned int t57;
    unsigned int t58;
    unsigned int t59;
    unsigned int t60;
    char *t61;
    char *t62;
    char *t64;
    char *t65;
    char *t66;
    unsigned int t67;
    unsigned int t68;
    unsigned int t69;
    unsigned int t70;
    unsigned int t71;
    unsigned int t72;
    char *t75;

LAB0:    t1 = (t0 + 3452U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(60, ng0);
    t2 = (t0 + 3968);
    *((int *)t2) = 1;
    t3 = (t0 + 3480);
    *((char **)t3) = t2;
    *((char **)t1) = &&LAB4;

LAB1:    return;
LAB4:    xsi_set_current_line(60, ng0);

LAB5:    xsi_set_current_line(61, ng0);
    t4 = (t0 + 1520U);
    t5 = *((char **)t4);

LAB6:    t4 = ((char*)((ng2)));
    t6 = xsi_vlog_unsigned_case_compare(t5, 2, t4, 2);
    if (t6 == 1)
        goto LAB7;

LAB8:    t2 = ((char*)((ng4)));
    t6 = xsi_vlog_unsigned_case_compare(t5, 2, t2, 2);
    if (t6 == 1)
        goto LAB9;

LAB10:    t2 = ((char*)((ng1)));
    t6 = xsi_vlog_unsigned_case_compare(t5, 2, t2, 2);
    if (t6 == 1)
        goto LAB11;

LAB12:    t2 = ((char*)((ng5)));
    t6 = xsi_vlog_unsigned_case_compare(t5, 2, t2, 2);
    if (t6 == 1)
        goto LAB13;

LAB14:
LAB16:
LAB15:    xsi_set_current_line(79, ng0);

LAB90:    xsi_set_current_line(80, ng0);
    t2 = (t0 + 1244U);
    t3 = *((char **)t2);
    memset(t7, 0, 8);
    t2 = (t7 + 4);
    t4 = (t3 + 4);
    t13 = *((unsigned int *)t3);
    t14 = (t13 >> 10);
    *((unsigned int *)t7) = t14;
    t15 = *((unsigned int *)t4);
    t16 = (t15 >> 10);
    *((unsigned int *)t2) = t16;
    t17 = *((unsigned int *)t7);
    *((unsigned int *)t7) = (t17 & 1023U);
    t18 = *((unsigned int *)t2);
    *((unsigned int *)t2) = (t18 & 1023U);
    t10 = (t0 + 2208);
    xsi_vlogvar_assign_value(t10, t7, 0, 0, 10);
    xsi_set_current_line(81, ng0);
    t2 = (t0 + 1336U);
    t3 = *((char **)t2);
    t2 = (t0 + 2116);
    xsi_vlogvar_assign_value(t2, t3, 0, 0, 16);

LAB17:    goto LAB2;

LAB7:    xsi_set_current_line(62, ng0);

LAB18:    xsi_set_current_line(63, ng0);
    t10 = (t0 + 1244U);
    t11 = *((char **)t10);
    memset(t9, 0, 8);
    t10 = (t9 + 4);
    t12 = (t11 + 4);
    t13 = *((unsigned int *)t11);
    t14 = (t13 >> 20);
    *((unsigned int *)t9) = t14;
    t15 = *((unsigned int *)t12);
    t16 = (t15 >> 20);
    *((unsigned int *)t10) = t16;
    t17 = *((unsigned int *)t9);
    *((unsigned int *)t9) = (t17 & 3U);
    t18 = *((unsigned int *)t10);
    *((unsigned int *)t10) = (t18 & 3U);
    t19 = ((char*)((ng2)));
    memset(t20, 0, 8);
    t21 = (t9 + 4);
    t22 = (t19 + 4);
    t23 = *((unsigned int *)t9);
    t24 = *((unsigned int *)t19);
    t25 = (t23 ^ t24);
    t26 = *((unsigned int *)t21);
    t27 = *((unsigned int *)t22);
    t28 = (t26 ^ t27);
    t29 = (t25 | t28);
    t30 = *((unsigned int *)t21);
    t31 = *((unsigned int *)t22);
    t32 = (t30 | t31);
    t33 = (~(t32));
    t34 = (t29 & t33);
    if (t34 != 0)
        goto LAB22;

LAB19:    if (t32 != 0)
        goto LAB21;

LAB20:    *((unsigned int *)t20) = 1;

LAB22:    memset(t8, 0, 8);
    t36 = (t20 + 4);
    t37 = *((unsigned int *)t36);
    t38 = (~(t37));
    t39 = *((unsigned int *)t20);
    t40 = (t39 & t38);
    t41 = (t40 & 1U);
    if (t41 != 0)
        goto LAB23;

LAB24:    if (*((unsigned int *)t36) != 0)
        goto LAB25;

LAB26:    t43 = (t8 + 4);
    t44 = *((unsigned int *)t8);
    t45 = *((unsigned int *)t43);
    t46 = (t44 || t45);
    if (t46 > 0)
        goto LAB27;

LAB28:    t57 = *((unsigned int *)t8);
    t58 = (~(t57));
    t59 = *((unsigned int *)t43);
    t60 = (t58 || t59);
    if (t60 > 0)
        goto LAB29;

LAB30:    if (*((unsigned int *)t43) > 0)
        goto LAB31;

LAB32:    if (*((unsigned int *)t8) > 0)
        goto LAB33;

LAB34:    memcpy(t7, t74, 8);

LAB35:    t75 = (t0 + 2208);
    xsi_vlogvar_assign_value(t75, t7, 0, 0, 10);
    xsi_set_current_line(64, ng0);
    t2 = (t0 + 1336U);
    t3 = *((char **)t2);
    t2 = (t0 + 2116);
    xsi_vlogvar_assign_value(t2, t3, 0, 0, 16);
    goto LAB17;

LAB9:    xsi_set_current_line(66, ng0);

LAB36:    xsi_set_current_line(67, ng0);
    t3 = (t0 + 1244U);
    t4 = *((char **)t3);
    memset(t9, 0, 8);
    t3 = (t9 + 4);
    t10 = (t4 + 4);
    t13 = *((unsigned int *)t4);
    t14 = (t13 >> 20);
    *((unsigned int *)t9) = t14;
    t15 = *((unsigned int *)t10);
    t16 = (t15 >> 20);
    *((unsigned int *)t3) = t16;
    t17 = *((unsigned int *)t9);
    *((unsigned int *)t9) = (t17 & 3U);
    t18 = *((unsigned int *)t3);
    *((unsigned int *)t3) = (t18 & 3U);
    t11 = ((char*)((ng4)));
    memset(t20, 0, 8);
    t12 = (t9 + 4);
    t19 = (t11 + 4);
    t23 = *((unsigned int *)t9);
    t24 = *((unsigned int *)t11);
    t25 = (t23 ^ t24);
    t26 = *((unsigned int *)t12);
    t27 = *((unsigned int *)t19);
    t28 = (t26 ^ t27);
    t29 = (t25 | t28);
    t30 = *((unsigned int *)t12);
    t31 = *((unsigned int *)t19);
    t32 = (t30 | t31);
    t33 = (~(t32));
    t34 = (t29 & t33);
    if (t34 != 0)
        goto LAB40;

LAB37:    if (t32 != 0)
        goto LAB39;

LAB38:    *((unsigned int *)t20) = 1;

LAB40:    memset(t8, 0, 8);
    t22 = (t20 + 4);
    t37 = *((unsigned int *)t22);
    t38 = (~(t37));
    t39 = *((unsigned int *)t20);
    t40 = (t39 & t38);
    t41 = (t40 & 1U);
    if (t41 != 0)
        goto LAB41;

LAB42:    if (*((unsigned int *)t22) != 0)
        goto LAB43;

LAB44:    t36 = (t8 + 4);
    t44 = *((unsigned int *)t8);
    t45 = *((unsigned int *)t36);
    t46 = (t44 || t45);
    if (t46 > 0)
        goto LAB45;

LAB46:    t57 = *((unsigned int *)t8);
    t58 = (~(t57));
    t59 = *((unsigned int *)t36);
    t60 = (t58 || t59);
    if (t60 > 0)
        goto LAB47;

LAB48:    if (*((unsigned int *)t36) > 0)
        goto LAB49;

LAB50:    if (*((unsigned int *)t8) > 0)
        goto LAB51;

LAB52:    memcpy(t7, t74, 8);

LAB53:    t65 = (t0 + 2208);
    xsi_vlogvar_assign_value(t65, t7, 0, 0, 10);
    xsi_set_current_line(68, ng0);
    t2 = (t0 + 1336U);
    t3 = *((char **)t2);
    t2 = (t0 + 2116);
    xsi_vlogvar_assign_value(t2, t3, 0, 0, 16);
    goto LAB17;

LAB11:    xsi_set_current_line(70, ng0);

LAB54:    xsi_set_current_line(71, ng0);
    t3 = (t0 + 1244U);
    t4 = *((char **)t3);
    memset(t9, 0, 8);
    t3 = (t9 + 4);
    t10 = (t4 + 4);
    t13 = *((unsigned int *)t4);
    t14 = (t13 >> 20);
    *((unsigned int *)t9) = t14;
    t15 = *((unsigned int *)t10);
    t16 = (t15 >> 20);
    *((unsigned int *)t3) = t16;
    t17 = *((unsigned int *)t9);
    *((unsigned int *)t9) = (t17 & 3U);
    t18 = *((unsigned int *)t3);
    *((unsigned int *)t3) = (t18 & 3U);
    t11 = ((char*)((ng1)));
    memset(t20, 0, 8);
    t12 = (t9 + 4);
    t19 = (t11 + 4);
    t23 = *((unsigned int *)t9);
    t24 = *((unsigned int *)t11);
    t25 = (t23 ^ t24);
    t26 = *((unsigned int *)t12);
    t27 = *((unsigned int *)t19);
    t28 = (t26 ^ t27);
    t29 = (t25 | t28);
    t30 = *((unsigned int *)t12);
    t31 = *((unsigned int *)t19);
    t32 = (t30 | t31);
    t33 = (~(t32));
    t34 = (t29 & t33);
    if (t34 != 0)
        goto LAB58;

LAB55:    if (t32 != 0)
        goto LAB57;

LAB56:    *((unsigned int *)t20) = 1;

LAB58:    memset(t8, 0, 8);
    t22 = (t20 + 4);
    t37 = *((unsigned int *)t22);
    t38 = (~(t37));
    t39 = *((unsigned int *)t20);
    t40 = (t39 & t38);
    t41 = (t40 & 1U);
    if (t41 != 0)
        goto LAB59;

LAB60:    if (*((unsigned int *)t22) != 0)
        goto LAB61;

LAB62:    t36 = (t8 + 4);
    t44 = *((unsigned int *)t8);
    t45 = *((unsigned int *)t36);
    t46 = (t44 || t45);
    if (t46 > 0)
        goto LAB63;

LAB64:    t57 = *((unsigned int *)t8);
    t58 = (~(t57));
    t59 = *((unsigned int *)t36);
    t60 = (t58 || t59);
    if (t60 > 0)
        goto LAB65;

LAB66:    if (*((unsigned int *)t36) > 0)
        goto LAB67;

LAB68:    if (*((unsigned int *)t8) > 0)
        goto LAB69;

LAB70:    memcpy(t7, t74, 8);

LAB71:    t65 = (t0 + 2208);
    xsi_vlogvar_assign_value(t65, t7, 0, 0, 10);
    xsi_set_current_line(72, ng0);
    t2 = ((char*)((ng2)));
    t3 = (t0 + 1336U);
    t4 = *((char **)t3);
    memset(t7, 0, 8);
    xsi_vlog_unsigned_minus(t7, 16, t2, 16, t4, 16);
    t3 = (t0 + 2116);
    xsi_vlogvar_assign_value(t3, t7, 0, 0, 16);
    goto LAB17;

LAB13:    xsi_set_current_line(75, ng0);

LAB72:    xsi_set_current_line(76, ng0);
    t3 = (t0 + 1244U);
    t4 = *((char **)t3);
    memset(t9, 0, 8);
    t3 = (t9 + 4);
    t10 = (t4 + 4);
    t13 = *((unsigned int *)t4);
    t14 = (t13 >> 20);
    *((unsigned int *)t9) = t14;
    t15 = *((unsigned int *)t10);
    t16 = (t15 >> 20);
    *((unsigned int *)t3) = t16;
    t17 = *((unsigned int *)t9);
    *((unsigned int *)t9) = (t17 & 3U);
    t18 = *((unsigned int *)t3);
    *((unsigned int *)t3) = (t18 & 3U);
    t11 = ((char*)((ng5)));
    memset(t20, 0, 8);
    t12 = (t9 + 4);
    t19 = (t11 + 4);
    t23 = *((unsigned int *)t9);
    t24 = *((unsigned int *)t11);
    t25 = (t23 ^ t24);
    t26 = *((unsigned int *)t12);
    t27 = *((unsigned int *)t19);
    t28 = (t26 ^ t27);
    t29 = (t25 | t28);
    t30 = *((unsigned int *)t12);
    t31 = *((unsigned int *)t19);
    t32 = (t30 | t31);
    t33 = (~(t32));
    t34 = (t29 & t33);
    if (t34 != 0)
        goto LAB76;

LAB73:    if (t32 != 0)
        goto LAB75;

LAB74:    *((unsigned int *)t20) = 1;

LAB76:    memset(t8, 0, 8);
    t22 = (t20 + 4);
    t37 = *((unsigned int *)t22);
    t38 = (~(t37));
    t39 = *((unsigned int *)t20);
    t40 = (t39 & t38);
    t41 = (t40 & 1U);
    if (t41 != 0)
        goto LAB77;

LAB78:    if (*((unsigned int *)t22) != 0)
        goto LAB79;

LAB80:    t36 = (t8 + 4);
    t44 = *((unsigned int *)t8);
    t45 = *((unsigned int *)t36);
    t46 = (t44 || t45);
    if (t46 > 0)
        goto LAB81;

LAB82:    t57 = *((unsigned int *)t8);
    t58 = (~(t57));
    t59 = *((unsigned int *)t36);
    t60 = (t58 || t59);
    if (t60 > 0)
        goto LAB83;

LAB84:    if (*((unsigned int *)t36) > 0)
        goto LAB85;

LAB86:    if (*((unsigned int *)t8) > 0)
        goto LAB87;

LAB88:    memcpy(t7, t74, 8);

LAB89:    t65 = (t0 + 2208);
    xsi_vlogvar_assign_value(t65, t7, 0, 0, 10);
    xsi_set_current_line(77, ng0);
    t2 = ((char*)((ng2)));
    t3 = (t0 + 1336U);
    t4 = *((char **)t3);
    memset(t7, 0, 8);
    xsi_vlog_unsigned_minus(t7, 16, t2, 16, t4, 16);
    t3 = (t0 + 2116);
    xsi_vlogvar_assign_value(t3, t7, 0, 0, 16);
    goto LAB17;

LAB21:    t35 = (t20 + 4);
    *((unsigned int *)t20) = 1;
    *((unsigned int *)t35) = 1;
    goto LAB22;

LAB23:    *((unsigned int *)t8) = 1;
    goto LAB26;

LAB25:    t42 = (t8 + 4);
    *((unsigned int *)t8) = 1;
    *((unsigned int *)t42) = 1;
    goto LAB26;

LAB27:    t48 = (t0 + 1244U);
    t49 = *((char **)t48);
    memset(t47, 0, 8);
    t48 = (t47 + 4);
    t50 = (t49 + 4);
    t51 = *((unsigned int *)t49);
    t52 = (t51 >> 10);
    *((unsigned int *)t47) = t52;
    t53 = *((unsigned int *)t50);
    t54 = (t53 >> 10);
    *((unsigned int *)t48) = t54;
    t55 = *((unsigned int *)t47);
    *((unsigned int *)t47) = (t55 & 1023U);
    t56 = *((unsigned int *)t48);
    *((unsigned int *)t48) = (t56 & 1023U);
    goto LAB28;

LAB29:    t61 = ((char*)((ng3)));
    t62 = ((char*)((ng2)));
    t64 = (t0 + 1244U);
    t65 = *((char **)t64);
    memset(t63, 0, 8);
    t64 = (t63 + 4);
    t66 = (t65 + 4);
    t67 = *((unsigned int *)t65);
    t68 = (t67 >> 10);
    *((unsigned int *)t63) = t68;
    t69 = *((unsigned int *)t66);
    t70 = (t69 >> 10);
    *((unsigned int *)t64) = t70;
    t71 = *((unsigned int *)t63);
    *((unsigned int *)t63) = (t71 & 1023U);
    t72 = *((unsigned int *)t64);
    *((unsigned int *)t64) = (t72 & 1023U);
    memset(t73, 0, 8);
    xsi_vlog_unsigned_minus(t73, 10, t62, 10, t63, 10);
    memset(t74, 0, 8);
    xsi_vlog_unsigned_add(t74, 10, t61, 10, t73, 10);
    goto LAB30;

LAB31:    xsi_vlog_unsigned_bit_combine(t7, 10, t47, 10, t74, 10);
    goto LAB35;

LAB33:    memcpy(t7, t47, 8);
    goto LAB35;

LAB39:    t21 = (t20 + 4);
    *((unsigned int *)t20) = 1;
    *((unsigned int *)t21) = 1;
    goto LAB40;

LAB41:    *((unsigned int *)t8) = 1;
    goto LAB44;

LAB43:    t35 = (t8 + 4);
    *((unsigned int *)t8) = 1;
    *((unsigned int *)t35) = 1;
    goto LAB44;

LAB45:    t42 = ((char*)((ng3)));
    t43 = ((char*)((ng2)));
    t48 = (t0 + 1244U);
    t49 = *((char **)t48);
    memset(t47, 0, 8);
    t48 = (t47 + 4);
    t50 = (t49 + 4);
    t51 = *((unsigned int *)t49);
    t52 = (t51 >> 10);
    *((unsigned int *)t47) = t52;
    t53 = *((unsigned int *)t50);
    t54 = (t53 >> 10);
    *((unsigned int *)t48) = t54;
    t55 = *((unsigned int *)t47);
    *((unsigned int *)t47) = (t55 & 1023U);
    t56 = *((unsigned int *)t48);
    *((unsigned int *)t48) = (t56 & 1023U);
    memset(t63, 0, 8);
    xsi_vlog_unsigned_minus(t63, 10, t43, 10, t47, 10);
    memset(t73, 0, 8);
    xsi_vlog_unsigned_add(t73, 10, t42, 10, t63, 10);
    goto LAB46;

LAB47:    t61 = (t0 + 1244U);
    t62 = *((char **)t61);
    memset(t74, 0, 8);
    t61 = (t74 + 4);
    t64 = (t62 + 4);
    t67 = *((unsigned int *)t62);
    t68 = (t67 >> 10);
    *((unsigned int *)t74) = t68;
    t69 = *((unsigned int *)t64);
    t70 = (t69 >> 10);
    *((unsigned int *)t61) = t70;
    t71 = *((unsigned int *)t74);
    *((unsigned int *)t74) = (t71 & 1023U);
    t72 = *((unsigned int *)t61);
    *((unsigned int *)t61) = (t72 & 1023U);
    goto LAB48;

LAB49:    xsi_vlog_unsigned_bit_combine(t7, 10, t73, 10, t74, 10);
    goto LAB53;

LAB51:    memcpy(t7, t73, 8);
    goto LAB53;

LAB57:    t21 = (t20 + 4);
    *((unsigned int *)t20) = 1;
    *((unsigned int *)t21) = 1;
    goto LAB58;

LAB59:    *((unsigned int *)t8) = 1;
    goto LAB62;

LAB61:    t35 = (t8 + 4);
    *((unsigned int *)t8) = 1;
    *((unsigned int *)t35) = 1;
    goto LAB62;

LAB63:    t42 = (t0 + 1244U);
    t43 = *((char **)t42);
    memset(t47, 0, 8);
    t42 = (t47 + 4);
    t48 = (t43 + 4);
    t51 = *((unsigned int *)t43);
    t52 = (t51 >> 10);
    *((unsigned int *)t47) = t52;
    t53 = *((unsigned int *)t48);
    t54 = (t53 >> 10);
    *((unsigned int *)t42) = t54;
    t55 = *((unsigned int *)t47);
    *((unsigned int *)t47) = (t55 & 1023U);
    t56 = *((unsigned int *)t42);
    *((unsigned int *)t42) = (t56 & 1023U);
    goto LAB64;

LAB65:    t49 = ((char*)((ng3)));
    t50 = ((char*)((ng2)));
    t61 = (t0 + 1244U);
    t62 = *((char **)t61);
    memset(t63, 0, 8);
    t61 = (t63 + 4);
    t64 = (t62 + 4);
    t67 = *((unsigned int *)t62);
    t68 = (t67 >> 10);
    *((unsigned int *)t63) = t68;
    t69 = *((unsigned int *)t64);
    t70 = (t69 >> 10);
    *((unsigned int *)t61) = t70;
    t71 = *((unsigned int *)t63);
    *((unsigned int *)t63) = (t71 & 1023U);
    t72 = *((unsigned int *)t61);
    *((unsigned int *)t61) = (t72 & 1023U);
    memset(t73, 0, 8);
    xsi_vlog_unsigned_minus(t73, 10, t50, 10, t63, 10);
    memset(t74, 0, 8);
    xsi_vlog_unsigned_add(t74, 10, t49, 10, t73, 10);
    goto LAB66;

LAB67:    xsi_vlog_unsigned_bit_combine(t7, 10, t47, 10, t74, 10);
    goto LAB71;

LAB69:    memcpy(t7, t47, 8);
    goto LAB71;

LAB75:    t21 = (t20 + 4);
    *((unsigned int *)t20) = 1;
    *((unsigned int *)t21) = 1;
    goto LAB76;

LAB77:    *((unsigned int *)t8) = 1;
    goto LAB80;

LAB79:    t35 = (t8 + 4);
    *((unsigned int *)t8) = 1;
    *((unsigned int *)t35) = 1;
    goto LAB80;

LAB81:    t42 = ((char*)((ng3)));
    t43 = ((char*)((ng2)));
    t48 = (t0 + 1244U);
    t49 = *((char **)t48);
    memset(t47, 0, 8);
    t48 = (t47 + 4);
    t50 = (t49 + 4);
    t51 = *((unsigned int *)t49);
    t52 = (t51 >> 10);
    *((unsigned int *)t47) = t52;
    t53 = *((unsigned int *)t50);
    t54 = (t53 >> 10);
    *((unsigned int *)t48) = t54;
    t55 = *((unsigned int *)t47);
    *((unsigned int *)t47) = (t55 & 1023U);
    t56 = *((unsigned int *)t48);
    *((unsigned int *)t48) = (t56 & 1023U);
    memset(t63, 0, 8);
    xsi_vlog_unsigned_minus(t63, 10, t43, 10, t47, 10);
    memset(t73, 0, 8);
    xsi_vlog_unsigned_add(t73, 10, t42, 10, t63, 10);
    goto LAB82;

LAB83:    t61 = (t0 + 1244U);
    t62 = *((char **)t61);
    memset(t74, 0, 8);
    t61 = (t74 + 4);
    t64 = (t62 + 4);
    t67 = *((unsigned int *)t62);
    t68 = (t67 >> 10);
    *((unsigned int *)t74) = t68;
    t69 = *((unsigned int *)t64);
    t70 = (t69 >> 10);
    *((unsigned int *)t61) = t70;
    t71 = *((unsigned int *)t74);
    *((unsigned int *)t74) = (t71 & 1023U);
    t72 = *((unsigned int *)t61);
    *((unsigned int *)t61) = (t72 & 1023U);
    goto LAB84;

LAB85:    xsi_vlog_unsigned_bit_combine(t7, 10, t73, 10, t74, 10);
    goto LAB89;

LAB87:    memcpy(t7, t73, 8);
    goto LAB89;

}

static void Cont_86_6(char *t0)
{
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    char *t6;
    char *t7;
    char *t8;
    char *t9;
    unsigned int t10;
    unsigned int t11;
    char *t12;
    unsigned int t13;
    unsigned int t14;
    char *t15;
    unsigned int t16;
    unsigned int t17;
    char *t18;

LAB0:    t1 = (t0 + 3596U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(86, ng0);
    t2 = (t0 + 2116);
    t3 = (t2 + 36U);
    t4 = *((char **)t3);
    t5 = (t0 + 4208);
    t6 = (t5 + 32U);
    t7 = *((char **)t6);
    t8 = (t7 + 40U);
    t9 = *((char **)t8);
    memset(t9, 0, 8);
    t10 = 65535U;
    t11 = t10;
    t12 = (t4 + 4);
    t13 = *((unsigned int *)t4);
    t10 = (t10 & t13);
    t14 = *((unsigned int *)t12);
    t11 = (t11 & t14);
    t15 = (t9 + 4);
    t16 = *((unsigned int *)t9);
    *((unsigned int *)t9) = (t16 | t10);
    t17 = *((unsigned int *)t15);
    *((unsigned int *)t15) = (t17 | t11);
    xsi_driver_vfirst_trans(t5, 0, 15);
    t18 = (t0 + 3976);
    *((int *)t18) = 1;

LAB1:    return;
}

static void Cont_87_7(char *t0)
{
    char t3[8];
    char t6[8];
    char *t1;
    char *t2;
    char *t4;
    char *t5;
    char *t7;
    unsigned int t8;
    unsigned int t9;
    unsigned int t10;
    unsigned int t11;
    unsigned int t12;
    unsigned int t13;
    unsigned int t14;
    unsigned int t15;
    unsigned int t16;
    unsigned int t17;
    unsigned int t18;
    unsigned int t19;
    char *t20;
    char *t21;
    unsigned int t22;
    unsigned int t23;
    unsigned int t24;
    unsigned int t25;
    unsigned int t26;
    char *t27;
    char *t28;
    char *t29;
    unsigned int t30;
    unsigned int t31;
    unsigned int t32;
    unsigned int t33;
    unsigned int t34;
    unsigned int t35;
    unsigned int t36;
    unsigned int t37;
    char *t38;
    char *t39;
    char *t40;
    char *t41;
    char *t42;
    unsigned int t43;
    unsigned int t44;
    char *t45;
    unsigned int t46;
    unsigned int t47;
    char *t48;
    unsigned int t49;
    unsigned int t50;
    char *t51;

LAB0:    t1 = (t0 + 3740U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(87, ng0);
    t2 = (t0 + 1428U);
    t4 = *((char **)t2);
    t2 = (t0 + 1060U);
    t5 = *((char **)t2);
    memset(t6, 0, 8);
    t2 = (t4 + 4);
    t7 = (t5 + 4);
    t8 = *((unsigned int *)t4);
    t9 = *((unsigned int *)t5);
    t10 = (t8 ^ t9);
    t11 = *((unsigned int *)t2);
    t12 = *((unsigned int *)t7);
    t13 = (t11 ^ t12);
    t14 = (t10 | t13);
    t15 = *((unsigned int *)t2);
    t16 = *((unsigned int *)t7);
    t17 = (t15 | t16);
    t18 = (~(t17));
    t19 = (t14 & t18);
    if (t19 != 0)
        goto LAB7;

LAB4:    if (t17 != 0)
        goto LAB6;

LAB5:    *((unsigned int *)t6) = 1;

LAB7:    memset(t3, 0, 8);
    t21 = (t6 + 4);
    t22 = *((unsigned int *)t21);
    t23 = (~(t22));
    t24 = *((unsigned int *)t6);
    t25 = (t24 & t23);
    t26 = (t25 & 1U);
    if (t26 != 0)
        goto LAB11;

LAB9:    if (*((unsigned int *)t21) == 0)
        goto LAB8;

LAB10:    t27 = (t3 + 4);
    *((unsigned int *)t3) = 1;
    *((unsigned int *)t27) = 1;

LAB11:    t28 = (t3 + 4);
    t29 = (t6 + 4);
    t30 = *((unsigned int *)t6);
    t31 = (~(t30));
    *((unsigned int *)t3) = t31;
    *((unsigned int *)t28) = 0;
    if (*((unsigned int *)t29) != 0)
        goto LAB13;

LAB12:    t36 = *((unsigned int *)t3);
    *((unsigned int *)t3) = (t36 & 1U);
    t37 = *((unsigned int *)t28);
    *((unsigned int *)t28) = (t37 & 1U);
    t38 = (t0 + 4244);
    t39 = (t38 + 32U);
    t40 = *((char **)t39);
    t41 = (t40 + 40U);
    t42 = *((char **)t41);
    memset(t42, 0, 8);
    t43 = 1U;
    t44 = t43;
    t45 = (t3 + 4);
    t46 = *((unsigned int *)t3);
    t43 = (t43 & t46);
    t47 = *((unsigned int *)t45);
    t44 = (t44 & t47);
    t48 = (t42 + 4);
    t49 = *((unsigned int *)t42);
    *((unsigned int *)t42) = (t49 | t43);
    t50 = *((unsigned int *)t48);
    *((unsigned int *)t48) = (t50 | t44);
    xsi_driver_vfirst_trans(t38, 0, 0);
    t51 = (t0 + 3984);
    *((int *)t51) = 1;

LAB1:    return;
LAB6:    t20 = (t6 + 4);
    *((unsigned int *)t6) = 1;
    *((unsigned int *)t20) = 1;
    goto LAB7;

LAB8:    *((unsigned int *)t3) = 1;
    goto LAB11;

LAB13:    t32 = *((unsigned int *)t3);
    t33 = *((unsigned int *)t29);
    *((unsigned int *)t3) = (t32 | t33);
    t34 = *((unsigned int *)t28);
    t35 = *((unsigned int *)t29);
    *((unsigned int *)t28) = (t34 | t35);
    goto LAB12;

}


extern void work_m_00000000002061073186_3453606180_init()
{
	static char *pe[] = {(void *)NetDecl_21_0,(void *)NetDecl_24_1,(void *)NetDecl_25_2,(void *)NetDecl_26_3,(void *)Cont_44_4,(void *)Always_60_5,(void *)Cont_86_6,(void *)Cont_87_7};
	xsi_register_didat("work_m_00000000002061073186_3453606180", "isim/wave_capture_tb_isim_beh.exe.sim/work/m_00000000002061073186_3453606180.didat");
	xsi_register_executes(pe);
}
