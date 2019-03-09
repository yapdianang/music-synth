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

#include "xsi.h"

struct XSI_INFO xsi_info;



int main(int argc, char **argv)
{
    xsi_init_design(argc, argv);
    xsi_register_info(&xsi_info);

    xsi_register_min_prec_unit(-12);
    work_m_00000000002129617870_1865307366_init();
    work_m_00000000003349729749_0923144499_init();
    work_m_00000000003349729749_1311271543_init();
    work_m_00000000003870887813_3015034311_init();
    work_m_00000000000036348317_2571492256_init();
    work_m_00000000002129617870_0384722129_init();
    work_m_00000000002061073186_3453606180_init();
    work_m_00000000004152537053_0118774540_init();
    work_m_00000000004134447467_2073120511_init();


    xsi_register_tops("work_m_00000000004152537053_0118774540");
    xsi_register_tops("work_m_00000000004134447467_2073120511");


    return xsi_run_simulation(argc, argv);

}
