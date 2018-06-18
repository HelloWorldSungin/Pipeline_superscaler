onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /mips_cpu_tb/superscaler_mips/memory_state/mem_ctrl_e_0
add wave -noupdate /mips_cpu_tb/superscaler_mips/memory_state/mem_ctrl_e_1
add wave -noupdate -expand -group input/output /mips_cpu_tb/clk
add wave -noupdate -expand -group input/output /mips_cpu_tb/reset
add wave -noupdate -expand -group input/output -radix decimal /mips_cpu_tb/aluout_m_0
add wave -noupdate -expand -group input/output -radix decimal /mips_cpu_tb/aluout_m_1
add wave -noupdate -expand -group input/output -radix unsigned /mips_cpu_tb/cycle_num
add wave -noupdate -expand -group input/output -radix unsigned /mips_cpu_tb/pc_f_0
add wave -noupdate -expand -group input/output -radix unsigned /mips_cpu_tb/pc_f_1
add wave -noupdate -expand -group input/output -radix decimal /mips_cpu_tb/readdata_m_0
add wave -noupdate -expand -group input/output -radix decimal /mips_cpu_tb/readdata_m_1
add wave -noupdate -expand -group input/output -radix decimal /mips_cpu_tb/rfout1_e_0
add wave -noupdate -expand -group input/output -radix decimal /mips_cpu_tb/rfout1_e_1
add wave -noupdate -expand -group input/output -radix decimal /mips_cpu_tb/rfout2_e_0
add wave -noupdate -expand -group input/output -radix decimal /mips_cpu_tb/rfout2_e_1
add wave -noupdate -group if_pc_register_0 /mips_cpu_tb/superscaler_mips/if_pc_register_0/reset
add wave -noupdate -group if_pc_register_0 /mips_cpu_tb/superscaler_mips/if_pc_register_0/enable
add wave -noupdate -group if_pc_register_0 -radix unsigned /mips_cpu_tb/superscaler_mips/if_pc_register_0/d
add wave -noupdate -group if_pc_register_0 -radix unsigned /mips_cpu_tb/superscaler_mips/if_pc_register_0/q
add wave -noupdate -group if_pc_register_1 /mips_cpu_tb/superscaler_mips/if_pc_register_1/reset
add wave -noupdate -group if_pc_register_1 /mips_cpu_tb/superscaler_mips/if_pc_register_1/enable
add wave -noupdate -group if_pc_register_1 -radix unsigned /mips_cpu_tb/superscaler_mips/if_pc_register_1/d
add wave -noupdate -group if_pc_register_1 -radix unsigned /mips_cpu_tb/superscaler_mips/if_pc_register_1/q
add wave -noupdate -divider fetch_state
add wave -noupdate -divider IF_0
add wave -noupdate -group fetch_0 -radix hexadecimal /mips_cpu_tb/superscaler_mips/fetch_state/instr_f_0
add wave -noupdate -group fetch_0 -radix unsigned /mips_cpu_tb/superscaler_mips/fetch_state/pc_f_0
add wave -noupdate -group fetch_0 -radix unsigned /mips_cpu_tb/superscaler_mips/fetch_state/pc_jump_d_0
add wave -noupdate -group fetch_0 -radix unsigned /mips_cpu_tb/superscaler_mips/fetch_state/pc_plus_8_f_0
add wave -noupdate -group fetch_0 -radix unsigned /mips_cpu_tb/superscaler_mips/fetch_state/pc_predict_d_0
add wave -noupdate -group fetch_0 -radix unsigned /mips_cpu_tb/superscaler_mips/fetch_state/pcnext_0
add wave -noupdate -group fetch_0 -expand /mips_cpu_tb/superscaler_mips/fetch_state/pcsrc_d_0
add wave -noupdate -group if_id_reg_0 /mips_cpu_tb/superscaler_mips/if_id_reg_0/clr
add wave -noupdate -group if_id_reg_0 /mips_cpu_tb/superscaler_mips/if_id_reg_0/enable
add wave -noupdate -group if_id_reg_0 -radix hexadecimal /mips_cpu_tb/superscaler_mips/if_id_reg_0/instr_f
add wave -noupdate -group if_id_reg_0 -radix hexadecimal /mips_cpu_tb/superscaler_mips/if_id_reg_0/instr_d
add wave -noupdate -group if_id_reg_0 -radix unsigned /mips_cpu_tb/superscaler_mips/if_id_reg_0/pc_f
add wave -noupdate -group if_id_reg_0 -radix unsigned /mips_cpu_tb/superscaler_mips/if_id_reg_0/pc_d
add wave -noupdate -group if_id_reg_0 -radix unsigned /mips_cpu_tb/superscaler_mips/if_id_reg_0/pc_plus_8_f
add wave -noupdate -group if_id_reg_0 -radix unsigned /mips_cpu_tb/superscaler_mips/if_id_reg_0/pc_plus_8_d
add wave -noupdate -divider IF_1
add wave -noupdate -group fetch_1 -radix hexadecimal /mips_cpu_tb/superscaler_mips/fetch_state/instr_f_1
add wave -noupdate -group fetch_1 -radix unsigned /mips_cpu_tb/superscaler_mips/fetch_state/pc_f_1
add wave -noupdate -group fetch_1 -radix unsigned /mips_cpu_tb/superscaler_mips/fetch_state/pc_jump_d_1
add wave -noupdate -group fetch_1 -radix unsigned /mips_cpu_tb/superscaler_mips/fetch_state/pc_plus_8_f_1
add wave -noupdate -group fetch_1 -radix unsigned /mips_cpu_tb/superscaler_mips/fetch_state/pc_predict_d_1
add wave -noupdate -group fetch_1 -radix unsigned /mips_cpu_tb/superscaler_mips/fetch_state/pcnext_1
add wave -noupdate -group fetch_1 -expand /mips_cpu_tb/superscaler_mips/fetch_state/pcsrc_d_1
add wave -noupdate -group if_id_reg_1 /mips_cpu_tb/superscaler_mips/if_id_reg_1/clr
add wave -noupdate -group if_id_reg_1 /mips_cpu_tb/superscaler_mips/if_id_reg_1/enable
add wave -noupdate -group if_id_reg_1 -radix hexadecimal /mips_cpu_tb/superscaler_mips/if_id_reg_1/instr_f
add wave -noupdate -group if_id_reg_1 -radix hexadecimal /mips_cpu_tb/superscaler_mips/if_id_reg_1/instr_d
add wave -noupdate -group if_id_reg_1 -radix unsigned /mips_cpu_tb/superscaler_mips/if_id_reg_1/pc_f
add wave -noupdate -group if_id_reg_1 -radix unsigned /mips_cpu_tb/superscaler_mips/if_id_reg_1/pc_d
add wave -noupdate -group if_id_reg_1 -radix unsigned /mips_cpu_tb/superscaler_mips/if_id_reg_1/pc_plus_8_f
add wave -noupdate -group if_id_reg_1 -radix unsigned /mips_cpu_tb/superscaler_mips/if_id_reg_1/pc_plus_8_d
add wave -noupdate -divider decode_state
add wave -noupdate -divider ID_0
add wave -noupdate -group decode_rf -radix decimal -childformat {{{/mips_cpu_tb/superscaler_mips/decode_state/reg_file/regs[0]} -radix decimal} {{/mips_cpu_tb/superscaler_mips/decode_state/reg_file/regs[1]} -radix decimal} {{/mips_cpu_tb/superscaler_mips/decode_state/reg_file/regs[2]} -radix decimal} {{/mips_cpu_tb/superscaler_mips/decode_state/reg_file/regs[3]} -radix decimal} {{/mips_cpu_tb/superscaler_mips/decode_state/reg_file/regs[4]} -radix decimal} {{/mips_cpu_tb/superscaler_mips/decode_state/reg_file/regs[5]} -radix decimal} {{/mips_cpu_tb/superscaler_mips/decode_state/reg_file/regs[6]} -radix decimal} {{/mips_cpu_tb/superscaler_mips/decode_state/reg_file/regs[7]} -radix decimal} {{/mips_cpu_tb/superscaler_mips/decode_state/reg_file/regs[8]} -radix decimal} {{/mips_cpu_tb/superscaler_mips/decode_state/reg_file/regs[9]} -radix decimal} {{/mips_cpu_tb/superscaler_mips/decode_state/reg_file/regs[10]} -radix decimal} {{/mips_cpu_tb/superscaler_mips/decode_state/reg_file/regs[11]} -radix decimal} {{/mips_cpu_tb/superscaler_mips/decode_state/reg_file/regs[12]} -radix decimal} {{/mips_cpu_tb/superscaler_mips/decode_state/reg_file/regs[13]} -radix decimal} {{/mips_cpu_tb/superscaler_mips/decode_state/reg_file/regs[14]} -radix decimal} {{/mips_cpu_tb/superscaler_mips/decode_state/reg_file/regs[15]} -radix decimal} {{/mips_cpu_tb/superscaler_mips/decode_state/reg_file/regs[16]} -radix decimal} {{/mips_cpu_tb/superscaler_mips/decode_state/reg_file/regs[17]} -radix decimal} {{/mips_cpu_tb/superscaler_mips/decode_state/reg_file/regs[18]} -radix decimal} {{/mips_cpu_tb/superscaler_mips/decode_state/reg_file/regs[19]} -radix decimal} {{/mips_cpu_tb/superscaler_mips/decode_state/reg_file/regs[20]} -radix decimal} {{/mips_cpu_tb/superscaler_mips/decode_state/reg_file/regs[21]} -radix decimal} {{/mips_cpu_tb/superscaler_mips/decode_state/reg_file/regs[22]} -radix decimal} {{/mips_cpu_tb/superscaler_mips/decode_state/reg_file/regs[23]} -radix decimal} {{/mips_cpu_tb/superscaler_mips/decode_state/reg_file/regs[24]} -radix decimal} {{/mips_cpu_tb/superscaler_mips/decode_state/reg_file/regs[25]} -radix decimal} {{/mips_cpu_tb/superscaler_mips/decode_state/reg_file/regs[26]} -radix decimal} {{/mips_cpu_tb/superscaler_mips/decode_state/reg_file/regs[27]} -radix decimal} {{/mips_cpu_tb/superscaler_mips/decode_state/reg_file/regs[28]} -radix decimal} {{/mips_cpu_tb/superscaler_mips/decode_state/reg_file/regs[29]} -radix decimal} {{/mips_cpu_tb/superscaler_mips/decode_state/reg_file/regs[30]} -radix decimal} {{/mips_cpu_tb/superscaler_mips/decode_state/reg_file/regs[31]} -radix decimal}} -expand -subitemconfig {{/mips_cpu_tb/superscaler_mips/decode_state/reg_file/regs[0]} {-height 26 -radix decimal} {/mips_cpu_tb/superscaler_mips/decode_state/reg_file/regs[1]} {-height 26 -radix decimal} {/mips_cpu_tb/superscaler_mips/decode_state/reg_file/regs[2]} {-height 26 -radix decimal} {/mips_cpu_tb/superscaler_mips/decode_state/reg_file/regs[3]} {-height 26 -radix decimal} {/mips_cpu_tb/superscaler_mips/decode_state/reg_file/regs[4]} {-height 26 -radix decimal} {/mips_cpu_tb/superscaler_mips/decode_state/reg_file/regs[5]} {-height 26 -radix decimal} {/mips_cpu_tb/superscaler_mips/decode_state/reg_file/regs[6]} {-height 26 -radix decimal} {/mips_cpu_tb/superscaler_mips/decode_state/reg_file/regs[7]} {-height 26 -radix decimal} {/mips_cpu_tb/superscaler_mips/decode_state/reg_file/regs[8]} {-height 26 -radix decimal} {/mips_cpu_tb/superscaler_mips/decode_state/reg_file/regs[9]} {-height 26 -radix decimal} {/mips_cpu_tb/superscaler_mips/decode_state/reg_file/regs[10]} {-height 26 -radix decimal} {/mips_cpu_tb/superscaler_mips/decode_state/reg_file/regs[11]} {-height 26 -radix decimal} {/mips_cpu_tb/superscaler_mips/decode_state/reg_file/regs[12]} {-height 26 -radix decimal} {/mips_cpu_tb/superscaler_mips/decode_state/reg_file/regs[13]} {-height 26 -radix decimal} {/mips_cpu_tb/superscaler_mips/decode_state/reg_file/regs[14]} {-height 26 -radix decimal} {/mips_cpu_tb/superscaler_mips/decode_state/reg_file/regs[15]} {-height 26 -radix decimal} {/mips_cpu_tb/superscaler_mips/decode_state/reg_file/regs[16]} {-height 26 -radix decimal} {/mips_cpu_tb/superscaler_mips/decode_state/reg_file/regs[17]} {-height 26 -radix decimal} {/mips_cpu_tb/superscaler_mips/decode_state/reg_file/regs[18]} {-height 26 -radix decimal} {/mips_cpu_tb/superscaler_mips/decode_state/reg_file/regs[19]} {-height 26 -radix decimal} {/mips_cpu_tb/superscaler_mips/decode_state/reg_file/regs[20]} {-height 26 -radix decimal} {/mips_cpu_tb/superscaler_mips/decode_state/reg_file/regs[21]} {-height 26 -radix decimal} {/mips_cpu_tb/superscaler_mips/decode_state/reg_file/regs[22]} {-height 26 -radix decimal} {/mips_cpu_tb/superscaler_mips/decode_state/reg_file/regs[23]} {-height 26 -radix decimal} {/mips_cpu_tb/superscaler_mips/decode_state/reg_file/regs[24]} {-height 26 -radix decimal} {/mips_cpu_tb/superscaler_mips/decode_state/reg_file/regs[25]} {-height 26 -radix decimal} {/mips_cpu_tb/superscaler_mips/decode_state/reg_file/regs[26]} {-height 26 -radix decimal} {/mips_cpu_tb/superscaler_mips/decode_state/reg_file/regs[27]} {-height 26 -radix decimal} {/mips_cpu_tb/superscaler_mips/decode_state/reg_file/regs[28]} {-height 26 -radix decimal} {/mips_cpu_tb/superscaler_mips/decode_state/reg_file/regs[29]} {-height 26 -radix decimal} {/mips_cpu_tb/superscaler_mips/decode_state/reg_file/regs[30]} {-height 26 -radix decimal} {/mips_cpu_tb/superscaler_mips/decode_state/reg_file/regs[31]} {-height 26 -radix decimal}} /mips_cpu_tb/superscaler_mips/decode_state/reg_file/regs
add wave -noupdate -group decode_rf -label regWrite_w_0(wr_en_a) /mips_cpu_tb/superscaler_mips/decode_state/regWrite_w_0
add wave -noupdate -group decode_rf -label result_w_0(wr_data_a) -radix decimal /mips_cpu_tb/superscaler_mips/decode_state/result_w_0
add wave -noupdate -group decode_rf -label rfread1_d_0(rd_data_a0) -radix decimal /mips_cpu_tb/superscaler_mips/decode_state/rfread1_d_0
add wave -noupdate -group decode_rf -label rfread2_d_0(rd_data_a1) -radix decimal /mips_cpu_tb/superscaler_mips/decode_state/rfread2_d_0
add wave -noupdate -group decode_rf -label rs_d_0(rd_addr_a0) -radix unsigned /mips_cpu_tb/superscaler_mips/decode_state/rs_d_0
add wave -noupdate -group decode_rf -label rt_d_0(ed_addr_a1) -radix unsigned /mips_cpu_tb/superscaler_mips/decode_state/rt_d_0
add wave -noupdate -group decode_rf -label writeReg_w_0(wr_addr_a) -radix unsigned /mips_cpu_tb/superscaler_mips/decode_state/writeReg_w_0
add wave -noupdate -group decode_rf -label regWrite_w_1(wr_en_b) /mips_cpu_tb/superscaler_mips/decode_state/regWrite_w_1
add wave -noupdate -group decode_rf -label result_w_1(wr_data_b) -radix decimal /mips_cpu_tb/superscaler_mips/decode_state/result_w_1
add wave -noupdate -group decode_rf -label rfread1_d_1(rd_data_b0) -radix decimal /mips_cpu_tb/superscaler_mips/decode_state/rfread1_d_1
add wave -noupdate -group decode_rf -label rfread2_d_1(rd_data_b1) -radix decimal /mips_cpu_tb/superscaler_mips/decode_state/rfread2_d_1
add wave -noupdate -group decode_rf -label rs_d_1(rd_addr_b0) -radix unsigned /mips_cpu_tb/superscaler_mips/decode_state/rs_d_1
add wave -noupdate -group decode_rf -label rt_d_1(ed_addr_b1) -radix unsigned /mips_cpu_tb/superscaler_mips/decode_state/rt_d_1
add wave -noupdate -group decode_rf -label writeReg_w_1(wr_addr_b) -radix unsigned /mips_cpu_tb/superscaler_mips/decode_state/writeReg_w_1
add wave -noupdate -group exe_ctrl_d_0 /mips_cpu_tb/superscaler_mips/decode_state/exe_ctrl_d_0
add wave -noupdate -group exe_ctrl_d_0 /mips_cpu_tb/superscaler_mips/decode_state/regdst_d_0
add wave -noupdate -group exe_ctrl_d_0 /mips_cpu_tb/superscaler_mips/decode_state/alusrc_d_0
add wave -noupdate -group exe_ctrl_d_0 /mips_cpu_tb/superscaler_mips/decode_state/aluop_d_0
add wave -noupdate -group exe_ctrl_d_0 /mips_cpu_tb/superscaler_mips/decode_state/startmult_d_0
add wave -noupdate -group exe_ctrl_d_0 /mips_cpu_tb/superscaler_mips/decode_state/multsign_d_0
add wave -noupdate -group exe_ctrl_d_0 /mips_cpu_tb/superscaler_mips/decode_state/outputbranch_d_0
add wave -noupdate -group mem_ctrl_d_0 /mips_cpu_tb/superscaler_mips/decode_state/mem_ctrl_d_0
add wave -noupdate -group mem_ctrl_d_0 /mips_cpu_tb/superscaler_mips/decode_state/memwrite_d_0
add wave -noupdate -group mem_ctrl_d_0 /mips_cpu_tb/superscaler_mips/decode_state/memread_d_0
add wave -noupdate -group mem_ctrl_d_0 /mips_cpu_tb/superscaler_mips/decode_state/outselect_d_0
add wave -noupdate -group wb_ctrl_d_0 /mips_cpu_tb/superscaler_mips/decode_state/wb_ctrl_d_0
add wave -noupdate -group wb_ctrl_d_0 /mips_cpu_tb/superscaler_mips/decode_state/regwrite_d_0
add wave -noupdate -group wb_ctrl_d_0 /mips_cpu_tb/superscaler_mips/decode_state/memtoreg_d_0
add wave -noupdate -group rfread1_mux_ID_0 /mips_cpu_tb/superscaler_mips/decode_state/forwarda_d_0
add wave -noupdate -group rfread1_mux_ID_0 -radix decimal /mips_cpu_tb/superscaler_mips/decode_state/rfread1_d_0
add wave -noupdate -group rfread1_mux_ID_0 -radix decimal /mips_cpu_tb/superscaler_mips/decode_state/execout_m_0
add wave -noupdate -group rfread1_mux_ID_0 -radix decimal /mips_cpu_tb/superscaler_mips/decode_state/execout_m_1
add wave -noupdate -group rfread1_mux_ID_0 -radix decimal /mips_cpu_tb/superscaler_mips/decode_state/rfout1_d_0
add wave -noupdate -group rfread2_mux_ID_0 /mips_cpu_tb/superscaler_mips/decode_state/forwardb_d_0
add wave -noupdate -group rfread2_mux_ID_0 -radix decimal /mips_cpu_tb/superscaler_mips/decode_state/rfread2_d_0
add wave -noupdate -group rfread2_mux_ID_0 -radix decimal /mips_cpu_tb/superscaler_mips/decode_state/execout_m_0
add wave -noupdate -group rfread2_mux_ID_0 -radix decimal /mips_cpu_tb/superscaler_mips/decode_state/execout_m_1
add wave -noupdate -group rfread2_mux_ID_0 -radix decimal /mips_cpu_tb/superscaler_mips/decode_state/rfout2_d_0
add wave -noupdate -group branch_eq_ID_0 -radix decimal /mips_cpu_tb/superscaler_mips/decode_state/rfout1_d_0
add wave -noupdate -group branch_eq_ID_0 -radix decimal /mips_cpu_tb/superscaler_mips/decode_state/rfout2_d_0
add wave -noupdate -group branch_eq_ID_0 /mips_cpu_tb/superscaler_mips/decode_state/eq_ne_d_0
add wave -noupdate -group signextend_ID_0 -radix hexadecimal /mips_cpu_tb/superscaler_mips/decode_state/instr_d_0
add wave -noupdate -group signextend_ID_0 -radix decimal /mips_cpu_tb/superscaler_mips/decode_state/signimm_d_0
add wave -noupdate -group sll2_ID_0 /mips_cpu_tb/superscaler_mips/decode_state/signimm_d_0
add wave -noupdate -group sll2_ID_0 /mips_cpu_tb/superscaler_mips/decode_state/branchoffset_d_0
add wave -noupdate -group branch_adder_ID_0 /mips_cpu_tb/superscaler_mips/decode_state/branchoffset_d_0
add wave -noupdate -group branch_adder_ID_0 /mips_cpu_tb/superscaler_mips/decode_state/pc_plus_8_d_0
add wave -noupdate -group branch_adder_ID_0 /mips_cpu_tb/superscaler_mips/decode_state/pc_branch_d_0
add wave -noupdate -group sign_zero_imm_mux_ID_0 /mips_cpu_tb/superscaler_mips/decode_state/se_ze_d_0
add wave -noupdate -group sign_zero_imm_mux_ID_0 /mips_cpu_tb/superscaler_mips/decode_state/upperimm_d_0
add wave -noupdate -group sign_zero_imm_mux_ID_0 /mips_cpu_tb/superscaler_mips/decode_state/zeroimm_d_0
add wave -noupdate -group sign_zero_imm_mux_ID_0 /mips_cpu_tb/superscaler_mips/decode_state/imm_d_0
add wave -noupdate -radix decimal /mips_cpu_tb/superscaler_mips/decode_state/pc_jump_d_0
add wave -noupdate -group id_exe_reg_0 /mips_cpu_tb/superscaler_mips/id_exe_reg_0/clr
add wave -noupdate -group id_exe_reg_0 /mips_cpu_tb/superscaler_mips/id_exe_reg_0/enable
add wave -noupdate -group id_exe_reg_0 /mips_cpu_tb/superscaler_mips/id_exe_reg_0/exe_ctrl_d
add wave -noupdate -group id_exe_reg_0 /mips_cpu_tb/superscaler_mips/id_exe_reg_0/exe_ctrl_e
add wave -noupdate -group id_exe_reg_0 -radix decimal /mips_cpu_tb/superscaler_mips/id_exe_reg_0/imm_d
add wave -noupdate -group id_exe_reg_0 -radix decimal /mips_cpu_tb/superscaler_mips/id_exe_reg_0/imm_e
add wave -noupdate -group id_exe_reg_0 /mips_cpu_tb/superscaler_mips/id_exe_reg_0/mem_ctrl_d
add wave -noupdate -group id_exe_reg_0 /mips_cpu_tb/superscaler_mips/id_exe_reg_0/mem_ctrl_e
add wave -noupdate -group id_exe_reg_0 -radix decimal /mips_cpu_tb/superscaler_mips/id_exe_reg_0/rd_d
add wave -noupdate -group id_exe_reg_0 -radix decimal /mips_cpu_tb/superscaler_mips/id_exe_reg_0/rd_e
add wave -noupdate -group id_exe_reg_0 /mips_cpu_tb/superscaler_mips/id_exe_reg_0/reset
add wave -noupdate -group id_exe_reg_0 -radix decimal /mips_cpu_tb/superscaler_mips/id_exe_reg_0/rfout1_d
add wave -noupdate -group id_exe_reg_0 -radix decimal /mips_cpu_tb/superscaler_mips/id_exe_reg_0/rfout1_e
add wave -noupdate -group id_exe_reg_0 -radix decimal /mips_cpu_tb/superscaler_mips/id_exe_reg_0/rfout2_d
add wave -noupdate -group id_exe_reg_0 -radix decimal /mips_cpu_tb/superscaler_mips/id_exe_reg_0/rfout2_e
add wave -noupdate -group id_exe_reg_0 -radix unsigned /mips_cpu_tb/superscaler_mips/id_exe_reg_0/rs_d
add wave -noupdate -group id_exe_reg_0 -radix unsigned /mips_cpu_tb/superscaler_mips/id_exe_reg_0/rs_e
add wave -noupdate -group id_exe_reg_0 -radix unsigned /mips_cpu_tb/superscaler_mips/id_exe_reg_0/rt_d
add wave -noupdate -group id_exe_reg_0 -radix unsigned /mips_cpu_tb/superscaler_mips/id_exe_reg_0/rt_e
add wave -noupdate -group id_exe_reg_0 -radix decimal /mips_cpu_tb/superscaler_mips/id_exe_reg_0/upperimm_d
add wave -noupdate -group id_exe_reg_0 -radix decimal /mips_cpu_tb/superscaler_mips/id_exe_reg_0/upperimm_e
add wave -noupdate -group id_exe_reg_0 /mips_cpu_tb/superscaler_mips/id_exe_reg_0/wb_ctrl_d
add wave -noupdate -group id_exe_reg_0 /mips_cpu_tb/superscaler_mips/id_exe_reg_0/wb_ctrl_e
add wave -noupdate -divider ID_1
add wave -noupdate -group exe_ctrl_d_1 /mips_cpu_tb/superscaler_mips/decode_state/exe_ctrl_d_1
add wave -noupdate -group exe_ctrl_d_1 /mips_cpu_tb/superscaler_mips/decode_state/regdst_d_1
add wave -noupdate -group exe_ctrl_d_1 /mips_cpu_tb/superscaler_mips/decode_state/alusrc_d_1
add wave -noupdate -group exe_ctrl_d_1 /mips_cpu_tb/superscaler_mips/decode_state/aluop_d_1
add wave -noupdate -group exe_ctrl_d_1 /mips_cpu_tb/superscaler_mips/decode_state/startmult_d_1
add wave -noupdate -group exe_ctrl_d_1 /mips_cpu_tb/superscaler_mips/decode_state/multsign_d_1
add wave -noupdate -group exe_ctrl_d_1 /mips_cpu_tb/superscaler_mips/decode_state/outputbranch_d_1
add wave -noupdate -group mem_ctrl_d_1 /mips_cpu_tb/superscaler_mips/decode_state/mem_ctrl_d_1
add wave -noupdate -group mem_ctrl_d_1 /mips_cpu_tb/superscaler_mips/decode_state/memwrite_d_1
add wave -noupdate -group mem_ctrl_d_1 /mips_cpu_tb/superscaler_mips/decode_state/memread_d_1
add wave -noupdate -group mem_ctrl_d_1 /mips_cpu_tb/superscaler_mips/decode_state/outselect_d_1
add wave -noupdate -group wb_ctrl_d_1 /mips_cpu_tb/superscaler_mips/decode_state/wb_ctrl_d_1
add wave -noupdate -group wb_ctrl_d_1 /mips_cpu_tb/superscaler_mips/decode_state/regwrite_d_1
add wave -noupdate -group wb_ctrl_d_1 /mips_cpu_tb/superscaler_mips/decode_state/memtoreg_d_1
add wave -noupdate -group rfread1_mux_ID_1 /mips_cpu_tb/superscaler_mips/decode_state/forwarda_d_1
add wave -noupdate -group rfread1_mux_ID_1 -radix decimal /mips_cpu_tb/superscaler_mips/decode_state/rfread1_d_1
add wave -noupdate -group rfread1_mux_ID_1 -radix decimal /mips_cpu_tb/superscaler_mips/decode_state/execout_m_0
add wave -noupdate -group rfread1_mux_ID_1 -radix decimal /mips_cpu_tb/superscaler_mips/decode_state/execout_m_1
add wave -noupdate -group rfread1_mux_ID_1 -radix decimal /mips_cpu_tb/superscaler_mips/decode_state/rfout1_d_1
add wave -noupdate -group rfread2_mux_ID_1 /mips_cpu_tb/superscaler_mips/decode_state/forwardb_d_1
add wave -noupdate -group rfread2_mux_ID_1 -radix decimal /mips_cpu_tb/superscaler_mips/decode_state/rfread2_d_1
add wave -noupdate -group rfread2_mux_ID_1 -radix decimal /mips_cpu_tb/superscaler_mips/decode_state/execout_m_0
add wave -noupdate -group rfread2_mux_ID_1 -radix decimal /mips_cpu_tb/superscaler_mips/decode_state/execout_m_1
add wave -noupdate -group rfread2_mux_ID_1 -radix decimal /mips_cpu_tb/superscaler_mips/decode_state/rfout2_d_1
add wave -noupdate -group branch_eq_ID_1 -radix decimal /mips_cpu_tb/superscaler_mips/decode_state/rfout1_d_1
add wave -noupdate -group branch_eq_ID_1 -radix decimal /mips_cpu_tb/superscaler_mips/decode_state/rfout2_d_1
add wave -noupdate -group branch_eq_ID_1 /mips_cpu_tb/superscaler_mips/decode_state/eq_ne_d_1
add wave -noupdate -group signextend_ID_1 -radix hexadecimal /mips_cpu_tb/superscaler_mips/decode_state/instr_d_1
add wave -noupdate -group signextend_ID_1 -radix decimal /mips_cpu_tb/superscaler_mips/decode_state/signimm_d_1
add wave -noupdate -group sll2_ID_1 -radix decimal /mips_cpu_tb/superscaler_mips/decode_state/signimm_d_1
add wave -noupdate -group sll2_ID_1 -radix decimal /mips_cpu_tb/superscaler_mips/decode_state/branchoffset_d_1
add wave -noupdate -group branch_adder_ID_1 /mips_cpu_tb/superscaler_mips/decode_state/branchoffset_d_1
add wave -noupdate -group branch_adder_ID_1 /mips_cpu_tb/superscaler_mips/decode_state/pc_plus_8_d_1
add wave -noupdate -group branch_adder_ID_1 /mips_cpu_tb/superscaler_mips/decode_state/pc_branch_d_1
add wave -noupdate -group sign_zero_imm_mux_ID_1 /mips_cpu_tb/superscaler_mips/decode_state/se_ze_d_1
add wave -noupdate -group sign_zero_imm_mux_ID_1 /mips_cpu_tb/superscaler_mips/decode_state/upperimm_d_1
add wave -noupdate -group sign_zero_imm_mux_ID_1 /mips_cpu_tb/superscaler_mips/decode_state/zeroimm_d_1
add wave -noupdate -group sign_zero_imm_mux_ID_1 /mips_cpu_tb/superscaler_mips/decode_state/imm_d_1
add wave -noupdate -radix decimal /mips_cpu_tb/superscaler_mips/decode_state/pc_jump_d_1
add wave -noupdate -expand -group id_exe_reg_1 /mips_cpu_tb/superscaler_mips/id_exe_reg_1/clr
add wave -noupdate -expand -group id_exe_reg_1 /mips_cpu_tb/superscaler_mips/id_exe_reg_1/enable
add wave -noupdate -expand -group id_exe_reg_1 /mips_cpu_tb/superscaler_mips/id_exe_reg_1/exe_ctrl_d
add wave -noupdate -expand -group id_exe_reg_1 /mips_cpu_tb/superscaler_mips/id_exe_reg_1/exe_ctrl_e
add wave -noupdate -expand -group id_exe_reg_1 /mips_cpu_tb/superscaler_mips/id_exe_reg_1/imm_d
add wave -noupdate -expand -group id_exe_reg_1 /mips_cpu_tb/superscaler_mips/id_exe_reg_1/imm_e
add wave -noupdate -expand -group id_exe_reg_1 /mips_cpu_tb/superscaler_mips/id_exe_reg_1/mem_ctrl_d
add wave -noupdate -expand -group id_exe_reg_1 /mips_cpu_tb/superscaler_mips/id_exe_reg_1/mem_ctrl_e
add wave -noupdate -expand -group id_exe_reg_1 /mips_cpu_tb/superscaler_mips/id_exe_reg_1/rd_d
add wave -noupdate -expand -group id_exe_reg_1 /mips_cpu_tb/superscaler_mips/id_exe_reg_1/rd_e
add wave -noupdate -expand -group id_exe_reg_1 /mips_cpu_tb/superscaler_mips/id_exe_reg_1/reset
add wave -noupdate -expand -group id_exe_reg_1 /mips_cpu_tb/superscaler_mips/id_exe_reg_1/rfout1_d
add wave -noupdate -expand -group id_exe_reg_1 /mips_cpu_tb/superscaler_mips/id_exe_reg_1/rfout1_e
add wave -noupdate -expand -group id_exe_reg_1 /mips_cpu_tb/superscaler_mips/id_exe_reg_1/rfout2_d
add wave -noupdate -expand -group id_exe_reg_1 /mips_cpu_tb/superscaler_mips/id_exe_reg_1/rfout2_e
add wave -noupdate -expand -group id_exe_reg_1 /mips_cpu_tb/superscaler_mips/id_exe_reg_1/rs_d
add wave -noupdate -expand -group id_exe_reg_1 /mips_cpu_tb/superscaler_mips/id_exe_reg_1/rs_e
add wave -noupdate -expand -group id_exe_reg_1 /mips_cpu_tb/superscaler_mips/id_exe_reg_1/rt_d
add wave -noupdate -expand -group id_exe_reg_1 /mips_cpu_tb/superscaler_mips/id_exe_reg_1/rt_e
add wave -noupdate -expand -group id_exe_reg_1 /mips_cpu_tb/superscaler_mips/id_exe_reg_1/upperimm_d
add wave -noupdate -expand -group id_exe_reg_1 /mips_cpu_tb/superscaler_mips/id_exe_reg_1/upperimm_e
add wave -noupdate -expand -group id_exe_reg_1 /mips_cpu_tb/superscaler_mips/id_exe_reg_1/wb_ctrl_d
add wave -noupdate -expand -group id_exe_reg_1 /mips_cpu_tb/superscaler_mips/id_exe_reg_1/wb_ctrl_e
add wave -noupdate -divider execute_state
add wave -noupdate -divider EXE_0
add wave -noupdate -group exe_ctrl_e_0 /mips_cpu_tb/superscaler_mips/execute_state/exe_ctrl_e_0
add wave -noupdate -group exe_ctrl_e_0 /mips_cpu_tb/superscaler_mips/execute_state/regdst_e_0
add wave -noupdate -group exe_ctrl_e_0 /mips_cpu_tb/superscaler_mips/execute_state/alusrc_e_0
add wave -noupdate -group exe_ctrl_e_0 /mips_cpu_tb/superscaler_mips/execute_state/aluctrl_e_0
add wave -noupdate -group exe_ctrl_e_0 /mips_cpu_tb/superscaler_mips/execute_state/startmult_e_0
add wave -noupdate -group exe_ctrl_e_0 /mips_cpu_tb/superscaler_mips/execute_state/multsign_e_0
add wave -noupdate -group exe_ctrl_e_0 /mips_cpu_tb/superscaler_mips/execute_state/outputbranch_e_0
add wave -noupdate -group srca_mux_EXE_0 /mips_cpu_tb/superscaler_mips/execute_state/forwarda_e_0
add wave -noupdate -group srca_mux_EXE_0 /mips_cpu_tb/superscaler_mips/execute_state/rfout1_e_0
add wave -noupdate -group srca_mux_EXE_0 /mips_cpu_tb/superscaler_mips/execute_state/srca_e_0
add wave -noupdate -group wde_mux_EXE_0 /mips_cpu_tb/superscaler_mips/execute_state/forwardb_e_0
add wave -noupdate -group wde_mux_EXE_0 /mips_cpu_tb/superscaler_mips/execute_state/rfout2_e_0
add wave -noupdate -group wde_mux_EXE_0 /mips_cpu_tb/superscaler_mips/execute_state/writedata_e_0
add wave -noupdate -expand -group srcb_mux_EXE_0 /mips_cpu_tb/superscaler_mips/execute_state/alusrc_e_0
add wave -noupdate -expand -group srcb_mux_EXE_0 -radix decimal /mips_cpu_tb/superscaler_mips/execute_state/writedata_e_0
add wave -noupdate -expand -group srcb_mux_EXE_0 -radix decimal /mips_cpu_tb/superscaler_mips/execute_state/imm_e_0
add wave -noupdate -expand -group srcb_mux_EXE_0 -radix decimal /mips_cpu_tb/superscaler_mips/execute_state/srcb_e_0
add wave -noupdate -expand -group alu_EXE_0 -radix decimal /mips_cpu_tb/superscaler_mips/execute_state/srca_e_0
add wave -noupdate -expand -group alu_EXE_0 -radix decimal /mips_cpu_tb/superscaler_mips/execute_state/srcb_e_0
add wave -noupdate -expand -group alu_EXE_0 /mips_cpu_tb/superscaler_mips/execute_state/aluctrl_e_0
add wave -noupdate -expand -group alu_EXE_0 -radix decimal /mips_cpu_tb/superscaler_mips/execute_state/aluout_e_0
add wave -noupdate -expand -group writereg_instr_mux_EXE_0 /mips_cpu_tb/superscaler_mips/execute_state/regdst_e_0
add wave -noupdate -expand -group writereg_instr_mux_EXE_0 -radix unsigned /mips_cpu_tb/superscaler_mips/execute_state/rt_e_0
add wave -noupdate -expand -group writereg_instr_mux_EXE_0 -radix unsigned /mips_cpu_tb/superscaler_mips/execute_state/rd_e_0
add wave -noupdate -expand -group writereg_instr_mux_EXE_0 -radix unsigned /mips_cpu_tb/superscaler_mips/execute_state/writereg_e_0
add wave -noupdate -expand -group exe_mem_reg_0 -radix decimal /mips_cpu_tb/superscaler_mips/exe_mem_reg_0/aluout_e
add wave -noupdate -expand -group exe_mem_reg_0 -radix decimal /mips_cpu_tb/superscaler_mips/exe_mem_reg_0/aluout_m
add wave -noupdate -expand -group exe_mem_reg_0 /mips_cpu_tb/superscaler_mips/exe_mem_reg_0/enable
add wave -noupdate -expand -group exe_mem_reg_0 -radix decimal /mips_cpu_tb/superscaler_mips/exe_mem_reg_0/mem_ctrl_e
add wave -noupdate -expand -group exe_mem_reg_0 -radix decimal /mips_cpu_tb/superscaler_mips/exe_mem_reg_0/mem_ctrl_m
add wave -noupdate -expand -group exe_mem_reg_0 /mips_cpu_tb/superscaler_mips/exe_mem_reg_0/wb_ctrl_e
add wave -noupdate -expand -group exe_mem_reg_0 /mips_cpu_tb/superscaler_mips/exe_mem_reg_0/wb_ctrl_m
add wave -noupdate -expand -group exe_mem_reg_0 -radix decimal /mips_cpu_tb/superscaler_mips/exe_mem_reg_0/writedata_e
add wave -noupdate -expand -group exe_mem_reg_0 -radix decimal /mips_cpu_tb/superscaler_mips/exe_mem_reg_0/writedata_m
add wave -noupdate -expand -group exe_mem_reg_0 -radix unsigned /mips_cpu_tb/superscaler_mips/exe_mem_reg_0/writereg_e
add wave -noupdate -expand -group exe_mem_reg_0 -radix unsigned /mips_cpu_tb/superscaler_mips/exe_mem_reg_0/writereg_m
add wave -noupdate -divider EXE_1
add wave -noupdate -group exe_ctrl_e_1 /mips_cpu_tb/superscaler_mips/execute_state/exe_ctrl_e_1
add wave -noupdate -group exe_ctrl_e_1 /mips_cpu_tb/superscaler_mips/execute_state/regdst_e_1
add wave -noupdate -group exe_ctrl_e_1 /mips_cpu_tb/superscaler_mips/execute_state/alusrc_e_1
add wave -noupdate -group exe_ctrl_e_1 /mips_cpu_tb/superscaler_mips/execute_state/aluctrl_e_1
add wave -noupdate -group exe_ctrl_e_1 /mips_cpu_tb/superscaler_mips/execute_state/startmult_e_1
add wave -noupdate -group exe_ctrl_e_1 /mips_cpu_tb/superscaler_mips/execute_state/multsign_e_1
add wave -noupdate -group exe_ctrl_e_1 /mips_cpu_tb/superscaler_mips/execute_state/outputbranch_e_1
add wave -noupdate -group srca_mux_EXE_1 /mips_cpu_tb/superscaler_mips/execute_state/forwarda_e_1
add wave -noupdate -group srca_mux_EXE_1 /mips_cpu_tb/superscaler_mips/execute_state/rfout1_e_1
add wave -noupdate -group srca_mux_EXE_1 /mips_cpu_tb/superscaler_mips/execute_state/srca_e_1
add wave -noupdate -group wde_mux_EXE_1 /mips_cpu_tb/superscaler_mips/execute_state/forwardb_e_1
add wave -noupdate -group wde_mux_EXE_1 /mips_cpu_tb/superscaler_mips/execute_state/rfout2_e_1
add wave -noupdate -group wde_mux_EXE_1 /mips_cpu_tb/superscaler_mips/execute_state/writedata_e_1
add wave -noupdate -group srcb_mux_EXE_1 /mips_cpu_tb/superscaler_mips/execute_state/alusrc_e_1
add wave -noupdate -group srcb_mux_EXE_1 /mips_cpu_tb/superscaler_mips/execute_state/writedata_e_1
add wave -noupdate -group srcb_mux_EXE_1 /mips_cpu_tb/superscaler_mips/execute_state/imm_e_1
add wave -noupdate -group srcb_mux_EXE_1 /mips_cpu_tb/superscaler_mips/execute_state/srcb_e_1
add wave -noupdate -expand -group alu_EXE_1 -radix decimal /mips_cpu_tb/superscaler_mips/execute_state/srca_e_1
add wave -noupdate -expand -group alu_EXE_1 -radix decimal /mips_cpu_tb/superscaler_mips/execute_state/srcb_e_1
add wave -noupdate -expand -group alu_EXE_1 /mips_cpu_tb/superscaler_mips/execute_state/aluctrl_e_1
add wave -noupdate -expand -group alu_EXE_1 -radix decimal /mips_cpu_tb/superscaler_mips/execute_state/aluout_e_1
add wave -noupdate -expand -group writereg_instr_mux_EXE_1 /mips_cpu_tb/superscaler_mips/execute_state/regdst_e_1
add wave -noupdate -expand -group writereg_instr_mux_EXE_1 -radix unsigned /mips_cpu_tb/superscaler_mips/execute_state/rt_e_1
add wave -noupdate -expand -group writereg_instr_mux_EXE_1 -radix unsigned /mips_cpu_tb/superscaler_mips/execute_state/rd_e_1
add wave -noupdate -expand -group writereg_instr_mux_EXE_1 -radix unsigned /mips_cpu_tb/superscaler_mips/execute_state/writereg_e_1
add wave -noupdate -expand -group exe_mem_reg_1 -radix decimal /mips_cpu_tb/superscaler_mips/exe_mem_reg_1/aluout_e
add wave -noupdate -expand -group exe_mem_reg_1 -radix decimal /mips_cpu_tb/superscaler_mips/exe_mem_reg_1/aluout_m
add wave -noupdate -expand -group exe_mem_reg_1 /mips_cpu_tb/superscaler_mips/exe_mem_reg_1/enable
add wave -noupdate -expand -group exe_mem_reg_1 /mips_cpu_tb/superscaler_mips/exe_mem_reg_1/mem_ctrl_e
add wave -noupdate -expand -group exe_mem_reg_1 /mips_cpu_tb/superscaler_mips/exe_mem_reg_1/mem_ctrl_m
add wave -noupdate -expand -group exe_mem_reg_1 /mips_cpu_tb/superscaler_mips/exe_mem_reg_1/wb_ctrl_e
add wave -noupdate -expand -group exe_mem_reg_1 /mips_cpu_tb/superscaler_mips/exe_mem_reg_1/wb_ctrl_m
add wave -noupdate -expand -group exe_mem_reg_1 -radix decimal /mips_cpu_tb/superscaler_mips/exe_mem_reg_1/writedata_e
add wave -noupdate -expand -group exe_mem_reg_1 -radix decimal /mips_cpu_tb/superscaler_mips/exe_mem_reg_1/writedata_m
add wave -noupdate -expand -group exe_mem_reg_1 -radix unsigned /mips_cpu_tb/superscaler_mips/exe_mem_reg_1/writereg_e
add wave -noupdate -expand -group exe_mem_reg_1 -radix unsigned /mips_cpu_tb/superscaler_mips/exe_mem_reg_1/writereg_m
add wave -noupdate -divider memory_state
add wave -noupdate /mips_cpu_tb/superscaler_mips/hazard_unit/mem_stall
add wave -noupdate -expand /mips_cpu_tb/superscaler_mips/memory_state/mem_ctrl_e_0
add wave -noupdate -expand /mips_cpu_tb/superscaler_mips/memory_state/mem_ctrl_e_1
add wave -noupdate /mips_cpu_tb/superscaler_mips/memory_state/cache_reset
add wave -noupdate /mips_cpu_tb/superscaler_mips/memory_state/memready_m
add wave -noupdate -group mem_ctrl_m_0 /mips_cpu_tb/superscaler_mips/memory_state/mem_ctrl_m_0
add wave -noupdate -group mem_ctrl_m_0 /mips_cpu_tb/superscaler_mips/memory_state/memwrite_m_0
add wave -noupdate -group mem_ctrl_m_0 /mips_cpu_tb/superscaler_mips/memory_state/memread_m_0
add wave -noupdate -group mem_ctrl_m_0 /mips_cpu_tb/superscaler_mips/memory_state/outselect_m_0
add wave -noupdate -group {execout_mux_0(missing mult)} /mips_cpu_tb/superscaler_mips/memory_state/outselect_m_0
add wave -noupdate -group {execout_mux_0(missing mult)} -radix decimal /mips_cpu_tb/superscaler_mips/memory_state/aluout_m_0
add wave -noupdate -group {execout_mux_0(missing mult)} -radix decimal /mips_cpu_tb/superscaler_mips/memory_state/upperimm_m_0
add wave -noupdate -group {execout_mux_0(missing mult)} -radix decimal /mips_cpu_tb/superscaler_mips/memory_state/execout_m_0
add wave -noupdate -group mem_ctrl_m_1 /mips_cpu_tb/superscaler_mips/memory_state/mem_ctrl_m_1
add wave -noupdate -group mem_ctrl_m_1 /mips_cpu_tb/superscaler_mips/memory_state/memwrite_m_1
add wave -noupdate -group mem_ctrl_m_1 /mips_cpu_tb/superscaler_mips/memory_state/memread_m_1
add wave -noupdate -group mem_ctrl_m_1 /mips_cpu_tb/superscaler_mips/memory_state/outselect_m_1
add wave -noupdate -group {execout_mux_1(missing mult)} /mips_cpu_tb/superscaler_mips/memory_state/outselect_m_1
add wave -noupdate -group {execout_mux_1(missing mult)} -radix decimal /mips_cpu_tb/superscaler_mips/memory_state/aluout_m_1
add wave -noupdate -group {execout_mux_1(missing mult)} -radix decimal /mips_cpu_tb/superscaler_mips/memory_state/upperimm_m_1
add wave -noupdate -group {execout_mux_1(missing mult)} -radix decimal /mips_cpu_tb/superscaler_mips/memory_state/execout_m_1
add wave -noupdate /mips_cpu_tb/superscaler_mips/memory_state/inst_count
add wave -noupdate /mips_cpu_tb/superscaler_mips/memory_state/wait_flag
add wave -noupdate -expand -group memread_m_mux /mips_cpu_tb/superscaler_mips/memory_state/memread_m_0
add wave -noupdate -expand -group memread_m_mux /mips_cpu_tb/superscaler_mips/memory_state/memread_m_1
add wave -noupdate -expand -group memread_m_mux /mips_cpu_tb/superscaler_mips/memory_state/memread_m
add wave -noupdate -expand -group memwrite_m_mux /mips_cpu_tb/superscaler_mips/memory_state/memwrite_m_0
add wave -noupdate -expand -group memwrite_m_mux /mips_cpu_tb/superscaler_mips/memory_state/memwrite_m_1
add wave -noupdate -expand -group memwrite_m_mux /mips_cpu_tb/superscaler_mips/memory_state/memwrite_m
add wave -noupdate -expand -group execout_m_mux /mips_cpu_tb/superscaler_mips/memory_state/execout_m_0
add wave -noupdate -expand -group execout_m_mux /mips_cpu_tb/superscaler_mips/memory_state/execout_m_1
add wave -noupdate -group writedata_m_mux -radix decimal /mips_cpu_tb/superscaler_mips/memory_state/writedata_m_0
add wave -noupdate -group writedata_m_mux -radix decimal /mips_cpu_tb/superscaler_mips/memory_state/writedata_m_1
add wave -noupdate -group writedata_m_mux -radix decimal /mips_cpu_tb/superscaler_mips/memory_state/writedata_m
add wave -noupdate -group data_mem /mips_cpu_tb/superscaler_mips/memory_state/clk
add wave -noupdate -group data_mem /mips_cpu_tb/superscaler_mips/memory_state/reset
add wave -noupdate -group data_mem -label memread_m(rd_en) /mips_cpu_tb/superscaler_mips/memory_state/memread_m
add wave -noupdate -group data_mem -label memwrite_m(wr_en) /mips_cpu_tb/superscaler_mips/memory_state/memwrite_m
add wave -noupdate -group data_mem -label writedata_m(wdata) -radix decimal /mips_cpu_tb/superscaler_mips/memory_state/writedata_m
add wave -noupdate -group data_mem -label memready_m(ready) /mips_cpu_tb/superscaler_mips/memory_state/memready_m
add wave -noupdate -group data_mem -label readdata_m(rdata) -radix decimal /mips_cpu_tb/superscaler_mips/memory_state/readdata_m
add wave -noupdate -radix decimal /mips_cpu_tb/superscaler_mips/memory_state/readdata_m_0
add wave -noupdate -radix decimal /mips_cpu_tb/superscaler_mips/memory_state/readdata_m_1
add wave -noupdate /mips_cpu_tb/superscaler_mips/memory_state/cache_hit_m
add wave -noupdate /mips_cpu_tb/superscaler_mips/memory_state/valid_dirty_m
add wave -noupdate /mips_cpu_tb/superscaler_mips/memory_state/stall_latch_m
add wave -noupdate -group mem_wb_reg_0 -radix decimal /mips_cpu_tb/superscaler_mips/mem_wb_reg_0/clr
add wave -noupdate -group mem_wb_reg_0 -radix decimal /mips_cpu_tb/superscaler_mips/mem_wb_reg_0/readdata_m
add wave -noupdate -group mem_wb_reg_0 -radix decimal /mips_cpu_tb/superscaler_mips/mem_wb_reg_0/readdata_w
add wave -noupdate -group mem_wb_reg_0 /mips_cpu_tb/superscaler_mips/mem_wb_reg_0/wb_ctrl_m
add wave -noupdate -group mem_wb_reg_0 /mips_cpu_tb/superscaler_mips/mem_wb_reg_0/wb_ctrl_w
add wave -noupdate -group mem_wb_reg_0 -radix decimal /mips_cpu_tb/superscaler_mips/mem_wb_reg_0/writereg_m
add wave -noupdate -group mem_wb_reg_0 -radix decimal /mips_cpu_tb/superscaler_mips/mem_wb_reg_0/writereg_w
add wave -noupdate -group mem_wb_reg_1 -radix decimal /mips_cpu_tb/superscaler_mips/mem_wb_reg_1/clr
add wave -noupdate -group mem_wb_reg_1 -radix decimal /mips_cpu_tb/superscaler_mips/mem_wb_reg_1/readdata_m
add wave -noupdate -group mem_wb_reg_1 -radix decimal /mips_cpu_tb/superscaler_mips/mem_wb_reg_1/readdata_w
add wave -noupdate -group mem_wb_reg_1 /mips_cpu_tb/superscaler_mips/mem_wb_reg_1/wb_ctrl_m
add wave -noupdate -group mem_wb_reg_1 /mips_cpu_tb/superscaler_mips/mem_wb_reg_1/wb_ctrl_w
add wave -noupdate -group mem_wb_reg_1 -radix decimal /mips_cpu_tb/superscaler_mips/mem_wb_reg_1/writereg_m
add wave -noupdate -group mem_wb_reg_1 -radix decimal /mips_cpu_tb/superscaler_mips/mem_wb_reg_1/writereg_w
add wave -noupdate -divider memory_state
add wave -noupdate -expand -group cache_controller /mips_cpu_tb/superscaler_mips/memory_state/data_memory/cache_memory/clk
add wave -noupdate -expand -group cache_controller /mips_cpu_tb/superscaler_mips/memory_state/data_memory/cache_memory/reset
add wave -noupdate -expand -group cache_controller -radix unsigned /mips_cpu_tb/superscaler_mips/memory_state/data_memory/cache_memory/state
add wave -noupdate -expand -group cache_controller -radix decimal /mips_cpu_tb/superscaler_mips/memory_state/data_memory/data_up
add wave -noupdate -expand -group cache_controller -radix decimal /mips_cpu_tb/superscaler_mips/memory_state/data_memory/d_up
add wave -noupdate -expand -group cache_controller -radix decimal /mips_cpu_tb/superscaler_mips/memory_state/data_memory/dmem
add wave -noupdate -expand -group cache_controller -radix decimal /mips_cpu_tb/superscaler_mips/memory_state/data_memory/w_up
add wave -noupdate -expand -group cache_controller -radix binary /mips_cpu_tb/superscaler_mips/memory_state/data_memory/cache_memory/addr_up
add wave -noupdate -expand -group cache_controller /mips_cpu_tb/superscaler_mips/memory_state/data_memory/cache_memory/addr_latch
add wave -noupdate -expand -group cache_controller /mips_cpu_tb/superscaler_mips/memory_state/data_memory/cache_memory/hit_way_0
add wave -noupdate -expand -group cache_controller /mips_cpu_tb/superscaler_mips/memory_state/data_memory/cache_memory/hit_way_1
add wave -noupdate -expand -group cache_controller /mips_cpu_tb/superscaler_mips/memory_state/data_memory/cache_memory/valid_way_0
add wave -noupdate -expand -group cache_controller /mips_cpu_tb/superscaler_mips/memory_state/data_memory/cache_memory/valid_way_1
add wave -noupdate -expand -group cache_controller /mips_cpu_tb/superscaler_mips/memory_state/data_memory/cache_memory/used_way_0
add wave -noupdate -expand -group cache_controller /mips_cpu_tb/superscaler_mips/memory_state/data_memory/cache_memory/used_way_1
add wave -noupdate -expand -group cache_controller /mips_cpu_tb/superscaler_mips/memory_state/data_memory/cache_memory/dirty_way_0
add wave -noupdate -expand -group cache_controller /mips_cpu_tb/superscaler_mips/memory_state/data_memory/cache_memory/dirty_way_1
add wave -noupdate -expand -group cache_controller /mips_cpu_tb/superscaler_mips/memory_state/data_memory/cache_memory/tag_read_0
add wave -noupdate -expand -group cache_controller /mips_cpu_tb/superscaler_mips/memory_state/data_memory/cache_memory/tag_read_1
add wave -noupdate -expand -group cache_controller -radix hexadecimal /mips_cpu_tb/superscaler_mips/memory_state/data_memory/cache_memory/db_read_0
add wave -noupdate -expand -group cache_controller -radix hexadecimal /mips_cpu_tb/superscaler_mips/memory_state/data_memory/cache_memory/db_read_1
add wave -noupdate -expand -group cache_controller /mips_cpu_tb/superscaler_mips/memory_state/data_memory/cache_memory/read_up
add wave -noupdate -expand -group cache_controller /mips_cpu_tb/superscaler_mips/memory_state/data_memory/cache_memory/write_up
add wave -noupdate -expand -group cache_controller /mips_cpu_tb/superscaler_mips/memory_state/data_memory/cache_memory/tag
add wave -noupdate -expand -group cache_controller -radix unsigned /mips_cpu_tb/superscaler_mips/memory_state/data_memory/cache_memory/index
add wave -noupdate -expand -group cache_controller /mips_cpu_tb/superscaler_mips/memory_state/data_memory/cache_memory/block_offset
add wave -noupdate -expand -group cache_controller -radix binary /mips_cpu_tb/superscaler_mips/memory_state/data_memory/cache_memory/tag_0_ram/Tag0_mem
add wave -noupdate -expand -group cache_controller -radix binary /mips_cpu_tb/superscaler_mips/memory_state/data_memory/cache_memory/tag_1_ram/Tag1_mem
add wave -noupdate -expand -group cache_controller /mips_cpu_tb/superscaler_mips/memory_state/data_memory/cache_memory/data_block0_ram/DB0_mem
add wave -noupdate -expand -group cache_controller /mips_cpu_tb/superscaler_mips/memory_state/data_memory/cache_memory/data_block1_ram/DB1_mem
add wave -noupdate -expand -group data_mem_fsm -radix unsigned /mips_cpu_tb/superscaler_mips/memory_state/data_memory/data_memory_delay/address
add wave -noupdate -expand -group data_mem_fsm -radix decimal /mips_cpu_tb/superscaler_mips/memory_state/data_memory/data_memory_delay/rd_data
add wave -noupdate -expand -group data_mem_fsm /mips_cpu_tb/superscaler_mips/memory_state/data_memory/data_memory_delay/reset
add wave -noupdate -expand -group data_mem_fsm -radix unsigned /mips_cpu_tb/superscaler_mips/memory_state/data_memory/data_memory_delay/state
add wave -noupdate -expand -group data_mem_fsm -radix decimal /mips_cpu_tb/superscaler_mips/memory_state/data_memory/data_memory_delay/wr_data
add wave -noupdate -expand -group data_mem_fsm /mips_cpu_tb/superscaler_mips/memory_state/data_memory/data_memory_delay/done
add wave -noupdate -expand -group data_mem_fsm /mips_cpu_tb/superscaler_mips/memory_state/data_memory/data_memory_delay/ready
add wave -noupdate -divider writeback_state
add wave -noupdate -expand -group result_w_0_mux -radix decimal /mips_cpu_tb/superscaler_mips/memtoreg_w_0
add wave -noupdate -expand -group result_w_0_mux -radix decimal /mips_cpu_tb/superscaler_mips/readdata_w_0
add wave -noupdate -expand -group result_w_0_mux -radix decimal /mips_cpu_tb/superscaler_mips/result_w_0
add wave -noupdate -expand -group result_w_1_mux -radix decimal /mips_cpu_tb/superscaler_mips/memtoreg_w_1
add wave -noupdate -expand -group result_w_1_mux -radix decimal /mips_cpu_tb/superscaler_mips/readdata_w_1
add wave -noupdate -expand -group result_w_1_mux -radix decimal /mips_cpu_tb/superscaler_mips/result_w_1
TreeUpdate [SetDefaultTree]
quietly WaveActivateNextPane
add wave -noupdate -radix unsigned /mips_cpu_tb/cycle_num
add wave -noupdate -radix hexadecimal /mips_cpu_tb/instr_d_0
add wave -noupdate -radix hexadecimal /mips_cpu_tb/instr_d_1
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {2558 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 248
configure wave -valuecolwidth 475
configure wave -justifyvalue left
configure wave -signalnamewidth 1
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ps
update
WaveRestoreZoom {2572 ps} {2731 ps}
