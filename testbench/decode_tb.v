module decode_tb();

//-INPUTS---------------------------------
reg clk, reset;
reg [31:0] instr_d_0, instr_d_1;
reg [31:0] pc_plus_8_d_0, pc_plus_8_d_1;
reg [1:0] forwarda_d_0, forwardb_d_0, forwarda_d_1, forwardb_d_1;
reg [31:0] execout_m_0, execout_m_1;
reg [31:0] result_w_0, result_w_1;
reg [4:0] writeReg_w_0, writeReg_w_1;
reg regWrite_w_0, regWrite_w_1;

//-OUTPUTS---------------------------------
wire [10:0] exe_ctrl_d_0;
wire [1:0] mem_ctrl_d_0;
wire [1:0] wb_ctrl_d_0;

wire [14:0] exe_ctrl_d_1;
wire [1:0] mem_ctrl_d_1;
wire [1:0] wb_ctrl_d_1;

wire [31:0] pc_jump_d_0, pc_jump_d_1;
wire [31:0] pc_branch_d_0, pc_branch_d_1;
wire [1:0] pcsrc_d_0, pcsrc_d_1;

wire [4:0] rs_d_0, rt_d_0, rd_d_0;
wire [4:0] rs_d_1, rt_d_1, rd_d_1;
wire [31:0] rfout1_d_0, rfout2_d_0;
wire [31:0] rfout1_d_1, rfout2_d_1;

wire [31:0] upperimm_d_0, upperimm_d_1;
wire [31:0] imm_d_0, imm_d_1;


decode DUT(
	clk,
	reset,
	instr_d_0,
	instr_d_1,
	pc_plus_8_d_0,
	pc_plus_8_d_1,
	forwarda_d_0, forwardb_d_0,
	forwarda_d_1, forwardb_d_1,
	execout_m_0, execout_m_1,
	result_w_0, result_w_1,
	writeReg_w_0, writeReg_w_1,
	regWrite_w_0, regWrite_w_1,
	//controller_0 outputs
	exe_ctrl_d_0,
	mem_ctrl_d_0,
	wb_ctrl_d_0,
	//controller_1 outputs
	exe_ctrl_d_1,
	mem_ctrl_d_1,
	wb_ctrl_d_1,
	//branch outputs
	pc_jump_d_0, pc_jump_d_1,
	pc_branch_d_0, pc_branch_d_1,
	pcsrc_d_0, pcsrc_d_1,
	//outputs
	rs_d_0, rt_d_0, rd_d_0,
	rs_d_1, rt_d_1, rd_d_1,
	rfout1_d_0, rfout2_d_0,
	rfout1_d_1, rfout2_d_1,

	upperimm_d_0, upperimm_d_1,
	imm_d_0, imm_d_1
);

always #10 clk = ~clk;

initial begin
	clk = 1;
	reset = 1;
	#40;
	instr_d_0 = 32'h20100004;
	instr_d_1 = 32'h20110004;
	pc_plus_8_d_0 = 32'd8;
 	pc_plus_8_d_1 = 32'd12;
 	forwarda_d_0 = 0;
 	forwardb_d_0 = 0;
 	forwarda_d_1 = 0;
 	forwardb_d_1 = 0;
 	execout_m_0 = 32'd50;
 	execout_m_1 = 32'd60;
 	result_w_0 = 32'd100;
 	result_w_1 = 32'd110;
 	writeReg_w_0 = 0;
 	writeReg_w_1 = 0;
 	regWrite_w_0 = 0;
 	regWrite_w_1 = 0;
 	#20;


end

endmodule