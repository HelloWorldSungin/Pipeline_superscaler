/*
 * file: mips_pipe.v
 */

module mips_cpu (
	//Inputs
	clk, reset,
	//Outputs
	//fetch
	pc_f_0, pc_f_1,

	//decode
	instr_d_0, instr_d_1,

	//execute
	rfout1_e_0, rfout2_e_0,
	rfout1_e_1, rfout2_e_1,

	//memory
	aluout_m_0, aluout_m_1,
	readdata_m_0, readdata_m_1
);
//--PARAMETERS------------------------------------------------------
parameter PC_WIDTH = 32;
parameter INSTR_WITDH = 32;

//--Input Ports-----------------------------------------------------
input clk, reset;

//--Output Ports----------------------------------------------------
output [31:0] pc_f_0, pc_f_1;
output [31:0] instr_d_0, instr_d_1;
output [31:0] rfout1_e_0, rfout2_e_0, rfout1_e_1, rfout2_e_1;
output [31:0] aluout_m_0, aluout_m_1, readdata_m_0, readdata_m_1;

//--Internal Wires--------------------------------------------------
//--fetch---------
//inputs
wire [1:0] pcsrc_d_0, pcsrc_d_1;
wire [PC_WIDTH-1:0] pc_f_0;
wire [PC_WIDTH-1:0] pc_f_1;
wire [PC_WIDTH-1:0] pc_predict_d_0,pc_predict_d_1;
wire [PC_WIDTH-1:0] pc_jump_d_0, pc_jump_d_1;
//outpus
wire [PC_WIDTH-1:0] pc_plus_8_f_0;
wire [PC_WIDTH-1:0] pc_plus_8_f_1;
wire [INSTR_WITDH-1:0] instr_f_0;
wire [INSTR_WITDH-1:0] instr_f_1;
wire [PC_WIDTH-1:0] pcnext_0, pcnext_1;
//--decode---------------------------------------------------------
//inputs
wire clk, reset;
wire [INSTR_WITDH-1:0] instr_d_0, instr_d_1;
wire [PC_WIDTH-1:0] pc_plus_8_d_0, pc_plus_8_d_1;
wire [1:0] forwarda_d_0, forwardb_d_0, forwarda_d_1, forwardb_d_1;
wire [31:0] execout_m_0, execout_m_1;
wire [31:0] result_w_0, result_w_1;
wire [4:0] writeReg_w_0, writeReg_w_1;
wire regWrite_w_0, regWrite_w_1;
//outpus
//control signals 
wire [8:0] exe_ctrl_d_0;
wire [3:0] mem_ctrl_d_0;
wire [1:0] wb_ctrl_d_0;

wire [8:0] exe_ctrl_d_1;
wire [3:0] mem_ctrl_d_1;
wire [1:0] wb_ctrl_d_1;

wire [PC_WIDTH-1:0] pc_branch_d_0, pc_branch_d_1;
wire [4:0] rs_d_0, rt_d_0, rd_d_0;
wire [4:0] rs_d_1, rt_d_1, rd_d_1;
wire [31:0] rfout1_d_0, rfout2_d_0;
wire [31:0] rfout1_d_1, rfout2_d_1;

wire [31:0] upperimm_d_0, upperimm_d_1;
wire [31:0] imm_d_0, imm_d_1;
wire [31:0] pc_d_0, pc_d_1;
//--execute-----------------------------------------------------------
//inputs
wire [8:0] exe_ctrl_e_0, exe_ctrl_e_1;
wire [4:0] rs_e_0, rt_e_0, rd_e_0;
wire [4:0] rs_e_1, rt_e_1, rd_e_1;
wire [31:0] rfout1_e_0, rfout2_e_0;
wire [31:0] rfout1_e_1, rfout2_e_1;
wire [2:0] forwarda_e_0, forwarda_e_1, forwardb_e_0, forwardb_e_1;
wire [31:0] imm_e_0, imm_e_1; 

