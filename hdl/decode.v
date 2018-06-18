// filename: decode
module decode(
				clk,
				reset,
				instr_d_0,			instr_d_1,
				pc_plus_8_d_0,		pc_plus_8_d_1,
				forwarda_d_0,		forwarda_d_1,
				forwardb_d_0,		forwardb_d_1,
				execout_m_0,		execout_m_1,
				result_w_0,			result_w_1,
				writeReg_w_0,		writeReg_w_1,
				regWrite_w_0,		regWrite_w_1,
				//controller outputs
				exe_ctrl_d_0,		exe_ctrl_d_1,
				mem_ctrl_d_0,		mem_ctrl_d_1,
				wb_ctrl_d_0,		wb_ctrl_d_1,
				//branch outputs
				pc_jump_d_0,		pc_jump_d_1,
				pc_branch_d_0,		pc_branch_d_1,
				pcsrc_d_0, 			pcsrc_d_1,
				//outputs
				rs_d_0,				rs_d_1,
				rt_d_0,				rt_d_1,
				rd_d_0,				rd_d_1,
				rfout1_d_0,			rfout1_d_1,
				rfout2_d_0,			rfout2_d_1,
				upperimm_d_0, 		upperimm_d_1,
				imm_d_0, 			imm_d_1
);

//-PARAMETERS----------------------
parameter PC_WIDTH = 32;
parameter INSTR_WITDH = 32;

//-INPUTS--------------------------
input clk, reset;
input [INSTR_WITDH-1:0]	instr_d_0,		instr_d_1;
input [PC_WIDTH-1:0]	pc_plus_8_d_0, 	pc_plus_8_d_1;
input [1:0] 			forwarda_d_0,  	forwarda_d_1;
input [1:0] 			forwardb_d_0, 	forwardb_d_1;
input [31:0] 			execout_m_0, 	execout_m_1;
input [31:0] 			result_w_0, 	result_w_1;
input [4:0] 			writeReg_w_0, 	writeReg_w_1;
input 					regWrite_w_0, 	regWrite_w_1;

//-OUTPUS--------------------------
output [8:0] 			exe_ctrl_d_0,	exe_ctrl_d_1;
output [3:0] 			mem_ctrl_d_0,	mem_ctrl_d_1;
output [1:0] 			wb_ctrl_d_0, 	wb_ctrl_d_1;

output [PC_WIDTH-1:0] 	pc_jump_d_0, 	pc_jump_d_1;
output [PC_WIDTH-1:0] 	pc_branch_d_0, 	pc_branch_d_1;
output [1:0] 			pcsrc_d_0, 		pcsrc_d_1;

output [4:0] 			rs_d_0,			rs_d_1;
output [4:0] 			rt_d_0,			rt_d_1;
output [4:0] 			rd_d_0,			rd_d_1;
output [31:0] 			rfout1_d_0, 	rfout1_d_1;
output [31:0] 			rfout2_d_0, 	rfout2_d_1;

output [31:0] 			upperimm_d_0, 	upperimm_d_1;
output [31:0] 			imm_d_0, 		imm_d_1;

//-WIRES---------------------------
wire eq_ne_d_0,		eq_ne_d_1;
wire se_ze_d_0, se_ze_d_1;
wire regdst_d_0, regdst_d_1;
wire alusrc_d_0, alusrc_d_1;
wire [3:0] aluop_d_0, aluop_d_1;
wire startmult_d_0, startmult_d_1, multsign_d_0, multsign_d_1;
wire [1:0] outselect_d_0, outselect_d_1;
wire outputbranch_d_0, outputbranch_d_1;
wire memwrite_d_0, memwrite_d_1, memread_d_0, memread_d_1;
wire regwrite_d_0, regwrite_d_1, memtoreg_d_0, memtoreg_d_1;

wire [31:0] rfread1_d_0,	rfread1_d_1;
wire [31:0] rfread2_d_0, 	rfread2_d_1;
wire [31:0] signimm_d_0, signimm_d_1, zeroimm_d_0, zeroimm_d_1;
wire [PC_WIDTH-1:0] branchoffset_d_0, branchoffset_d_1;

wire [5:0] op_d_0, 		op_d_1;
wire [5:0] func_d_0, 	func_d_1;

