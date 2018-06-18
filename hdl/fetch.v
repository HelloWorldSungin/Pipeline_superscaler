// file: fetch.v
module fetch(
	rewind,
	pcsrc_d_0,
	pcsrc_d_1,
	pc_f_0,
	pc_f_1,
	pc_predict_d_0,	//pc_branch_d_0
	pc_predict_d_1,	//pc_branch_d_1
	pc_jump_d_0,
	pc_jump_d_1,

	pc_plus_8_f_0,
	pc_plus_8_f_1,
	instr_f_0,
	instr_f_1,
	pcnext_0,
	pcnext_1
);

//-PARAMETERS----------------------
parameter PC_WIDTH = 32;
parameter INSTR_WITDH = 32;

//-INPUTS--------------------------
input rewind;
input [1:0] pcsrc_d_0, pcsrc_d_1;
input [PC_WIDTH-1:0] pc_f_0;
input [PC_WIDTH-1:0] pc_f_1;
input [PC_WIDTH-1:0] pc_predict_d_0,pc_predict_d_1;
input [PC_WIDTH-1:0] pc_jump_d_0, pc_jump_d_1;

//-OUTPUTS-------------------------
output [PC_WIDTH-1:0] 		pc_plus_8_f_0;
output [PC_WIDTH-1:0] 		pc_plus_8_f_1;
output [INSTR_WITDH-1:0] 	instr_f_0;
output [INSTR_WITDH-1:0] 	instr_f_1;
output [PC_WIDTH-1:0]	 	pcnext_0, pcnext_1;

//-WIRES---------------------------


//-ASSIGNMENTS---------------------
assign pc_plus_8_f_0 = rewind ? pc_f_0 + 4 : pc_f_0 + 8;
assign pc_plus_8_f_1 = rewind ? pc_f_1 + 4 : pc_f_1 + 8;

mux3 #(32) next_pc_mux_0 (
	.select(pcsrc_d_0),
	.d0(pc_plus_8_f_0),
	.d1(pc_predict_d_0),
	.d2(pc_jump_d_0),
	.out(pcnext_0)
);

mux3 #(32) next_pc_mux_1 (
	.select(pcsrc_d_1),
	.d0(pc_plus_8_f_1),
	.d1(pc_predict_d_1),
	.d2(pc_jump_d_1),
	.out(pcnext_1)
);


inst_memory inst_memory(
	.address_0(pc_f_0),
	.address_1(pc_f_1),
	.rd_data_0(instr_f_0),
	.rd_data_1(instr_f_1)
);

endmodule