//outputs
wire [31:0] execout_e_0, execout_e_1;
wire [4:0] writereg_e_0, writereg_e_1;
wire [31:0] aluout_e_0, aluout_e_1;
wire [31:0] writedata_e_0, writedata_e_1;

//wires
wire [31:0] upperimm_e_0, upperimm_e_1;

//control signals
wire [3:0] mem_ctrl_e_0;
wire [1:0] wb_ctrl_e_0;

wire [3:0] mem_ctrl_e_1;
wire [1:0] wb_ctrl_e_1;

//--memory------------------------------------------------------------
//inputs
wire [31:0] aluout_m_0, aluout_m_1;
wire [31:0] upperimm_m_0, upperimm_m_1; 
wire [3:0] mem_ctrl_m_0, mem_ctrl_m_1;
wire [31:0] writedata_m_0, writedata_m_1;

//outpus
wire [31:0] readdata_m_0, readdata_m_1;

//wires
wire [4:0] writereg_m_0, writereg_m_1;
wire stall_latch_m, cache_hit_m, valid_dirty_m;
//control signals
wire [1:0] wb_ctrl_m_0, wb_ctrl_m_1;

//--writeback------
//inputs
wire [1:0]  wb_ctrl_w_0, wb_ctrl_w_1;
wire [31:0] execout_w_0, execout_w_1;
wire [31:0] readdata_w_0, readdata_w_1;
wire [4:0]  writereg_w_0, writereg_w_1;
wire memtoreg_w_0, memtoreg_w_1;
wire regwrite_w_0, regwrite_w_1;

assign memtoreg_w_0 = wb_ctrl_w_0[0];
assign memtoreg_w_1 = wb_ctrl_w_1[0];
assign regwrite_w_0 = wb_ctrl_w_0[1];
assign regwrite_w_1 = wb_ctrl_w_1[1];



wire rewind;
wire [31:0] inst0_new, inst1_new;

wire flush0_id,		flush1_id;
wire flush0_exe, 	flush1_exe;
wire flush0_wb, 	flush1_wb;
wire stall0_if, 	stall1_if;
wire stall0_id, 	stall1_id;
wire stall0_exe, 	stall1_exe;
wire stall0_mem, 	stall1_mem;

wire memready_m;


//--FORWARD----------------------------------------------
data_forward forwarding_unit (
	.rs0_id(rs_d_0),				.rs1_id(rs_d_1),
	.rt0_id(rt_d_0),				.rt1_id(rt_d_1),
	.rs0_exe(rs_e_0),				.rs1_exe(rs_e_1),
	.rt0_exe(rt_e_0),				.rt1_exe(rt_e_1),
	.regwrite0_mem(wb_ctrl_m_0[1]),	.regwrite1_mem(wb_ctrl_m_1[1]),
	.regwrite0_wb(regwrite_w_0),	.regwrite1_wb(regwrite_w_1),
	.writereg0_mem(writereg_m_0),	.writereg1_mem(writereg_m_1),
	.writereg0_wb(writereg_w_0),	.writereg1_wb(writereg_w_1),
	.forwardA0_id(forwarda_d_0),	.forwardA1_id(forwarda_d_1),
	.forwardB0_id(forwardb_d_0),	.forwardB1_id(forwardb_d_1),
	.forwardA0_exe(forwarda_e_0),	.forwardA1_exe(forwarda_e_1),
	.forwardB0_exe(forwardb_e_0),	.forwardB1_exe(forwardb_e_1)
);

//-HAZARD_UNITS------------------------------------------

