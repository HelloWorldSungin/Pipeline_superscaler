// file: fetch_tb
module fetch_tb();

//-INPUTS-------------------
reg [31:0] pc_f_0, pc_f_1;
reg [1:0] pcsrc_d_0, pcsrc_d_1;
reg [31:0] pc_predict_d_0, pc_predict_d_1;
reg [31:0] pc_jump_d_0, pc_jump_d_1;



//-OUTPUTS------------------
wire [31:0] instr_f_0;
wire [31:0] instr_f_1;
wire [31:0] pc_plus_8_f_0, pc_plus_8_f_1;
wire [31:0] pcnext_0, pcnext_1;

//-REGISTERS----------------
reg clk;

fetch DUT(
	.pcsrc_d_0(pcsrc_d_0),
	.pcsrc_d_1(pcsrc_d_1),
	.pc_f_0(pc_f_0),
	.pc_f_1(pc_f_1),
	.pc_predict_d_0(pc_predict_d_0),	//pc_branch_d_0
	.pc_predict_d_1(pc_predict_d_1),	//pc_branch_d_1
	.pc_jump_d_0(pc_jump_d_0),
	.pc_jump_d_1(pc_jump_d_1),
	.pc_plus_8_f_0,
	.pc_plus_8_f_1,
	.instr_f_0,
	.instr_f_1,
	.pcnext_0,
	.pcnext_1
);

always #10 clk = ~clk;

initial begin
	clk = 0;
	pc_f_0 = 32'd0; 
	pc_f_1 = pc_f_0 + 4;
	pcsrc_d_0 = 2'd0;
	pcsrc_d_1 = 2'd0;
	pc_predict_d_0 = 32'd0;
	pc_predict_d_1 = 32'd0;
	pc_jump_d_0 = 32'd0;
	pc_jump_d_1 = 32'd0;
	#20;
	pc_f_0 = 32'd8; 
	pc_f_1 = pc_f_0 + 4;
	pcsrc_d_0 = 2'd0;
	pcsrc_d_1 = 2'd0;
	pc_predict_d_0 = 32'd0;
	pc_predict_d_1 = 32'd0;
	pc_jump_d_0 = 32'd0;
	pc_jump_d_1 = 32'd0;
	#20;
	pc_f_0 = 32'd4; 
	pc_f_1 = pc_f_0 + 4; 
	pcsrc_d_0 = 2'd1;
	pcsrc_d_1 = 2'd2;
	pc_predict_d_0 = 32'd0;
	pc_predict_d_1 = 32'd0;
	pc_jump_d_0 = 32'd0;
	pc_jump_d_1 = 32'd8;
	#20;

end
endmodule