onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /mips_cpu_tb/superscaler_mips/clk
add wave -noupdate /mips_cpu_tb/superscaler_mips/reset
add wave -noupdate -expand -group pipe0 -radix unsigned /mips_cpu_tb/superscaler_mips/pc_f_0
add wave -noupdate -expand -group pipe0 -radix hexadecimal /mips_cpu_tb/superscaler_mips/instr_d_0
add wave -noupdate -expand -group pipe0 -radix decimal /mips_cpu_tb/superscaler_mips/rfout1_e_0
add wave -noupdate -expand -group pipe0 -radix decimal /mips_cpu_tb/superscaler_mips/rfout2_e_0
add wave -noupdate -expand -group pipe0 -radix decimal /mips_cpu_tb/superscaler_mips/aluout_m_0
add wave -noupdate -expand -group pipe0 -radix decimal /mips_cpu_tb/superscaler_mips/readdata_m_0
add wave -noupdate -expand -group pipe0 -radix decimal /mips_cpu_tb/superscaler_mips/result_w_0
add wave -noupdate -expand -group pipe1 -radix unsigned /mips_cpu_tb/superscaler_mips/pc_f_1
add wave -noupdate -expand -group pipe1 -radix hexadecimal /mips_cpu_tb/superscaler_mips/instr_d_1
add wave -noupdate -expand -group pipe1 -radix decimal /mips_cpu_tb/superscaler_mips/rfout1_e_1
add wave -noupdate -expand -group pipe1 -radix decimal /mips_cpu_tb/superscaler_mips/rfout2_e_1
add wave -noupdate -expand -group pipe1 -radix decimal /mips_cpu_tb/superscaler_mips/aluout_m_1
add wave -noupdate -expand -group pipe1 -radix decimal /mips_cpu_tb/superscaler_mips/readdata_m_1
add wave -noupdate -expand -group pipe1 -radix decimal /mips_cpu_tb/superscaler_mips/result_w_1
add wave -noupdate -expand -group inst0 -radix decimal /mips_cpu_tb/superscaler_mips/decode_state/rfread1_d_0
add wave -noupdate -expand -group inst0 -radix decimal /mips_cpu_tb/superscaler_mips/decode_state/rfread2_d_0
add wave -noupdate -expand -group inst0 -radix decimal /mips_cpu_tb/superscaler_mips/decode_state/rfout1_d_0
add wave -noupdate -expand -group inst0 -radix decimal /mips_cpu_tb/superscaler_mips/decode_state/rfout2_d_0
add wave -noupdate -expand -group inst0 -radix decimal /mips_cpu_tb/superscaler_mips/execute_state/srca_e_0
add wave -noupdate -expand -group inst0 -radix decimal /mips_cpu_tb/superscaler_mips/execute_state/srcb_e_0
add wave -noupdate -expand -group inst0 -radix decimal /mips_cpu_tb/superscaler_mips/execute_state/aluout_e_0
add wave -noupdate -expand -group inst0 -radix decimal /mips_cpu_tb/superscaler_mips/memory_state/execout_m_0
add wave -noupdate -expand -group inst1 -radix decimal /mips_cpu_tb/superscaler_mips/decode_state/rfread1_d_1
add wave -noupdate -expand -group inst1 -radix decimal /mips_cpu_tb/superscaler_mips/decode_state/rfread2_d_1
add wave -noupdate -expand -group inst1 -radix decimal /mips_cpu_tb/superscaler_mips/decode_state/rfout1_d_1
add wave -noupdate -expand -group inst1 -radix decimal /mips_cpu_tb/superscaler_mips/decode_state/rfout2_d_1
add wave -noupdate -expand -group inst1 -radix decimal /mips_cpu_tb/superscaler_mips/execute_state/srca_e_1
add wave -noupdate -expand -group inst1 -radix decimal /mips_cpu_tb/superscaler_mips/execute_state/srcb_e_1
add wave -noupdate -expand -group inst1 -radix decimal /mips_cpu_tb/superscaler_mips/execute_state/aluout_e_1
add wave -noupdate -expand -group inst1 -radix decimal /mips_cpu_tb/superscaler_mips/memory_state/execout_m_1
add wave -noupdate -group forwarding_unit -radix unsigned /mips_cpu_tb/superscaler_mips/forwarding_unit/rs0_id
add wave -noupdate -group forwarding_unit -radix unsigned /mips_cpu_tb/superscaler_mips/forwarding_unit/rs1_id
add wave -noupdate -group forwarding_unit -radix unsigned /mips_cpu_tb/superscaler_mips/forwarding_unit/rt0_id
add wave -noupdate -group forwarding_unit -radix unsigned /mips_cpu_tb/superscaler_mips/forwarding_unit/rt1_id
add wave -noupdate -group forwarding_unit -radix unsigned /mips_cpu_tb/superscaler_mips/forwarding_unit/rs0_exe
add wave -noupdate -group forwarding_unit -radix unsigned /mips_cpu_tb/superscaler_mips/forwarding_unit/rs1_exe
add wave -noupdate -group forwarding_unit -radix unsigned /mips_cpu_tb/superscaler_mips/forwarding_unit/rt0_exe
add wave -noupdate -group forwarding_unit -radix unsigned /mips_cpu_tb/superscaler_mips/forwarding_unit/rt1_exe
add wave -noupdate -group forwarding_unit -radix unsigned /mips_cpu_tb/superscaler_mips/forwarding_unit/regwrite0_mem
add wave -noupdate -group forwarding_unit -radix unsigned /mips_cpu_tb/superscaler_mips/forwarding_unit/regwrite1_mem
add wave -noupdate -group forwarding_unit -radix unsigned /mips_cpu_tb/superscaler_mips/forwarding_unit/regwrite0_wb
add wave -noupdate -group forwarding_unit -radix unsigned /mips_cpu_tb/superscaler_mips/forwarding_unit/regwrite1_wb
add wave -noupdate -group forwarding_unit -radix unsigned /mips_cpu_tb/superscaler_mips/forwarding_unit/writereg0_mem
add wave -noupdate -group forwarding_unit -radix unsigned /mips_cpu_tb/superscaler_mips/forwarding_unit/writereg1_mem
add wave -noupdate -group forwarding_unit -radix unsigned /mips_cpu_tb/superscaler_mips/forwarding_unit/writereg0_wb
add wave -noupdate -group forwarding_unit -radix unsigned /mips_cpu_tb/superscaler_mips/forwarding_unit/writereg1_wb
add wave -noupdate -group forwarding_unit -radix binary /mips_cpu_tb/superscaler_mips/forwarding_unit/forwardA0_id
add wave -noupdate -group forwarding_unit -radix binary /mips_cpu_tb/superscaler_mips/forwarding_unit/forwardA1_id
add wave -noupdate -group forwarding_unit -radix binary /mips_cpu_tb/superscaler_mips/forwarding_unit/forwardB0_id
add wave -noupdate -group forwarding_unit -radix binary /mips_cpu_tb/superscaler_mips/forwarding_unit/forwardB1_id
add wave -noupdate -group forwarding_unit -radix binary /mips_cpu_tb/superscaler_mips/forwarding_unit/forwardA0_exe
add wave -noupdate -group forwarding_unit -radix binary /mips_cpu_tb/superscaler_mips/forwarding_unit/forwardA1_exe
add wave -noupdate -group forwarding_unit -radix binary /mips_cpu_tb/superscaler_mips/forwarding_unit/forwardB0_exe
add wave -noupdate -group forwarding_unit -radix binary /mips_cpu_tb/superscaler_mips/forwarding_unit/forwardB1_exe
add wave -noupdate -group forwarding_unit -radix unsigned /mips_cpu_tb/superscaler_mips/forwarding_unit/rs0_id
add wave -noupdate -group forwarding_unit -radix unsigned /mips_cpu_tb/superscaler_mips/forwarding_unit/rs1_id
add wave -noupdate -group forwarding_unit -radix unsigned /mips_cpu_tb/superscaler_mips/forwarding_unit/rt0_id
add wave -noupdate -group forwarding_unit -radix unsigned /mips_cpu_tb/superscaler_mips/forwarding_unit/rt1_id
add wave -noupdate -group forwarding_unit -radix unsigned /mips_cpu_tb/superscaler_mips/forwarding_unit/rs0_exe
add wave -noupdate -group forwarding_unit -radix unsigned /mips_cpu_tb/superscaler_mips/forwarding_unit/rs1_exe
add wave -noupdate -group forwarding_unit -radix unsigned /mips_cpu_tb/superscaler_mips/forwarding_unit/rt0_exe
add wave -noupdate -group forwarding_unit -radix unsigned /mips_cpu_tb/superscaler_mips/forwarding_unit/rt1_exe
add wave -noupdate -group forwarding_unit -radix unsigned /mips_cpu_tb/superscaler_mips/forwarding_unit/regwrite0_mem
add wave -noupdate -group forwarding_unit -radix unsigned /mips_cpu_tb/superscaler_mips/forwarding_unit/regwrite1_mem
add wave -noupdate -group forwarding_unit -radix unsigned /mips_cpu_tb/superscaler_mips/forwarding_unit/regwrite0_wb
add wave -noupdate -group forwarding_unit -radix unsigned /mips_cpu_tb/superscaler_mips/forwarding_unit/regwrite1_wb
add wave -noupdate -group forwarding_unit -radix unsigned /mips_cpu_tb/superscaler_mips/forwarding_unit/writereg0_mem
add wave -noupdate -group forwarding_unit -radix unsigned /mips_cpu_tb/superscaler_mips/forwarding_unit/writereg1_mem
add wave -noupdate -group forwarding_unit -radix unsigned /mips_cpu_tb/superscaler_mips/forwarding_unit/writereg0_wb
add wave -noupdate -group forwarding_unit -radix unsigned /mips_cpu_tb/superscaler_mips/forwarding_unit/writereg1_wb
add wave -noupdate -group forwarding_unit -radix binary /mips_cpu_tb/superscaler_mips/forwarding_unit/forwardA0_id
add wave -noupdate -group forwarding_unit -radix binary /mips_cpu_tb/superscaler_mips/forwarding_unit/forwardA1_id
add wave -noupdate -group forwarding_unit -radix binary /mips_cpu_tb/superscaler_mips/forwarding_unit/forwardB0_id
add wave -noupdate -group forwarding_unit -radix binary /mips_cpu_tb/superscaler_mips/forwarding_unit/forwardB1_id
add wave -noupdate -group forwarding_unit -radix binary /mips_cpu_tb/superscaler_mips/forwarding_unit/forwardA0_exe
add wave -noupdate -group forwarding_unit -radix binary /mips_cpu_tb/superscaler_mips/forwarding_unit/forwardA1_exe
add wave -noupdate -group forwarding_unit -radix binary /mips_cpu_tb/superscaler_mips/forwarding_unit/forwardB0_exe
add wave -noupdate -group forwarding_unit -radix binary /mips_cpu_tb/superscaler_mips/forwarding_unit/forwardB1_exe
add wave -noupdate -group forwarding_unit -radix unsigned /mips_cpu_tb/superscaler_mips/forwarding_unit/rs0_id
add wave -noupdate -group forwarding_unit -radix unsigned /mips_cpu_tb/superscaler_mips/forwarding_unit/rs1_id
add wave -noupdate -group forwarding_unit -radix unsigned /mips_cpu_tb/superscaler_mips/forwarding_unit/rt0_id
add wave -noupdate -group forwarding_unit -radix unsigned /mips_cpu_tb/superscaler_mips/forwarding_unit/rt1_id
add wave -noupdate -group forwarding_unit -radix unsigned /mips_cpu_tb/superscaler_mips/forwarding_unit/rs0_exe
add wave -noupdate -group forwarding_unit -radix unsigned /mips_cpu_tb/superscaler_mips/forwarding_unit/rs1_exe
add wave -noupdate -group forwarding_unit -radix unsigned /mips_cpu_tb/superscaler_mips/forwarding_unit/rt0_exe
add wave -noupdate -group forwarding_unit -radix unsigned /mips_cpu_tb/superscaler_mips/forwarding_unit/rt1_exe
add wave -noupdate -group forwarding_unit -radix unsigned /mips_cpu_tb/superscaler_mips/forwarding_unit/regwrite0_mem
add wave -noupdate -group forwarding_unit -radix unsigned /mips_cpu_tb/superscaler_mips/forwarding_unit/regwrite1_mem
add wave -noupdate -group forwarding_unit -radix unsigned /mips_cpu_tb/superscaler_mips/forwarding_unit/regwrite0_wb
add wave -noupdate -group forwarding_unit -radix unsigned /mips_cpu_tb/superscaler_mips/forwarding_unit/regwrite1_wb
add wave -noupdate -group forwarding_unit -radix unsigned /mips_cpu_tb/superscaler_mips/forwarding_unit/writereg0_mem
add wave -noupdate -group forwarding_unit -radix unsigned /mips_cpu_tb/superscaler_mips/forwarding_unit/writereg1_mem
add wave -noupdate -group forwarding_unit -radix unsigned /mips_cpu_tb/superscaler_mips/forwarding_unit/writereg0_wb
add wave -noupdate -group forwarding_unit -radix unsigned /mips_cpu_tb/superscaler_mips/forwarding_unit/writereg1_wb
add wave -noupdate -group forwarding_unit -radix binary /mips_cpu_tb/superscaler_mips/forwarding_unit/forwardA0_id
add wave -noupdate -group forwarding_unit -radix binary /mips_cpu_tb/superscaler_mips/forwarding_unit/forwardA1_id
add wave -noupdate -group forwarding_unit -radix binary /mips_cpu_tb/superscaler_mips/forwarding_unit/forwardB0_id
add wave -noupdate -group forwarding_unit -radix binary /mips_cpu_tb/superscaler_mips/forwarding_unit/forwardB1_id
add wave -noupdate -group forwarding_unit -radix binary /mips_cpu_tb/superscaler_mips/forwarding_unit/forwardA0_exe
add wave -noupdate -group forwarding_unit -radix binary /mips_cpu_tb/superscaler_mips/forwarding_unit/forwardA1_exe
add wave -noupdate -group forwarding_unit -radix binary /mips_cpu_tb/superscaler_mips/forwarding_unit/forwardB0_exe
add wave -noupdate -group forwarding_unit -radix binary /mips_cpu_tb/superscaler_mips/forwarding_unit/forwardB1_exe
add wave -noupdate -group forwarding_unit -radix unsigned /mips_cpu_tb/superscaler_mips/forwarding_unit/rs0_id
add wave -noupdate -group forwarding_unit -radix unsigned /mips_cpu_tb/superscaler_mips/forwarding_unit/rs1_id
add wave -noupdate -group forwarding_unit -radix unsigned /mips_cpu_tb/superscaler_mips/forwarding_unit/rt0_id
add wave -noupdate -group forwarding_unit -radix unsigned /mips_cpu_tb/superscaler_mips/forwarding_unit/rt1_id
add wave -noupdate -group forwarding_unit -radix unsigned /mips_cpu_tb/superscaler_mips/forwarding_unit/rs0_exe
add wave -noupdate -group forwarding_unit -radix unsigned /mips_cpu_tb/superscaler_mips/forwarding_unit/rs1_exe
add wave -noupdate -group forwarding_unit -radix unsigned /mips_cpu_tb/superscaler_mips/forwarding_unit/rt0_exe
add wave -noupdate -group forwarding_unit -radix unsigned /mips_cpu_tb/superscaler_mips/forwarding_unit/rt1_exe
add wave -noupdate -group forwarding_unit -radix unsigned /mips_cpu_tb/superscaler_mips/forwarding_unit/regwrite0_mem
add wave -noupdate -group forwarding_unit -radix unsigned /mips_cpu_tb/superscaler_mips/forwarding_unit/regwrite1_mem
add wave -noupdate -group forwarding_unit -radix unsigned /mips_cpu_tb/superscaler_mips/forwarding_unit/regwrite0_wb
add wave -noupdate -group forwarding_unit -radix unsigned /mips_cpu_tb/superscaler_mips/forwarding_unit/regwrite1_wb
add wave -noupdate -group forwarding_unit -radix unsigned /mips_cpu_tb/superscaler_mips/forwarding_unit/writereg0_mem
add wave -noupdate -group forwarding_unit -radix unsigned /mips_cpu_tb/superscaler_mips/forwarding_unit/writereg1_mem
add wave -noupdate -group forwarding_unit -radix unsigned /mips_cpu_tb/superscaler_mips/forwarding_unit/writereg0_wb
add wave -noupdate -group forwarding_unit -radix unsigned /mips_cpu_tb/superscaler_mips/forwarding_unit/writereg1_wb
add wave -noupdate -group forwarding_unit -radix binary /mips_cpu_tb/superscaler_mips/forwarding_unit/forwardA0_id
add wave -noupdate -group forwarding_unit -radix binary /mips_cpu_tb/superscaler_mips/forwarding_unit/forwardA1_id
add wave -noupdate -group forwarding_unit -radix binary /mips_cpu_tb/superscaler_mips/forwarding_unit/forwardB0_id
add wave -noupdate -group forwarding_unit -radix binary /mips_cpu_tb/superscaler_mips/forwarding_unit/forwardB1_id
add wave -noupdate -group forwarding_unit -radix binary /mips_cpu_tb/superscaler_mips/forwarding_unit/forwardA0_exe
add wave -noupdate -group forwarding_unit -radix binary /mips_cpu_tb/superscaler_mips/forwarding_unit/forwardA1_exe
add wave -noupdate -group forwarding_unit -radix binary /mips_cpu_tb/superscaler_mips/forwarding_unit/forwardB0_exe
add wave -noupdate -group forwarding_unit -radix binary /mips_cpu_tb/superscaler_mips/forwarding_unit/forwardB1_exe
add wave -noupdate -group decode_rf -radix decimal -childformat {{{/mips_cpu_tb/superscaler_mips/decode_state/reg_file/regs[0]} -radix decimal} {{/mips_cpu_tb/superscaler_mips/decode_state/reg_file/regs[1]} -radix decimal} {{/mips_cpu_tb/superscaler_mips/decode_state/reg_file/regs[2]} -radix decimal} {{/mips_cpu_tb/superscaler_mips/decode_state/reg_file/regs[3]} -radix decimal} {{/mips_cpu_tb/superscaler_mips/decode_state/reg_file/regs[4]} -radix decimal} {{/mips_cpu_tb/superscaler_mips/decode_state/reg_file/regs[5]} -radix decimal} {{/mips_cpu_tb/superscaler_mips/decode_state/reg_file/regs[6]} -radix decimal} {{/mips_cpu_tb/superscaler_mips/decode_state/reg_file/regs[7]} -radix decimal} {{/mips_cpu_tb/superscaler_mips/decode_state/reg_file/regs[8]} -radix decimal} {{/mips_cpu_tb/superscaler_mips/decode_state/reg_file/regs[9]} -radix decimal} {{/mips_cpu_tb/superscaler_mips/decode_state/reg_file/regs[10]} -radix decimal} {{/mips_cpu_tb/superscaler_mips/decode_state/reg_file/regs[11]} -radix decimal} {{/mips_cpu_tb/superscaler_mips/decode_state/reg_file/regs[12]} -radix decimal} {{/mips_cpu_tb/superscaler_mips/decode_state/reg_file/regs[13]} -radix decimal} {{/mips_cpu_tb/superscaler_mips/decode_state/reg_file/regs[14]} -radix decimal} {{/mips_cpu_tb/superscaler_mips/decode_state/reg_file/regs[15]} -radix decimal} {{/mips_cpu_tb/superscaler_mips/decode_state/reg_file/regs[16]} -radix decimal} {{/mips_cpu_tb/superscaler_mips/decode_state/reg_file/regs[17]} -radix decimal} {{/mips_cpu_tb/superscaler_mips/decode_state/reg_file/regs[18]} -radix decimal} {{/mips_cpu_tb/superscaler_mips/decode_state/reg_file/regs[19]} -radix decimal} {{/mips_cpu_tb/superscaler_mips/decode_state/reg_file/regs[20]} -radix decimal} {{/mips_cpu_tb/superscaler_mips/decode_state/reg_file/regs[21]} -radix decimal} {{/mips_cpu_tb/superscaler_mips/decode_state/reg_file/regs[22]} -radix decimal} {{/mips_cpu_tb/superscaler_mips/decode_state/reg_file/regs[23]} -radix decimal} {{/mips_cpu_tb/superscaler_mips/decode_state/reg_file/regs[24]} -radix decimal} {{/mips_cpu_tb/superscaler_mips/decode_state/reg_file/regs[25]} -radix decimal} {{/mips_cpu_tb/superscaler_mips/decode_state/reg_file/regs[26]} -radix decimal} {{/mips_cpu_tb/superscaler_mips/decode_state/reg_file/regs[27]} -radix decimal} {{/mips_cpu_tb/superscaler_mips/decode_state/reg_file/regs[28]} -radix decimal} {{/mips_cpu_tb/superscaler_mips/decode_state/reg_file/regs[29]} -radix decimal} {{/mips_cpu_tb/superscaler_mips/decode_state/reg_file/regs[30]} -radix decimal} {{/mips_cpu_tb/superscaler_mips/decode_state/reg_file/regs[31]} -radix decimal}} -expand -subitemconfig {{/mips_cpu_tb/superscaler_mips/decode_state/reg_file/regs[0]} {-height 16 -radix decimal} {/mips_cpu_tb/superscaler_mips/decode_state/reg_file/regs[1]} {-height 16 -radix decimal} {/mips_cpu_tb/superscaler_mips/decode_state/reg_file/regs[2]} {-height 16 -radix decimal} {/mips_cpu_tb/superscaler_mips/decode_state/reg_file/regs[3]} {-height 16 -radix decimal} {/mips_cpu_tb/superscaler_mips/decode_state/reg_file/regs[4]} {-height 16 -radix decimal} {/mips_cpu_tb/superscaler_mips/decode_state/reg_file/regs[5]} {-height 16 -radix decimal} {/mips_cpu_tb/superscaler_mips/decode_state/reg_file/regs[6]} {-height 16 -radix decimal} {/mips_cpu_tb/superscaler_mips/decode_state/reg_file/regs[7]} {-height 16 -radix decimal} {/mips_cpu_tb/superscaler_mips/decode_state/reg_file/regs[8]} {-height 16 -radix decimal} {/mips_cpu_tb/superscaler_mips/decode_state/reg_file/regs[9]} {-height 16 -radix decimal} {/mips_cpu_tb/superscaler_mips/decode_state/reg_file/regs[10]} {-height 16 -radix decimal} {/mips_cpu_tb/superscaler_mips/decode_state/reg_file/regs[11]} {-height 16 -radix decimal} {/mips_cpu_tb/superscaler_mips/decode_state/reg_file/regs[12]} {-height 16 -radix decimal} {/mips_cpu_tb/superscaler_mips/decode_state/reg_file/regs[13]} {-height 16 -radix decimal} {/mips_cpu_tb/superscaler_mips/decode_state/reg_file/regs[14]} {-height 16 -radix decimal} {/mips_cpu_tb/superscaler_mips/decode_state/reg_file/regs[15]} {-height 16 -radix decimal} {/mips_cpu_tb/superscaler_mips/decode_state/reg_file/regs[16]} {-height 16 -radix decimal} {/mips_cpu_tb/superscaler_mips/decode_state/reg_file/regs[17]} {-height 16 -radix decimal} {/mips_cpu_tb/superscaler_mips/decode_state/reg_file/regs[18]} {-height 16 -radix decimal} {/mips_cpu_tb/superscaler_mips/decode_state/reg_file/regs[19]} {-height 16 -radix decimal} {/mips_cpu_tb/superscaler_mips/decode_state/reg_file/regs[20]} {-height 16 -radix decimal} {/mips_cpu_tb/superscaler_mips/decode_state/reg_file/regs[21]} {-height 16 -radix decimal} {/mips_cpu_tb/superscaler_mips/decode_state/reg_file/regs[22]} {-height 16 -radix decimal} {/mips_cpu_tb/superscaler_mips/decode_state/reg_file/regs[23]} {-height 16 -radix decimal} {/mips_cpu_tb/superscaler_mips/decode_state/reg_file/regs[24]} {-height 16 -radix decimal} {/mips_cpu_tb/superscaler_mips/decode_state/reg_file/regs[25]} {-height 16 -radix decimal} {/mips_cpu_tb/superscaler_mips/decode_state/reg_file/regs[26]} {-height 16 -radix decimal} {/mips_cpu_tb/superscaler_mips/decode_state/reg_file/regs[27]} {-height 16 -radix decimal} {/mips_cpu_tb/superscaler_mips/decode_state/reg_file/regs[28]} {-height 16 -radix decimal} {/mips_cpu_tb/superscaler_mips/decode_state/reg_file/regs[29]} {-height 16 -radix decimal} {/mips_cpu_tb/superscaler_mips/decode_state/reg_file/regs[30]} {-height 16 -radix decimal} {/mips_cpu_tb/superscaler_mips/decode_state/reg_file/regs[31]} {-height 16 -radix decimal}} /mips_cpu_tb/superscaler_mips/decode_state/reg_file/regs
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
TreeUpdate [SetDefaultTree]
quietly WaveActivateNextPane
WaveRestoreCursors {{Cursor 1} {159 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 328
configure wave -valuecolwidth 197
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
WaveRestoreZoom {0 ps} {144 ps}
