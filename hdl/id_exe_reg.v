
/*
* ID/EXE Pipeline Register:
*/
module id_exe_reg (
	clk, reset, enable, clr,
	
	exe_ctrl_d,
	mem_ctrl_d,
	wb_ctrl_d,

	rs_d, rt_d, rd_d,
	rfout1_d, rfout2_d,
	imm_d,
	upperimm_d,

	exe_ctrl_e,
	mem_ctrl_e,
	wb_ctrl_e,

	rs_e, rt_e, rd_e,
	rfout1_e, rfout2_e,
	imm_e,
	upperimm_e
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

//--Inputs--------------------------
input clk, enable, reset, clr;
input [8:0] exe_ctrl_d;
input [3:0] mem_ctrl_d;
input [1:0] wb_ctrl_d;
input [4:0] rs_d, rt_d, rd_d;
input [31:0] rfout1_d, rfout2_d;
input [31:0] imm_d;
input [31:0] upperimm_d;

/*
input branchfound_d;
input branchtaken_d;
input [31:0] pc_d;
input [31:0] pcbranch_d;
*/

//--Outputs--------------------------
output reg [8:0]  exe_ctrl_e;
output reg [3:0]  mem_ctrl_e;
output reg [1:0]  wb_ctrl_e;
output reg [4:0]  rs_e, rt_e, rd_e;
output reg [31:0] rfout1_e, rfout2_e;
output reg [31:0] imm_e;
output reg [31:0] upperimm_e;

/*
output reg branchfound_e;
output reg branchtaken_e;
output reg [31:0] pc_e;
output reg [31:0] pcbranch_e;
*/

//--Synchronous (w/ Asynchronous reset)----------------
always @ (posedge clk or posedge reset) begin
	if (reset) begin
		exe_ctrl_e <= 9'd0;
		mem_ctrl_e <= 4'd0;
		wb_ctrl_e <= 2'd0;
		rs_e <= 0;
		rt_e <= 0;
		rd_e <= 0;
		rfout1_e <= 0;
		rfout2_e <= 0;
		imm_e <= 0;
		upperimm_e <= 0;
		/*
		branchfound_e <= 0;
		branchtaken_e <= 0;
		pc_e <= 0;
		pcbranch_e <= 0;
		*/ 
	end
	else begin
		if (enable) begin
			if (clr) begin
				exe_ctrl_e 	<= 9'd0;
				mem_ctrl_e 	<= 4'd0;
				wb_ctrl_e 	<= 2'd0;
				rs_e 		<= 0;
				rt_e 		<= 0;
				rd_e 		<= 0;
				rfout1_e 	<= 0;
				rfout2_e 	<= 0;
				imm_e		<= 0;
				upperimm_e  <= 0;	
	
				/*
				branchfound_e <= 0;
				branchtaken_e <= 0;
				pc_e <= 0;
				pcbranch_e <= 0;
				*/
			end
			else begin
				exe_ctrl_e 	<= exe_ctrl_d;
				mem_ctrl_e 	<= mem_ctrl_d;
				wb_ctrl_e 	<= wb_ctrl_d;
				rs_e 		<= rs_d;
				rt_e 		<= rt_d;
				rd_e 		<= rd_d;
				rfout1_e 	<= rfout1_d;
				rfout2_e 	<= rfout2_d;
				imm_e 		<= imm_d;
				upperimm_e 	<= upperimm_d;
				/*
				branchfound_e <= branchfound_d;
				branchtaken_e <= branchtaken_d;
				pc_e <= pc_d;
				pcbranch_e <= pcbranch_d;
				*/
			end
		end
	end
end//always

endmodule