dual_issue dual_issue(
		.memread0(mem_ctrl_d_0[2]),	    .memread1(mem_ctrl_d_1[2]),	 
        .memwrite0(mem_ctrl_d_0[3]),    .memwrite1(mem_ctrl_d_1[3]),        
 		.branch0(exe_ctrl_d_0[0]),      .branch1(exe_ctrl_d_1[0]),
 		.jump0(pcsrc_d_0[1]),          	.jump1(pcsrc_d_1[1]),
		.regwrite0(wb_ctrl_d_0[1]),  	.regwrite1(wb_ctrl_d_1[1]),
		.regdst0(exe_ctrl_d_0[7]),    	.regdst1(exe_ctrl_d_1[7]),
		.inst0_old(instr_d_0),      	.inst1_old(instr_d_1),
		.rs0(instr_d_0[25:21]),         .rs1(instr_d_1[25:21]),
		.rt0(instr_d_0[20:16]),         .rt1(instr_d_1[20:16]),
		.rd0(instr_d_0[15:11]),         .rd1(instr_d_1[15:11]),
		.rewind(rewind),
		.inst0_new(inst0_new),      	.inst1_new(inst1_new)
);


hazard_detector hazard_unit (
		.jump0_id(pcsrc_d_0[1]),			.jump1_id(pcsrc_d_1[1]),
		.branch0_id(exe_ctrl_d_0[0]),		.branch1_id(exe_ctrl_d_1[0]),
		.takebranch0_id(pcsrc_d_0[0]),		.takebranch1_id(pcsrc_d_1[0]),
		.rs0_id(instr_d_0[25:21]),			.rs1_id(instr_d_1[25:21]),
		.rt0_id(instr_d_0[20:16]),			.rt1_id(instr_d_1[20:16]),
		.rd0_id(instr_d_0[15:11]),			.rd1_id(instr_d_1[15:11]),
		.regwrite0_exe(wb_ctrl_e_0[1]),		.regwrite1_exe(wb_ctrl_e_1[1]),
		.memtoreg0_exe(wb_ctrl_e_0[0]),		.memtoreg1_exe(wb_ctrl_e_1[0]),
		.rt0_exe(rt_e_0),					.rt1_exe(rt_e_1),
		.writereg0_exe(writereg_e_0),		.writereg1_exe(writereg_e_1),
		.memtoreg0_mem(wb_ctrl_m_0[0]),		.memtoreg1_mem(wb_ctrl_m_1[0]),
		.writereg0_mem(writereg_m_0),		.writereg1_mem(writereg_m_1),
		.memread0_mem(mem_ctrl_m_0[2]), 	.memread1_mem(mem_ctrl_m_0[2]),
		.memwrite0_mem(mem_ctrl_m_0[3]), 	.memwrite1_mem(mem_ctrl_m_0[3]),
		.stall_latch_mem(stall_latch_m),
		.cache_hit_mem(cache_hit_m),		.valid_dirty_mem(valid_dirty_m),
		.flush0_id(flush0_id),				.flush1_id(flush1_id),
		.flush0_exe(flush0_exe), 			.flush1_exe(flush1_exe),
		.flush0_wb(flush0_wb), 				.flush1_wb(flush1_wb),
		.stall0_if(stall0_if), 				.stall1_if(stall1_if),
		.stall0_id(stall0_id), 				.stall1_id(stall1_id),
		.stall0_exe(stall0_exe), 			.stall1_exe(stall1_exe),
		.stall0_mem(stall0_mem), 			.stall1_mem(stall1_mem)
);

//-PC_REGISTORS------------------------------------------
flopenr0 #(32) if_pc_register_0 (
	.clk(clk),
	.reset(reset),
	.enable(~stall0_if),
	.d(pcnext_0),
	.q(pc_f_0)
);

flopenr1 #(32) if_pc_register_1 (
	.clk(clk),
	.reset(reset),
	.enable(~stall1_if),
	.d(pcnext_1),
	.q(pc_f_1)
);


