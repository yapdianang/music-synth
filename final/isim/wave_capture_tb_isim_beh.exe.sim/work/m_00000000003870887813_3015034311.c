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
static const char *ng0 = "//afs/ir/class/ee108/groups/12/lab5/wave_capture.v";
static int ng1[] = {15, 0};
static int ng2[] = {1, 0};
static int ng3[] = {0, 0};
static unsigned int ng4[] = {1U, 0U};
static unsigned int ng5[] = {0U, 0U};
static unsigned int ng6[] = {255U, 0U};
static unsigned int ng7[] = {2U, 0U};
static unsigned int ng8[] = {128U, 0U};



static void NetDecl_52_0(char *t0)
{
    char t4[8];
    char t9[8];
    char t27[8];
    char t32[8];
    char t48[8];
    char *t1;
    char *t2;
    char *t3;
    char *t5;
    char *t6;
    char *t7;
    char *t8;
    char *t10;
    char *t11;
    unsigned int t12;
    unsigned int t13;
    unsigned int t14;
    unsigned int t15;
    unsigned int t16;
    unsigned int t17;
    unsigned int t18;
    unsigned int t19;
    unsigned int t20;
    unsigned int t21;
    unsigned int t22;
    unsigned int t23;
    char *t24;
    char *t25;
    char *t26;
    char *t28;
    char *t29;
    char *t30;
    char *t31;
    char *t33;
    char *t34;
    unsigned int t35;
    unsigned int t36;
    unsigned int t37;
    unsigned int t38;
    unsigned int t39;
    unsigned int t40;
    unsigned int t41;
    unsigned int t42;
    unsigned int t43;
    unsigned int t44;
    unsigned int t45;
    unsigned int t46;
    char *t47;
    unsigned int t49;
    unsigned int t50;
    unsigned int t51;
    char *t52;
    char *t53;
    char *t54;
    unsigned int t55;
    unsigned int t56;
    unsigned int t57;
    unsigned int t58;
    unsigned int t59;
    unsigned int t60;
    unsigned int t61;
    char *t62;
    char *t63;
    unsigned int t64;
    unsigned int t65;
    unsigned int t66;
    unsigned int t67;
    unsigned int t68;
    unsigned int t69;
    unsigned int t70;
    unsigned int t71;
    int t72;
    int t73;
    unsigned int t74;
    unsigned int t75;
    unsigned int t76;
    unsigned int t77;
    unsigned int t78;
    unsigned int t79;
    char *t80;
    char *t81;
    char *t82;
    char *t83;
    char *t84;
    unsigned int t85;
    unsigned int t86;
    char *t87;
    unsigned int t88;
    unsigned int t89;
    char *t90;
    unsigned int t91;
    unsigned int t92;
    char *t93;

LAB0:    t1 = (t0 + 2732U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(52, ng0);
    t2 = (t0 + 1704U);
    t3 = *((char **)t2);
    t2 = (t0 + 1680U);
    t5 = (t2 + 44U);
    t6 = *((char **)t5);
    t7 = ((char*)((ng1)));
    xsi_vlog_generic_get_index_select_value(t4, 32, t3, t6, 2, t7, 32, 1);
    t8 = ((char*)((ng2)));
    memset(t9, 0, 8);
    t10 = (t4 + 4);
    t11 = (t8 + 4);
    t12 = *((unsigned int *)t4);
    t13 = *((unsigned int *)t8);
    t14 = (t12 ^ t13);
    t15 = *((unsigned int *)t10);
    t16 = *((unsigned int *)t11);
    t17 = (t15 ^ t16);
    t18 = (t14 | t17);
    t19 = *((unsigned int *)t10);
    t20 = *((unsigned int *)t11);
    t21 = (t19 | t20);
    t22 = (~(t21));
    t23 = (t18 & t22);
    if (t23 != 0)
        goto LAB7;

LAB4:    if (t21 != 0)
        goto LAB6;

LAB5:    *((unsigned int *)t9) = 1;

LAB7:    t25 = (t0 + 876U);
    t26 = *((char **)t25);
    t25 = (t0 + 852U);
    t28 = (t25 + 44U);
    t29 = *((char **)t28);
    t30 = ((char*)((ng1)));
    xsi_vlog_generic_get_index_select_value(t27, 32, t26, t29, 2, t30, 32, 1);
    t31 = ((char*)((ng3)));
    memset(t32, 0, 8);
    t33 = (t27 + 4);
    t34 = (t31 + 4);
    t35 = *((unsigned int *)t27);
    t36 = *((unsigned int *)t31);
    t37 = (t35 ^ t36);
    t38 = *((unsigned int *)t33);
    t39 = *((unsigned int *)t34);
    t40 = (t38 ^ t39);
    t41 = (t37 | t40);
    t42 = *((unsigned int *)t33);
    t43 = *((unsigned int *)t34);
    t44 = (t42 | t43);
    t45 = (~(t44));
    t46 = (t41 & t45);
    if (t46 != 0)
        goto LAB11;

LAB8:    if (t44 != 0)
        goto LAB10;

LAB9:    *((unsigned int *)t32) = 1;

LAB11:    t49 = *((unsigned int *)t9);
    t50 = *((unsigned int *)t32);
    t51 = (t49 & t50);
    *((unsigned int *)t48) = t51;
    t52 = (t9 + 4);
    t53 = (t32 + 4);
    t54 = (t48 + 4);
    t55 = *((unsigned int *)t52);
    t56 = *((unsigned int *)t53);
    t57 = (t55 | t56);
    *((unsigned int *)t54) = t57;
    t58 = *((unsigned int *)t54);
    t59 = (t58 != 0);
    if (t59 == 1)
        goto LAB12;

LAB13:
LAB14:    t80 = (t0 + 4036);
    t81 = (t80 + 32U);
    t82 = *((char **)t81);
    t83 = (t82 + 40U);
    t84 = *((char **)t83);
    memset(t84, 0, 8);
    t85 = 1U;
    t86 = t85;
    t87 = (t48 + 4);
    t88 = *((unsigned int *)t48);
    t85 = (t85 & t88);
    t89 = *((unsigned int *)t87);
    t86 = (t86 & t89);
    t90 = (t84 + 4);
    t91 = *((unsigned int *)t84);
    *((unsigned int *)t84) = (t91 | t85);
    t92 = *((unsigned int *)t90);
    *((unsigned int *)t90) = (t92 | t86);
    xsi_driver_vfirst_trans(t80, 0, 0U);
    t93 = (t0 + 3936);
    *((int *)t93) = 1;

LAB1:    return;
LAB6:    t24 = (t9 + 4);
    *((unsigned int *)t9) = 1;
    *((unsigned int *)t24) = 1;
    goto LAB7;

LAB10:    t47 = (t32 + 4);
    *((unsigned int *)t32) = 1;
    *((unsigned int *)t47) = 1;
    goto LAB11;

LAB12:    t60 = *((unsigned int *)t48);
    t61 = *((unsigned int *)t54);
    *((unsigned int *)t48) = (t60 | t61);
    t62 = (t9 + 4);
    t63 = (t32 + 4);
    t64 = *((unsigned int *)t9);
    t65 = (~(t64));
    t66 = *((unsigned int *)t62);
    t67 = (~(t66));
    t68 = *((unsigned int *)t32);
    t69 = (~(t68));
    t70 = *((unsigned int *)t63);
    t71 = (~(t70));
    t72 = (t65 & t67);
    t73 = (t69 & t71);
    t74 = (~(t72));
    t75 = (~(t73));
    t76 = *((unsigned int *)t54);
    *((unsigned int *)t54) = (t76 & t74);
    t77 = *((unsigned int *)t54);
    *((unsigned int *)t54) = (t77 & t75);
    t78 = *((unsigned int *)t48);
    *((unsigned int *)t48) = (t78 & t74);
    t79 = *((unsigned int *)t48);
    *((unsigned int *)t48) = (t79 & t75);
    goto LAB14;

}

static void Cont_55_1(char *t0)
{
    char t4[8];
    char *t1;
    char *t2;
    char *t3;
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

LAB0:    t1 = (t0 + 2876U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(55, ng0);
    t2 = (t0 + 1520U);
    t3 = *((char **)t2);
    t2 = ((char*)((ng4)));
    memset(t4, 0, 8);
    xsi_vlog_unsigned_add(t4, 8, t3, 8, t2, 8);
    t5 = (t0 + 4072);
    t6 = (t5 + 32U);
    t7 = *((char **)t6);
    t8 = (t7 + 40U);
    t9 = *((char **)t8);
    memset(t9, 0, 8);
    t10 = 255U;
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
    xsi_driver_vfirst_trans(t5, 0, 7);
    t18 = (t0 + 3944);
    *((int *)t18) = 1;

LAB1:    return;
}

static void Always_57_2(char *t0)
{
    char t7[8];
    char t8[8];
    char t28[8];
    char t48[8];
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    int t6;
    char *t9;
    char *t10;
    unsigned int t11;
    unsigned int t12;
    unsigned int t13;
    unsigned int t14;
    unsigned int t15;
    char *t16;
    char *t17;
    unsigned int t18;
    unsigned int t19;
    unsigned int t20;
    char *t21;
    unsigned int t22;
    unsigned int t23;
    unsigned int t24;
    unsigned int t25;
    char *t26;
    char *t27;
    unsigned int t29;
    unsigned int t30;
    unsigned int t31;
    unsigned int t32;
    unsigned int t33;
    unsigned int t34;
    unsigned int t35;
    unsigned int t36;
    unsigned int t37;
    unsigned int t38;
    unsigned int t39;
    unsigned int t40;
    char *t41;
    char *t42;
    unsigned int t43;
    unsigned int t44;
    unsigned int t45;
    unsigned int t46;
    unsigned int t47;
    char *t49;
    char *t50;
    char *t51;
    char *t52;
    unsigned int t53;
    unsigned int t54;
    unsigned int t55;
    unsigned int t56;
    unsigned int t57;
    char *t58;
    char *t59;
    char *t60;
    unsigned int t61;
    unsigned int t62;
    unsigned int t63;
    unsigned int t64;
    unsigned int t65;
    unsigned int t66;
    unsigned int t67;
    unsigned int t68;
    char *t69;

LAB0:    t1 = (t0 + 3020U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(57, ng0);
    t2 = (t0 + 3952);
    *((int *)t2) = 1;
    t3 = (t0 + 3048);
    *((char **)t3) = t2;
    *((char **)t1) = &&LAB4;

LAB1:    return;
LAB4:    xsi_set_current_line(57, ng0);

LAB5:    xsi_set_current_line(58, ng0);
    t4 = (t0 + 1612U);
    t5 = *((char **)t4);

LAB6:    t4 = ((char*)((ng5)));
    t6 = xsi_vlog_unsigned_case_compare(t5, 2, t4, 2);
    if (t6 == 1)
        goto LAB7;

LAB8:    t2 = ((char*)((ng4)));
    t6 = xsi_vlog_unsigned_case_compare(t5, 2, t2, 2);
    if (t6 == 1)
        goto LAB9;

LAB10:    t2 = ((char*)((ng7)));
    t6 = xsi_vlog_unsigned_case_compare(t5, 2, t2, 2);
    if (t6 == 1)
        goto LAB11;

LAB12:
LAB14:
LAB13:    xsi_set_current_line(77, ng0);

LAB116:    xsi_set_current_line(78, ng0);
    t2 = ((char*)((ng5)));
    t3 = (t0 + 2208);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 2);
    xsi_set_current_line(79, ng0);
    t2 = (t0 + 692U);
    t3 = *((char **)t2);
    memset(t8, 0, 8);
    t2 = (t3 + 4);
    t11 = *((unsigned int *)t2);
    t12 = (~(t11));
    t13 = *((unsigned int *)t3);
    t14 = (t13 & t12);
    t15 = (t14 & 1U);
    if (t15 != 0)
        goto LAB117;

LAB118:    if (*((unsigned int *)t2) != 0)
        goto LAB119;

LAB120:    t9 = (t8 + 4);
    t18 = *((unsigned int *)t8);
    t19 = *((unsigned int *)t9);
    t20 = (t18 || t19);
    if (t20 > 0)
        goto LAB121;

LAB122:    t22 = *((unsigned int *)t8);
    t23 = (~(t22));
    t24 = *((unsigned int *)t9);
    t25 = (t23 || t24);
    if (t25 > 0)
        goto LAB123;

LAB124:    if (*((unsigned int *)t9) > 0)
        goto LAB125;

LAB126:    if (*((unsigned int *)t8) > 0)
        goto LAB127;

LAB128:    memcpy(t7, t21, 8);

LAB129:    t26 = (t0 + 2116);
    xsi_vlogvar_assign_value(t26, t7, 0, 0, 1);

LAB15:    goto LAB2;

LAB7:    xsi_set_current_line(59, ng0);

LAB16:    xsi_set_current_line(60, ng0);
    t9 = (t0 + 1796U);
    t10 = *((char **)t9);
    memset(t8, 0, 8);
    t9 = (t10 + 4);
    t11 = *((unsigned int *)t9);
    t12 = (~(t11));
    t13 = *((unsigned int *)t10);
    t14 = (t13 & t12);
    t15 = (t14 & 1U);
    if (t15 != 0)
        goto LAB17;

LAB18:    if (*((unsigned int *)t9) != 0)
        goto LAB19;

LAB20:    t17 = (t8 + 4);
    t18 = *((unsigned int *)t8);
    t19 = *((unsigned int *)t17);
    t20 = (t18 || t19);
    if (t20 > 0)
        goto LAB21;

LAB22:    t22 = *((unsigned int *)t8);
    t23 = (~(t22));
    t24 = *((unsigned int *)t17);
    t25 = (t23 || t24);
    if (t25 > 0)
        goto LAB23;

LAB24:    if (*((unsigned int *)t17) > 0)
        goto LAB25;

LAB26:    if (*((unsigned int *)t8) > 0)
        goto LAB27;

LAB28:    memcpy(t7, t27, 8);

LAB29:    t26 = (t0 + 2208);
    xsi_vlogvar_assign_value(t26, t7, 0, 0, 2);
    xsi_set_current_line(61, ng0);
    t2 = (t0 + 692U);
    t3 = *((char **)t2);
    memset(t8, 0, 8);
    t2 = (t3 + 4);
    t11 = *((unsigned int *)t2);
    t12 = (~(t11));
    t13 = *((unsigned int *)t3);
    t14 = (t13 & t12);
    t15 = (t14 & 1U);
    if (t15 != 0)
        goto LAB30;

LAB31:    if (*((unsigned int *)t2) != 0)
        goto LAB32;

LAB33:    t9 = (t8 + 4);
    t18 = *((unsigned int *)t8);
    t19 = *((unsigned int *)t9);
    t20 = (t18 || t19);
    if (t20 > 0)
        goto LAB34;

LAB35:    t22 = *((unsigned int *)t8);
    t23 = (~(t22));
    t24 = *((unsigned int *)t9);
    t25 = (t23 || t24);
    if (t25 > 0)
        goto LAB36;

LAB37:    if (*((unsigned int *)t9) > 0)
        goto LAB38;

LAB39:    if (*((unsigned int *)t8) > 0)
        goto LAB40;

LAB41:    memcpy(t7, t21, 8);

LAB42:    t26 = (t0 + 2116);
    xsi_vlogvar_assign_value(t26, t7, 0, 0, 1);
    goto LAB15;

LAB9:    xsi_set_current_line(63, ng0);

LAB43:    xsi_set_current_line(64, ng0);
    t3 = (t0 + 1520U);
    t4 = *((char **)t3);
    t3 = ((char*)((ng6)));
    memset(t28, 0, 8);
    t9 = (t4 + 4);
    t10 = (t3 + 4);
    t11 = *((unsigned int *)t4);
    t12 = *((unsigned int *)t3);
    t13 = (t11 ^ t12);
    t14 = *((unsigned int *)t9);
    t15 = *((unsigned int *)t10);
    t18 = (t14 ^ t15);
    t19 = (t13 | t18);
    t20 = *((unsigned int *)t9);
    t22 = *((unsigned int *)t10);
    t23 = (t20 | t22);
    t24 = (~(t23));
    t25 = (t19 & t24);
    if (t25 != 0)
        goto LAB47;

LAB44:    if (t23 != 0)
        goto LAB46;

LAB45:    *((unsigned int *)t28) = 1;

LAB47:    memset(t8, 0, 8);
    t17 = (t28 + 4);
    t29 = *((unsigned int *)t17);
    t30 = (~(t29));
    t31 = *((unsigned int *)t28);
    t32 = (t31 & t30);
    t33 = (t32 & 1U);
    if (t33 != 0)
        goto LAB48;

LAB49:    if (*((unsigned int *)t17) != 0)
        goto LAB50;

LAB51:    t26 = (t8 + 4);
    t34 = *((unsigned int *)t8);
    t35 = *((unsigned int *)t26);
    t36 = (t34 || t35);
    if (t36 > 0)
        goto LAB52;

LAB53:    t37 = *((unsigned int *)t8);
    t38 = (~(t37));
    t39 = *((unsigned int *)t26);
    t40 = (t38 || t39);
    if (t40 > 0)
        goto LAB54;

LAB55:    if (*((unsigned int *)t26) > 0)
        goto LAB56;

LAB57:    if (*((unsigned int *)t8) > 0)
        goto LAB58;

LAB59:    memcpy(t7, t42, 8);

LAB60:    t41 = (t0 + 2208);
    xsi_vlogvar_assign_value(t41, t7, 0, 0, 2);
    xsi_set_current_line(65, ng0);
    t2 = (t0 + 692U);
    t3 = *((char **)t2);
    memset(t8, 0, 8);
    t2 = (t3 + 4);
    t11 = *((unsigned int *)t2);
    t12 = (~(t11));
    t13 = *((unsigned int *)t3);
    t14 = (t13 & t12);
    t15 = (t14 & 1U);
    if (t15 != 0)
        goto LAB61;

LAB62:    if (*((unsigned int *)t2) != 0)
        goto LAB63;

LAB64:    t9 = (t8 + 4);
    t18 = *((unsigned int *)t8);
    t19 = *((unsigned int *)t9);
    t20 = (t18 || t19);
    if (t20 > 0)
        goto LAB65;

LAB66:    t22 = *((unsigned int *)t8);
    t23 = (~(t22));
    t24 = *((unsigned int *)t9);
    t25 = (t23 || t24);
    if (t25 > 0)
        goto LAB67;

LAB68:    if (*((unsigned int *)t9) > 0)
        goto LAB69;

LAB70:    if (*((unsigned int *)t8) > 0)
        goto LAB71;

LAB72:    memcpy(t7, t21, 8);

LAB73:    t26 = (t0 + 2116);
    xsi_vlogvar_assign_value(t26, t7, 0, 0, 1);
    goto LAB15;

LAB11:    xsi_set_current_line(67, ng0);

LAB74:    xsi_set_current_line(68, ng0);
    t3 = (t0 + 968U);
    t4 = *((char **)t3);
    t3 = ((char*)((ng4)));
    memset(t7, 0, 8);
    t9 = (t4 + 4);
    t10 = (t3 + 4);
    t11 = *((unsigned int *)t4);
    t12 = *((unsigned int *)t3);
    t13 = (t11 ^ t12);
    t14 = *((unsigned int *)t9);
    t15 = *((unsigned int *)t10);
    t18 = (t14 ^ t15);
    t19 = (t13 | t18);
    t20 = *((unsigned int *)t9);
    t22 = *((unsigned int *)t10);
    t23 = (t20 | t22);
    t24 = (~(t23));
    t25 = (t19 & t24);
    if (t25 != 0)
        goto LAB78;

LAB75:    if (t23 != 0)
        goto LAB77;

LAB76:    *((unsigned int *)t7) = 1;

LAB78:    t17 = (t7 + 4);
    t29 = *((unsigned int *)t17);
    t30 = (~(t29));
    t31 = *((unsigned int *)t7);
    t32 = (t31 & t30);
    t33 = (t32 != 0);
    if (t33 > 0)
        goto LAB79;

LAB80:    xsi_set_current_line(71, ng0);

LAB102:    xsi_set_current_line(72, ng0);
    t2 = (t0 + 692U);
    t3 = *((char **)t2);
    memset(t8, 0, 8);
    t2 = (t3 + 4);
    t11 = *((unsigned int *)t2);
    t12 = (~(t11));
    t13 = *((unsigned int *)t3);
    t14 = (t13 & t12);
    t15 = (t14 & 1U);
    if (t15 != 0)
        goto LAB103;

LAB104:    if (*((unsigned int *)t2) != 0)
        goto LAB105;

LAB106:    t9 = (t8 + 4);
    t18 = *((unsigned int *)t8);
    t19 = *((unsigned int *)t9);
    t20 = (t18 || t19);
    if (t20 > 0)
        goto LAB107;

LAB108:    t22 = *((unsigned int *)t8);
    t23 = (~(t22));
    t24 = *((unsigned int *)t9);
    t25 = (t23 || t24);
    if (t25 > 0)
        goto LAB109;

LAB110:    if (*((unsigned int *)t9) > 0)
        goto LAB111;

LAB112:    if (*((unsigned int *)t8) > 0)
        goto LAB113;

LAB114:    memcpy(t7, t21, 8);

LAB115:    t26 = (t0 + 2116);
    xsi_vlogvar_assign_value(t26, t7, 0, 0, 1);
    xsi_set_current_line(73, ng0);
    t2 = ((char*)((ng7)));
    t3 = (t0 + 2208);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 2);

LAB81:    goto LAB15;

LAB17:    *((unsigned int *)t8) = 1;
    goto LAB20;

LAB19:    t16 = (t8 + 4);
    *((unsigned int *)t8) = 1;
    *((unsigned int *)t16) = 1;
    goto LAB20;

LAB21:    t21 = ((char*)((ng4)));
    goto LAB22;

LAB23:    t26 = (t0 + 1612U);
    t27 = *((char **)t26);
    goto LAB24;

LAB25:    xsi_vlog_unsigned_bit_combine(t7, 2, t21, 2, t27, 2);
    goto LAB29;

LAB27:    memcpy(t7, t21, 8);
    goto LAB29;

LAB30:    *((unsigned int *)t8) = 1;
    goto LAB33;

LAB32:    t4 = (t8 + 4);
    *((unsigned int *)t8) = 1;
    *((unsigned int *)t4) = 1;
    goto LAB33;

LAB34:    t10 = ((char*)((ng5)));
    goto LAB35;

LAB36:    t16 = (t0 + 2116);
    t17 = (t16 + 36U);
    t21 = *((char **)t17);
    goto LAB37;

LAB38:    xsi_vlog_unsigned_bit_combine(t7, 1, t10, 1, t21, 1);
    goto LAB42;

LAB40:    memcpy(t7, t10, 8);
    goto LAB42;

LAB46:    t16 = (t28 + 4);
    *((unsigned int *)t28) = 1;
    *((unsigned int *)t16) = 1;
    goto LAB47;

LAB48:    *((unsigned int *)t8) = 1;
    goto LAB51;

LAB50:    t21 = (t8 + 4);
    *((unsigned int *)t8) = 1;
    *((unsigned int *)t21) = 1;
    goto LAB51;

LAB52:    t27 = ((char*)((ng7)));
    goto LAB53;

LAB54:    t41 = (t0 + 1612U);
    t42 = *((char **)t41);
    goto LAB55;

LAB56:    xsi_vlog_unsigned_bit_combine(t7, 2, t27, 2, t42, 2);
    goto LAB60;

LAB58:    memcpy(t7, t27, 8);
    goto LAB60;

LAB61:    *((unsigned int *)t8) = 1;
    goto LAB64;

LAB63:    t4 = (t8 + 4);
    *((unsigned int *)t8) = 1;
    *((unsigned int *)t4) = 1;
    goto LAB64;

LAB65:    t10 = ((char*)((ng5)));
    goto LAB66;

LAB67:    t16 = (t0 + 2116);
    t17 = (t16 + 36U);
    t21 = *((char **)t17);
    goto LAB68;

LAB69:    xsi_vlog_unsigned_bit_combine(t7, 1, t10, 1, t21, 1);
    goto LAB73;

LAB71:    memcpy(t7, t10, 8);
    goto LAB73;

LAB77:    t16 = (t7 + 4);
    *((unsigned int *)t7) = 1;
    *((unsigned int *)t16) = 1;
    goto LAB78;

LAB79:    xsi_set_current_line(68, ng0);

LAB82:    xsi_set_current_line(69, ng0);
    t21 = (t0 + 692U);
    t26 = *((char **)t21);
    memset(t28, 0, 8);
    t21 = (t26 + 4);
    t34 = *((unsigned int *)t21);
    t35 = (~(t34));
    t36 = *((unsigned int *)t26);
    t37 = (t36 & t35);
    t38 = (t37 & 1U);
    if (t38 != 0)
        goto LAB83;

LAB84:    if (*((unsigned int *)t21) != 0)
        goto LAB85;

LAB86:    t41 = (t28 + 4);
    t39 = *((unsigned int *)t28);
    t40 = *((unsigned int *)t41);
    t43 = (t39 || t40);
    if (t43 > 0)
        goto LAB87;

LAB88:    t44 = *((unsigned int *)t28);
    t45 = (~(t44));
    t46 = *((unsigned int *)t41);
    t47 = (t45 || t46);
    if (t47 > 0)
        goto LAB89;

LAB90:    if (*((unsigned int *)t41) > 0)
        goto LAB91;

LAB92:    if (*((unsigned int *)t28) > 0)
        goto LAB93;

LAB94:    memcpy(t8, t48, 8);

LAB95:    t69 = (t0 + 2116);
    xsi_vlogvar_assign_value(t69, t8, 0, 0, 1);
    xsi_set_current_line(70, ng0);
    t2 = ((char*)((ng5)));
    t3 = (t0 + 2208);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 2);
    goto LAB81;

LAB83:    *((unsigned int *)t28) = 1;
    goto LAB86;

LAB85:    t27 = (t28 + 4);
    *((unsigned int *)t28) = 1;
    *((unsigned int *)t27) = 1;
    goto LAB86;

LAB87:    t42 = ((char*)((ng5)));
    goto LAB88;

LAB89:    t49 = (t0 + 2116);
    t50 = (t49 + 36U);
    t51 = *((char **)t50);
    memset(t48, 0, 8);
    t52 = (t51 + 4);
    t53 = *((unsigned int *)t52);
    t54 = (~(t53));
    t55 = *((unsigned int *)t51);
    t56 = (t55 & t54);
    t57 = (t56 & 1U);
    if (t57 != 0)
        goto LAB99;

LAB97:    if (*((unsigned int *)t52) == 0)
        goto LAB96;

LAB98:    t58 = (t48 + 4);
    *((unsigned int *)t48) = 1;
    *((unsigned int *)t58) = 1;

LAB99:    t59 = (t48 + 4);
    t60 = (t51 + 4);
    t61 = *((unsigned int *)t51);
    t62 = (~(t61));
    *((unsigned int *)t48) = t62;
    *((unsigned int *)t59) = 0;
    if (*((unsigned int *)t60) != 0)
        goto LAB101;

LAB100:    t67 = *((unsigned int *)t48);
    *((unsigned int *)t48) = (t67 & 1U);
    t68 = *((unsigned int *)t59);
    *((unsigned int *)t59) = (t68 & 1U);
    goto LAB90;

LAB91:    xsi_vlog_unsigned_bit_combine(t8, 1, t42, 1, t48, 1);
    goto LAB95;

LAB93:    memcpy(t8, t42, 8);
    goto LAB95;

LAB96:    *((unsigned int *)t48) = 1;
    goto LAB99;

LAB101:    t63 = *((unsigned int *)t48);
    t64 = *((unsigned int *)t60);
    *((unsigned int *)t48) = (t63 | t64);
    t65 = *((unsigned int *)t59);
    t66 = *((unsigned int *)t60);
    *((unsigned int *)t59) = (t65 | t66);
    goto LAB100;

LAB103:    *((unsigned int *)t8) = 1;
    goto LAB106;

LAB105:    t4 = (t8 + 4);
    *((unsigned int *)t8) = 1;
    *((unsigned int *)t4) = 1;
    goto LAB106;

LAB107:    t10 = ((char*)((ng5)));
    goto LAB108;

LAB109:    t16 = (t0 + 2116);
    t17 = (t16 + 36U);
    t21 = *((char **)t17);
    goto LAB110;

LAB111:    xsi_vlog_unsigned_bit_combine(t7, 1, t10, 1, t21, 1);
    goto LAB115;

LAB113:    memcpy(t7, t10, 8);
    goto LAB115;

LAB117:    *((unsigned int *)t8) = 1;
    goto LAB120;

LAB119:    t4 = (t8 + 4);
    *((unsigned int *)t8) = 1;
    *((unsigned int *)t4) = 1;
    goto LAB120;

LAB121:    t10 = ((char*)((ng5)));
    goto LAB122;

LAB123:    t16 = (t0 + 2116);
    t17 = (t16 + 36U);
    t21 = *((char **)t17);
    goto LAB124;

LAB125:    xsi_vlog_unsigned_bit_combine(t7, 1, t10, 1, t21, 1);
    goto LAB129;

LAB127:    memcpy(t7, t10, 8);
    goto LAB129;

}