//-ASSIGNMENTS---------------------
assign rs_d_0 = instr_d_0[25:21];
assign rt_d_0 = instr_d_0[20:16];
assign rd_d_0 = instr_d_0[15:11];
assign op_d_0 = instr_d_0[31:26];
assign func_d_0 = instr_d_0[5:0];
assign pc_jump_d_0 = {pc_plus_8_d_0[31:28], instr_d_0[25:0], 2'b00};

assign rs_d_1 = instr_d_1[25:21];
assign rt_d_1 = instr_d_1[20:16];
assign rd_d_1 = instr_d_1[15:11];
assign op_d_1 = instr_d_1[31:26];
assign func_d_1 = instr_d_1[5:0];
assign pc_jump_d_1 = {pc_plus_8_d_1[31:28], instr_d_1[25:0], 2'b00};

assign exe_ctrl_d_0 = {regdst_d_0, alusrc_d_0, aluop_d_0, startmult_d_0, multsign_d_0, outputbranch_d_0};
assign mem_ctrl_d_0 = {memwrite_d_0, memread_d_0, outselect_d_0};
assign wb_ctrl_d_0 = {regwrite_d_0, memtoreg_d_0};

assign exe_ctrl_d_1 = {regdst_d_1, alusrc_d_1, aluop_d_1, startmult_d_1, multsign_d_1, outputbranch_d_1};
assign mem_ctrl_d_1 = {memwrite_d_1, memread_d_1, outselect_d_1};
assign wb_ctrl_d_1 = {regwrite_d_1, memtoreg_d_1};

reg_file reg_file(
	.clk(clk),
	.reset(reset),
// input/output ports for set 'a' regs
	.wr_en_a(regWrite_w_0),
	.rd_addr_a0(rs_d_0),
	.rd_addr_a1(rt_d_0),
	.wr_addr_a(writeReg_w_0),
	.wr_data_a(result_w_0),
	.rd_data_a0(rfread1_d_0),
	.rd_data_a1(rfread2_d_0),
// input/output ports for set 'b' regs
	.wr_en_b(regWrite_w_1),
	.rd_addr_b0(rs_d_1),
	.rd_addr_b1(rt_d_1),
	.wr_addr_b(writeReg_w_1),
	.wr_data_b(result_w_1),
	.rd_data_b0(rfread1_d_1),
	.rd_data_b1(rfread2_d_1)
);

//-LOGICS_0------------------------
controller mips_controller_0(
	.op(op_d_0),
	.func(func_d_0),
	.eq_ne(eq_ne_d_0),
	.regwrite(regwrite_d_0),
	.memtoreg(memtoreg_d_0),
	.memread(memread_d_0),
	.memwrite(memwrite_d_0),
	.regdst(regdst_d_0),
	.alusrc(alusrc_d_0),
	.aluctrl(aluop_d_0),
	.startmult(startmult_d_0),
	.multsign(multsign_d_0),
	.outselect(outselect_d_0),
	//jump,
	.branch(outputbranch_d_0),
	.pcsrc(pcsrc_d_0),
	.se_ze(se_ze_d_0)
);

mux3 #(32) rfread1_mux_ID_0 (
	//.select(forwarda_d_0),
	.select(2'b00),
	.d0(rfread1_d_0),
	.d1(execout_m_0),
	.d2(execout_m_1),
	.out(rfout1_d_0)
);

mux3 #(32) rfread2_mux_ID_0 (
	//.select(forwardb_d_0),
	.select(2'b00),
	.d0(rfread2_d_0),
	.d1(execout_m_0),
	.d2(execout_m_1),
	.out(rfout2_d_0)
);

equals branch_eq_ID_0 (
	.srcA(rfout1_d_0),
	.srcB(rfout2_d_0),
	.eq(eq_ne_d_0)
);

signext_16_32 signextend_ID_0 (
	instr_d_0[15:0],
	signimm_d_0
);

sll_2 sll2_word_allign_ID_0 (
	signimm_d_0,
	branchoffset_d_0
);

adder branch_adder_ID_0 (
	branchoffset_d_0,
	pc_plus_8_d_0,
	pc_branch_d_0
);

sll_16 sll16_upperimm_ID_0 (
	instr_d_0[15:0],
	upperimm_d_0
);

zeroext_16_32 zeroextend_ID_0 (
	instr_d_0[15:0],
	zeroimm_d_0
);

mux2 #(32) sign_zero_immediate_mux_ID_0 (
	.select(se_ze_d_0),
	.d0(zeroimm_d_0),
	.d1(signimm_d_0),
	.out(imm_d_0)
);

//-LOGICS_1------------------------
controller mips_controller_1(
	.op(op_d_1),
	.func(func_d_1),
	.eq_ne(eq_ne_d_1),
	.regwrite(regwrite_d_1),
	.memtoreg(memtoreg_d_1),
	.memread(memread_d_1),
	.memwrite(memwrite_d_1),
	.regdst(regdst_d_1),
	.alusrc(alusrc_d_1),
	.aluctrl(aluop_d_1),
	.startmult(startmult_d_1),
	.multsign(multsign_d_1),
	.outselect(outselect_d_1),
	//jump,
	.branch(outputbranch_d_1),
	.pcsrc(pcsrc_d_1),
	.se_ze(se_ze_d_1)
);

mux3 #(32) rfread1_mux_ID_1 (
	//.select(forwarda_d_1),
	.select(2'b00),
	.d0(rfread1_d_1),
	.d1(execout_m_1),
	.d2(execout_m_0),
	.out(rfout1_d_1)
);
mux3 #(32) rfread2_mux_ID_1 (
	//.select(forwardb_d_1),
	.select(2'b00),
	.d0(rfread2_d_1),
	.d1(execout_m_1),
	.d2(execout_m_0),
	.out(rfout2_d_1)
);

equals branch_eq_ID_1 (
	.srcA(rfout1_d_1),
	.srcB(rfout2_d_1),
	.eq(eq_ne_d_1)
);

signext_16_32 signextend_ID_1 (
	instr_d_1[15:0],
	signimm_d_1
);

sll_2 sll2_word_allign_ID_1 (
	signimm_d_1,
	branchoffset_d_1
);

adder branch_adder_ID_1 (
	branchoffset_d_1,
	pc_plus_8_d_1,
	pc_branch_d_1
);

sll_16 sll16_upperimm_ID_1 (
	instr_d_1[15:0],
	upperimm_d_1
);

zeroext_16_32 zeroextend_ID_1 (
	instr_d_1[15:0],
	zeroimm_d_1
);

mux2 #(32) sign_zero_immediate_mux_ID_1 (
	.select(se_ze_d_1),
	.d0(zeroimm_d_1),
	.d1(signimm_d_1),
	.out(imm_d_1)
);
endmodule