//-FETCH-------------------------------------------------
fetch fetch_state(
	.rewind(rewind),
	.pcsrc_d_0(pcsrc_d_0),
	.pcsrc_d_1(pcsrc_d_1),
	.pc_f_0(pc_f_0),
	.pc_f_1(pc_f_1),
	.pc_predict_d_0(pc_predict_d_0),	//pc_branch_d_0
	.pc_predict_d_1(pc_predict_d_1),	//pc_branch_d_1
	.pc_jump_d_0(pc_jump_d_0),
	.pc_jump_d_1(pc_jump_d_1),
	.pc_plus_8_f_0(pc_plus_8_f_0),
	.pc_plus_8_f_1(pc_plus_8_f_1),
	.instr_f_0(instr_f_0),
	.instr_f_1(instr_f_1),
	.pcnext_0(pcnext_0),
	.pcnext_1(pcnext_1)
);

if_id_reg if_id_reg_0(
	.clk(clk),
	.reset(reset),
	.enable(~stall0_id),
	.clr(flush0_id),
	.pc_plus_8_f(pc_plus_8_f_0),
	.instr_f(instr_f_0),
	//.branchfound_f(branchfound_f_0),
	.pc_f(pc_f_0),
	.pc_plus_8_d(pc_plus_8_d_0),
	.instr_d(instr_d_0),
	//.branchfound_d(branchfound_d_0),
	.pc_d(pc_d_0)
);

if_id_reg if_id_reg_1(
	.clk(clk),
	.reset(reset),
	.enable(~stall1_id),
	.clr(flush1_id),
	.pc_plus_8_f(pc_plus_8_f_1),
	.instr_f(instr_f_1),
	//.branchfound_f(branchfound_f_1),
	.pc_f(pc_f_1),
	.pc_plus_8_d(pc_plus_8_d_1),
	.instr_d(instr_d_1),
	//.branchfound_d(branchfound_d_1),
	.pc_d(pc_d_1)
);

decode decode_state(
	.clk(clk),
	.reset(reset),
	.instr_d_0(inst0_new),			.instr_d_1(inst1_new),
	.pc_plus_8_d_0(pc_plus_8_d_0),	.pc_plus_8_d_1(pc_plus_8_d_1),
	.forwarda_d_0(forwarda_d_0),	.forwarda_d_1(forwarda_d_1),
	.forwardb_d_0(forwardb_d_0),	.forwardb_d_1(forwardb_d_1),
	.execout_m_0(execout_m_0),		.execout_m_1(execout_m_1),
	.result_w_0(result_w_0),
	.result_w_1(result_w_1),
	.writeReg_w_0(writereg_w_0),
	.writeReg_w_1(writereg_w_1),
	.regWrite_w_0(regwrite_w_0),
	.regWrite_w_1(regwrite_w_1),
	//controller_0 outputs
	.exe_ctrl_d_0(exe_ctrl_d_0),
	.mem_ctrl_d_0(mem_ctrl_d_0),
	.wb_ctrl_d_0(wb_ctrl_d_0),
	//controller_1 outputs
	.exe_ctrl_d_1(exe_ctrl_d_1),
	.mem_ctrl_d_1(mem_ctrl_d_1),
	.wb_ctrl_d_1(wb_ctrl_d_1),
	//branch outputs
	.pc_jump_d_0(pc_jump_d_0),
	.pc_jump_d_1(pc_jump_d_1),
	.pc_branch_d_0(pc_branch_d_0),
	.pc_branch_d_1(pc_branch_d_1),
	.pcsrc_d_0(pcsrc_d_0),
	.pcsrc_d_1(pcsrc_d_1),
	//outputs
	.rs_d_0(rs_d_0),
	.rt_d_0(rt_d_0),
	.rd_d_0(rd_d_0),
	.rs_d_1(rs_d_1),
	.rt_d_1(rt_d_1),
	.rd_d_1(rd_d_1),
	.rfout1_d_0(rfout1_d_0),
	.rfout2_d_0(rfout2_d_0),
	.rfout1_d_1(rfout1_d_1),
	.rfout2_d_1(rfout2_d_1),
	.upperimm_d_0(upperimm_d_0),
	.upperimm_d_1(upperimm_d_1),
	.imm_d_0(imm_d_0),
	.imm_d_1(imm_d_1)
);