static void Cont_85_3(char *t0)
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

LAB0:    t1 = (t0 + 3164U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(85, ng0);
    t2 = (t0 + 2116);
    t3 = (t2 + 36U);
    t4 = *((char **)t3);
    t5 = (t0 + 4108);
    t6 = (t5 + 32U);
    t7 = *((char **)t6);
    t8 = (t7 + 40U);
    t9 = *((char **)t8);
    memset(t9, 0, 8);
    t10 = 1U;
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
    xsi_driver_vfirst_trans(t5, 0, 0);
    t18 = (t0 + 3960);
    *((int *)t18) = 1;

LAB1:    return;
}

static void Cont_90_4(char *t0)
{
    char t3[8];
    char t5[8];
    char *t1;
    char *t2;
    char *t4;
    char *t6;
    unsigned int t7;
    unsigned int t8;
    unsigned int t9;
    unsigned int t10;
    unsigned int t11;
    char *t12;
    char *t13;
    char *t14;
    unsigned int t15;
    unsigned int t16;
    unsigned int t17;
    unsigned int t18;
    unsigned int t19;
    unsigned int t20;
    unsigned int t21;
    unsigned int t22;
    char *t23;
    char *t24;
    char *t25;
    char *t26;
    char *t27;
    unsigned int t28;
    unsigned int t29;
    char *t30;
    unsigned int t31;
    unsigned int t32;
    char *t33;
    unsigned int t34;
    unsigned int t35;
    char *t36;

LAB0:    t1 = (t0 + 3308U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(90, ng0);
    t2 = (t0 + 1520U);
    t4 = *((char **)t2);
    t2 = (t0 + 1336U);
    t6 = *((char **)t2);
    memset(t5, 0, 8);
    t2 = (t6 + 4);
    t7 = *((unsigned int *)t2);
    t8 = (~(t7));
    t9 = *((unsigned int *)t6);
    t10 = (t9 & t8);
    t11 = (t10 & 1U);
    if (t11 != 0)
        goto LAB7;

LAB5:    if (*((unsigned int *)t2) == 0)
        goto LAB4;

LAB6:    t12 = (t5 + 4);
    *((unsigned int *)t5) = 1;
    *((unsigned int *)t12) = 1;

LAB7:    t13 = (t5 + 4);
    t14 = (t6 + 4);
    t15 = *((unsigned int *)t6);
    t16 = (~(t15));
    *((unsigned int *)t5) = t16;
    *((unsigned int *)t13) = 0;
    if (*((unsigned int *)t14) != 0)
        goto LAB9;

LAB8:    t21 = *((unsigned int *)t5);
    *((unsigned int *)t5) = (t21 & 1U);
    t22 = *((unsigned int *)t13);
    *((unsigned int *)t13) = (t22 & 1U);
    xsi_vlogtype_concat(t3, 9, 9, 2U, t5, 1, t4, 8);
    t23 = (t0 + 4144);
    t24 = (t23 + 32U);
    t25 = *((char **)t24);
    t26 = (t25 + 40U);
    t27 = *((char **)t26);
    memset(t27, 0, 8);
    t28 = 511U;
    t29 = t28;
    t30 = (t3 + 4);
    t31 = *((unsigned int *)t3);
    t28 = (t28 & t31);
    t32 = *((unsigned int *)t30);
    t29 = (t29 & t32);
    t33 = (t27 + 4);
    t34 = *((unsigned int *)t27);
    *((unsigned int *)t27) = (t34 | t28);
    t35 = *((unsigned int *)t33);
    *((unsigned int *)t33) = (t35 | t29);
    xsi_driver_vfirst_trans(t23, 0, 8);
    t36 = (t0 + 3968);
    *((int *)t36) = 1;

LAB1:    return;
LAB4:    *((unsigned int *)t5) = 1;
    goto LAB7;

LAB9:    t17 = *((unsigned int *)t5);
    t18 = *((unsigned int *)t14);
    *((unsigned int *)t5) = (t17 | t18);
    t19 = *((unsigned int *)t13);
    t20 = *((unsigned int *)t14);
    *((unsigned int *)t13) = (t19 | t20);
    goto LAB8;

}

static void Cont_93_5(char *t0)
{
    char t3[8];
    char t4[8];
    char t6[8];
    char *t1;
    char *t2;
    char *t5;
    char *t7;
    char *t8;
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
    unsigned int t20;
    char *t21;
    char *t22;
    unsigned int t23;
    unsigned int t24;
    unsigned int t25;
    unsigned int t26;
    unsigned int t27;
    char *t28;
    char *t29;
    unsigned int t30;
    unsigned int t31;
    unsigned int t32;
    char *t33;
    unsigned int t34;
    unsigned int t35;
    unsigned int t36;
    unsigned int t37;
    char *t38;
    char *t39;
    char *t40;
    char *t41;
    char *t42;
    char *t43;
    unsigned int t44;
    unsigned int t45;
    char *t46;
    unsigned int t47;
    unsigned int t48;
    char *t49;
    unsigned int t50;
    unsigned int t51;
    char *t52;

LAB0:    t1 = (t0 + 3452U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(93, ng0);
    t2 = (t0 + 1612U);
    t5 = *((char **)t2);
    t2 = ((char*)((ng4)));
    memset(t6, 0, 8);
    t7 = (t5 + 4);
    t8 = (t2 + 4);
    t9 = *((unsigned int *)t5);
    t10 = *((unsigned int *)t2);
    t11 = (t9 ^ t10);
    t12 = *((unsigned int *)t7);
    t13 = *((unsigned int *)t8);
    t14 = (t12 ^ t13);
    t15 = (t11 | t14);
    t16 = *((unsigned int *)t7);
    t17 = *((unsigned int *)t8);
    t18 = (t16 | t17);
    t19 = (~(t18));
    t20 = (t15 & t19);
    if (t20 != 0)
        goto LAB7;

LAB4:    if (t18 != 0)
        goto LAB6;

LAB5:    *((unsigned int *)t6) = 1;

LAB7:    memset(t4, 0, 8);
    t22 = (t6 + 4);
    t23 = *((unsigned int *)t22);
    t24 = (~(t23));
    t25 = *((unsigned int *)t6);
    t26 = (t25 & t24);
    t27 = (t26 & 1U);
    if (t27 != 0)
        goto LAB8;

LAB9:    if (*((unsigned int *)t22) != 0)
        goto LAB10;

LAB11:    t29 = (t4 + 4);
    t30 = *((unsigned int *)t4);
    t31 = *((unsigned int *)t29);
    t32 = (t30 || t31);
    if (t32 > 0)
        goto LAB12;

LAB13:    t34 = *((unsigned int *)t4);
    t35 = (~(t34));
    t36 = *((unsigned int *)t29);
    t37 = (t35 || t36);
    if (t37 > 0)
        goto LAB14;

LAB15:    if (*((unsigned int *)t29) > 0)
        goto LAB16;

LAB17:    if (*((unsigned int *)t4) > 0)
        goto LAB18;

LAB19:    memcpy(t3, t38, 8);

LAB20:    t39 = (t0 + 4180);
    t40 = (t39 + 32U);
    t41 = *((char **)t40);
    t42 = (t41 + 40U);
    t43 = *((char **)t42);
    memset(t43, 0, 8);
    t44 = 1U;
    t45 = t44;
    t46 = (t3 + 4);
    t47 = *((unsigned int *)t3);
    t44 = (t44 & t47);
    t48 = *((unsigned int *)t46);
    t45 = (t45 & t48);
    t49 = (t43 + 4);
    t50 = *((unsigned int *)t43);
    *((unsigned int *)t43) = (t50 | t44);
    t51 = *((unsigned int *)t49);
    *((unsigned int *)t49) = (t51 | t45);
    xsi_driver_vfirst_trans(t39, 0, 0);
    t52 = (t0 + 3976);
    *((int *)t52) = 1;

LAB1:    return;
LAB6:    t21 = (t6 + 4);
    *((unsigned int *)t6) = 1;
    *((unsigned int *)t21) = 1;
    goto LAB7;

LAB8:    *((unsigned int *)t4) = 1;
    goto LAB11;

LAB10:    t28 = (t4 + 4);
    *((unsigned int *)t4) = 1;
    *((unsigned int *)t28) = 1;
    goto LAB11;

LAB12:    t33 = ((char*)((ng4)));
    goto LAB13;

LAB14:    t38 = ((char*)((ng5)));
    goto LAB15;

LAB16:    xsi_vlog_unsigned_bit_combine(t3, 1, t33, 1, t38, 1);
    goto LAB20;

LAB18:    memcpy(t3, t33, 8);
    goto LAB20;

}

static void Cont_96_6(char *t0)
{
    char t3[8];
    char t13[8];
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
    unsigned int t14;
    unsigned int t15;
    unsigned int t16;
    char *t17;
    char *t18;
    char *t19;
    unsigned int t20;
    unsigned int t21;
    unsigned int t22;
    unsigned int t23;
    unsigned int t24;
    unsigned int t25;
    unsigned int t26;
    char *t27;
    char *t28;
    char *t29;
    char *t30;
    char *t31;
    unsigned int t32;
    unsigned int t33;
    char *t34;
    unsigned int t35;
    unsigned int t36;
    char *t37;
    unsigned int t38;
    unsigned int t39;
    char *t40;

LAB0:    t1 = (t0 + 3596U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(96, ng0);
    t2 = (t0 + 876U);
    t4 = *((char **)t2);
    memset(t3, 0, 8);
    t2 = (t3 + 4);
    t5 = (t4 + 4);
    t6 = *((unsigned int *)t4);
    t7 = (t6 >> 8);
    *((unsigned int *)t3) = t7;
    t8 = *((unsigned int *)t5);
    t9 = (t8 >> 8);
    *((unsigned int *)t2) = t9;
    t10 = *((unsigned int *)t3);
    *((unsigned int *)t3) = (t10 & 255U);
    t11 = *((unsigned int *)t2);
    *((unsigned int *)t2) = (t11 & 255U);
    t12 = ((char*)((ng8)));
    t14 = *((unsigned int *)t3);
    t15 = *((unsigned int *)t12);
    t16 = (t14 ^ t15);
    *((unsigned int *)t13) = t16;
    t17 = (t3 + 4);
    t18 = (t12 + 4);
    t19 = (t13 + 4);
    t20 = *((unsigned int *)t17);
    t21 = *((unsigned int *)t18);
    t22 = (t20 | t21);
    *((unsigned int *)t19) = t22;
    t23 = *((unsigned int *)t19);
    t24 = (t23 != 0);
    if (t24 == 1)
        goto LAB4;

LAB5:
LAB6:    t27 = (t0 + 4216);
    t28 = (t27 + 32U);
    t29 = *((char **)t28);
    t30 = (t29 + 40U);
    t31 = *((char **)t30);
    memset(t31, 0, 8);
    t32 = 255U;
    t33 = t32;
    t34 = (t13 + 4);
    t35 = *((unsigned int *)t13);
    t32 = (t32 & t35);
    t36 = *((unsigned int *)t34);
    t33 = (t33 & t36);
    t37 = (t31 + 4);
    t38 = *((unsigned int *)t31);
    *((unsigned int *)t31) = (t38 | t32);
    t39 = *((unsigned int *)t37);
    *((unsigned int *)t37) = (t39 | t33);
    xsi_driver_vfirst_trans(t27, 0, 7);
    t40 = (t0 + 3984);
    *((int *)t40) = 1;

LAB1:    return;
LAB4:    t25 = *((unsigned int *)t13);
    t26 = *((unsigned int *)t19);
    *((unsigned int *)t13) = (t25 | t26);
    goto LAB6;

}

static void implSig1_execute(char *t0)
{
    char t4[8];
    char t22[8];
    char *t1;
    char *t2;
    char *t3;
    char *t5;
    char *t6;
    unsigned int t7;
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
    char *t19;
    char *t20;
    char *t21;
    unsigned int t23;
    unsigned int t24;
    unsigned int t25;
    char *t26;
    char *t27;
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
    unsigned int t42;
    unsigned int t43;
    unsigned int t44;
    int t45;
    int t46;
    unsigned int t47;
    unsigned int t48;
    unsigned int t49;
    unsigned int t50;
    unsigned int t51;
    unsigned int t52;
    char *t53;
    char *t54;
    char *t55;
    char *t56;
    char *t57;
    unsigned int t58;
    unsigned int t59;
    char *t60;
    unsigned int t61;
    unsigned int t62;
    char *t63;
    unsigned int t64;
    unsigned int t65;
    char *t66;

LAB0:    t1 = (t0 + 3740U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    t2 = (t0 + 1612U);
    t3 = *((char **)t2);
    t2 = ((char*)((ng4)));
    memset(t4, 0, 8);
    t5 = (t3 + 4);
    t6 = (t2 + 4);
    t7 = *((unsigned int *)t3);
    t8 = *((unsigned int *)t2);
    t9 = (t7 ^ t8);
    t10 = *((unsigned int *)t5);
    t11 = *((unsigned int *)t6);
    t12 = (t10 ^ t11);
    t13 = (t9 | t12);
    t14 = *((unsigned int *)t5);
    t15 = *((unsigned int *)t6);
    t16 = (t14 | t15);
    t17 = (~(t16));
    t18 = (t13 & t17);
    if (t18 != 0)
        goto LAB7;

LAB4:    if (t16 != 0)
        goto LAB6;

LAB5:    *((unsigned int *)t4) = 1;

LAB7:    t20 = (t0 + 784U);
    t21 = *((char **)t20);
    t23 = *((unsigned int *)t4);
    t24 = *((unsigned int *)t21);
    t25 = (t23 & t24);
    *((unsigned int *)t22) = t25;
    t20 = (t4 + 4);
    t26 = (t21 + 4);
    t27 = (t22 + 4);
    t28 = *((unsigned int *)t20);
    t29 = *((unsigned int *)t26);
    t30 = (t28 | t29);
    *((unsigned int *)t27) = t30;
    t31 = *((unsigned int *)t27);
    t32 = (t31 != 0);
    if (t32 == 1)
        goto LAB8;

LAB9:
LAB10:    t53 = (t0 + 4252);
    t54 = (t53 + 32U);
    t55 = *((char **)t54);
    t56 = (t55 + 40U);
    t57 = *((char **)t56);
    memset(t57, 0, 8);
    t58 = 1U;
    t59 = t58;
    t60 = (t22 + 4);
    t61 = *((unsigned int *)t22);
    t58 = (t58 & t61);
    t62 = *((unsigned int *)t60);
    t59 = (t59 & t62);
    t63 = (t57 + 4);
    t64 = *((unsigned int *)t57);
    *((unsigned int *)t57) = (t64 | t58);
    t65 = *((unsigned int *)t63);
    *((unsigned int *)t63) = (t65 | t59);
    xsi_driver_vfirst_trans(t53, 0, 0);
    t66 = (t0 + 3992);
    *((int *)t66) = 1;

LAB1:    return;
LAB6:    t19 = (t4 + 4);
    *((unsigned int *)t4) = 1;
    *((unsigned int *)t19) = 1;
    goto LAB7;

LAB8:    t33 = *((unsigned int *)t22);
    t34 = *((unsigned int *)t27);
    *((unsigned int *)t22) = (t33 | t34);
    t35 = (t4 + 4);
    t36 = (t21 + 4);
    t37 = *((unsigned int *)t4);
    t38 = (~(t37));
    t39 = *((unsigned int *)t35);
    t40 = (~(t39));
    t41 = *((unsigned int *)t21);
    t42 = (~(t41));
    t43 = *((unsigned int *)t36);
    t44 = (~(t43));
    t45 = (t38 & t40);
    t46 = (t42 & t44);
    t47 = (~(t45));
    t48 = (~(t46));
    t49 = *((unsigned int *)t27);
    *((unsigned int *)t27) = (t49 & t47);
    t50 = *((unsigned int *)t27);
    *((unsigned int *)t27) = (t50 & t48);
    t51 = *((unsigned int *)t22);
    *((unsigned int *)t22) = (t51 & t47);
    t52 = *((unsigned int *)t22);
    *((unsigned int *)t22) = (t52 & t48);
    goto LAB10;

}


extern void work_m_00000000003870887813_3015034311_init()
{
	static char *pe[] = {(void *)NetDecl_52_0,(void *)Cont_55_1,(void *)Always_57_2,(void *)Cont_85_3,(void *)Cont_90_4,(void *)Cont_93_5,(void *)Cont_96_6,(void *)implSig1_execute};
	xsi_register_didat("work_m_00000000003870887813_3015034311", "isim/wave_capture_tb_isim_beh.exe.sim/work/m_00000000003870887813_3015034311.didat");
	xsi_register_executes(pe);
}