id_exe_reg id_exe_reg_0(
	.clk(clk),
	.reset(reset),
	.enable(~stall0_exe),
	.clr(flush0_exe),
	.exe_ctrl_d(exe_ctrl_d_0),
	.mem_ctrl_d(mem_ctrl_d_0),
	.wb_ctrl_d(wb_ctrl_d_0),
	.rs_d(rs_d_0),
	.rt_d(rt_d_0),
	.rd_d(rd_d_0),
	.rfout1_d(rfout1_d_0),
	.rfout2_d(rfout2_d_0),
	.imm_d(imm_d_0),
	.upperimm_d(upperimm_d_0),

	.exe_ctrl_e(exe_ctrl_e_0),
	.mem_ctrl_e(mem_ctrl_e_0),
	.wb_ctrl_e(wb_ctrl_e_0),
	.rs_e(rs_e_0),
	.rt_e(rt_e_0),
	.rd_e(rd_e_0),
	.rfout1_e(rfout1_e_0),
	.rfout2_e(rfout2_e_0),
	.imm_e(imm_e_0),
	.upperimm_e(upperimm_e_0)
	//branch
/* 
	branchfound_d,
	branchtaken_d,
	pc_d,
	pcbranch_d,
	branchfound_e,
	branchtaken_e,
	pc_e,
	pcbranch_e
*/
);


id_exe_reg id_exe_reg_1(
	.clk(clk),
	.reset(reset),
	.enable(~stall1_exe),
	.clr(flush1_exe),
	.exe_ctrl_d(exe_ctrl_d_1),
	.mem_ctrl_d(mem_ctrl_d_1),
	.wb_ctrl_d(wb_ctrl_d_1),
	.rs_d(rs_d_1),
	.rt_d(rt_d_1),
	.rd_d(rd_d_1),
	.rfout1_d(rfout1_d_1),
	.rfout2_d(rfout2_d_1),
	.imm_d(imm_d_1),
	.upperimm_d(upperimm_d_1),

	.exe_ctrl_e(exe_ctrl_e_1),
	.mem_ctrl_e(mem_ctrl_e_1),
	.wb_ctrl_e(wb_ctrl_e_1),
	.rs_e(rs_e_1),
	.rt_e(rt_e_1),
	.rd_e(rd_e_1),
	.rfout1_e(rfout1_e_1),
	.rfout2_e(rfout2_e_1),
	.imm_e(imm_e_1),
	.upperimm_e(upperimm_e_1)
	//branch
/* 
	branchfound_d,
	branchtaken_d,
	pc_d,
	pcbranch_d,
	branchfound_e,
	branchtaken_e,
	pc_e,
	pcbranch_e
*/
);

execute execute_state(
	//INPUTS
	.exe_ctrl_e_0(exe_ctrl_e_0),
	.exe_ctrl_e_1(exe_ctrl_e_1),
	.rs_e_0(rs_e_0),
	.rt_e_0(rt_e_0),
	.rd_e_0(rd_e_0),
	.rs_e_1(rs_e_1),
	.rt_e_1(rt_e_1),
	.rd_e_1(rd_e_1),
	.rfout1_e_0(rfout1_e_0),
	.rfout2_e_0(rfout2_e_0),
	.rfout1_e_1(rfout1_e_1),
	.rfout2_e_1(rfout2_e_1),

	.forwarda_e_0(forwarda_e_0),
	.forwarda_e_1(forwarda_e_1),
	.forwardb_e_0(forwardb_e_0),
	.forwardb_e_1(forwardb_e_1),
	.result_w_0(result_w_0),
	.result_w_1(result_w_1),
	.execout_m_0(execout_m_0),
	.execout_m_1(execout_m_1),
	.imm_e_0(imm_e_0),
	.imm_e_1(imm_e_1),

	//OUTPUTS
	//.execout_e_0(execout_e_0),
	//.execout_e_1(execout_e_1),
	.writereg_e_0(writereg_e_0),
	.writereg_e_1(writereg_e_1),
	.aluout_e_0(aluout_e_0),
	.aluout_e_1(aluout_e_1),
	.writedata_e_0(writedata_e_0), 
	.writedata_e_1(writedata_e_1)
);

exe_mem_reg exe_mem_reg_0(
	.clk(clk),
	.reset(reset),
	.enable(~stall0_mem),

	.mem_ctrl_e(mem_ctrl_e_0),
	.wb_ctrl_e(wb_ctrl_e_0),
	.aluout_e(aluout_e_0),
	.writedata_e(writedata_e_0),
	.writereg_e(writereg_e_0),
	.upperimm_e(upperimm_e_0),

	.mem_ctrl_m(mem_ctrl_m_0),
	.wb_ctrl_m(wb_ctrl_m_0),
	.aluout_m(aluout_m_0),
	.writedata_m(writedata_m_0),
	.writereg_m(writereg_m_0),
	.upperimm_m(upperimm_m_0)
);

exe_mem_reg exe_mem_reg_1(
	.clk(clk),
	.reset(reset),
	.enable(~stall1_mem),

	.mem_ctrl_e(mem_ctrl_e_1),
	.wb_ctrl_e(wb_ctrl_e_1),
	.aluout_e(aluout_e_1),
	.writedata_e(writedata_e_1),
	.writereg_e(writereg_e_1),
	.upperimm_e(upperimm_e_1),

	.mem_ctrl_m(mem_ctrl_m_1),
	.wb_ctrl_m(wb_ctrl_m_1),
	.aluout_m(aluout_m_1),
	.writedata_m(writedata_m_1),
	.writereg_m(writereg_m_1),
	.upperimm_m(upperimm_m_1)
);

memory memory_state(
	//Inputs
	.clk(clk),
	.reset(reset),
	.aluout_m_0(aluout_m_0),
	.aluout_m_1(aluout_m_1),
	.upperimm_m_0(upperimm_m_0),
	.upperimm_m_1(upperimm_m_1),
	.mem_ctrl_m_0(mem_ctrl_m_0),
	.mem_ctrl_m_1(mem_ctrl_m_1),
	.mem_ctrl_e_0(mem_ctrl_e_0),
	.mem_ctrl_e_1(mem_ctrl_e_1),
	.writedata_m_0(writedata_m_0),
	.writedata_m_1(writedata_m_1),
	//Outputs
	.readdata_m_0(readdata_m_0),
	.readdata_m_1(readdata_m_1),
	.execout_m_0(execout_m_0),
	.execout_m_1(execout_m_1),
	.memready_m(memready_m),
	.stall_latch_m(stall_latch_m),
	.cache_hit_m(cache_hit_m),
	.valid_dirty_m(valid_dirty_m)
);

mem_wb_reg mem_wb_reg_0(
	.clk(clk),
	.reset(reset),
	.clr(flush0_wb),
	.wb_ctrl_m(wb_ctrl_m_0),
	.execout_m(execout_m_0),
	.readdata_m(readdata_m_0),
	.writereg_m(writereg_m_0),
	.wb_ctrl_w(wb_ctrl_w_0),
	.execout_w(execout_w_0),
	.readdata_w(readdata_w_0),
	.writereg_w(writereg_w_0)
);

mem_wb_reg mem_wb_reg_1(
	.clk(clk),
	.reset(reset),
	.clr(flush1_wb),
	.wb_ctrl_m(wb_ctrl_m_1),
	.execout_m(execout_m_1),
	.readdata_m(readdata_m_1),
	.writereg_m(writereg_m_1),
	.wb_ctrl_w(wb_ctrl_w_1),
	.execout_w(execout_w_1),
	.readdata_w(readdata_w_1),
	.writereg_w(writereg_w_1)
);

assign result_w_0 = memtoreg_w_0 ? readdata_w_0 : execout_w_0;
assign result_w_1 = memtoreg_w_1 ? readdata_w_1 : execout_w_1;


endmodule
