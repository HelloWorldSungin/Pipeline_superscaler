module execute(
				//INPUTS
				exe_ctrl_e_0, 	exe_ctrl_e_1,
				rs_e_0,			rs_e_1,
				rt_e_0,			rt_e_1,
				rd_e_0,			rd_e_1,
				rfout1_e_0,		rfout1_e_1,
				rfout2_e_0,		rfout2_e_1,
				forwarda_e_0,	forwarda_e_1,
				forwardb_e_0, 	forwardb_e_1,
				result_w_0, 	result_w_1,
				execout_m_0, 	execout_m_1,
				imm_e_0, 		imm_e_1,

				//OUTPUTS
				//execout_e_0, execout_e_1,
				writereg_e_0,	writereg_e_1,
				aluout_e_0,		aluout_e_1,
				writedata_e_0,	writedata_e_1
);

//-INPUTS--------------------------
input [8:0]		exe_ctrl_e_0,	exe_ctrl_e_1;
input [4:0]		rs_e_0,			rs_e_1;
input [4:0] 	rt_e_0,			rt_e_1;
input [4:0] 	rd_e_0,			rd_e_1;
input [31:0]	rfout1_e_0,		rfout1_e_1;
input [31:0]	rfout2_e_0,		rfout2_e_1;
input [2:0]		forwarda_e_0,	forwarda_e_1;
input [2:0]		forwardb_e_0,	forwardb_e_1;
input [31:0]	result_w_0,		result_w_1;
input [31:0]	execout_m_0, 	execout_m_1;
input [31:0]	imm_e_0,		imm_e_1;

//-OUTPUS--------------------------
//output [31:0] execout_e_0, execout_e_1;
output [4:0]	writereg_e_0,	writereg_e_1;
output [31:0]	aluout_e_0,		aluout_e_1;
output [31:0]	writedata_e_0,	writedata_e_1;

//-WIRES---------------------------
// control wires
wire 			regdst_e_0, 		regdst_e_1;
wire 			alusrc_e_0, 		alusrc_e_1;
wire [3:0]		aluctrl_e_0,		aluctrl_e_1;
wire 			startmult_e_0,  	startmult_e_1;
wire 			multsign_e_0,		multsign_e_1;
wire [1:0] 		outselect_e_0, 		outselect_e_1;
wire 			outputbranch_e_0, 	outputbranch_e_1;
// datapath wires
wire [31:0] 	srca_e_0, 			srca_e_1;
wire [31:0] 	srcb_e_0,			srcb_e_1;

//-REGS----------------------------


//-ASSIGNMENTS---------------------
assign {regdst_e_0, alusrc_e_0, aluctrl_e_0, startmult_e_0, multsign_e_0, outputbranch_e_0} = exe_ctrl_e_0;
assign {regdst_e_1, alusrc_e_1, aluctrl_e_1, startmult_e_1, multsign_e_1, outputbranch_e_1} = exe_ctrl_e_1;
//assign result_w_0_out = forwarda_e_0[2] ? result_w_0 : result_w_1;		//not too sure about the forward here
//assign execout_m_0_out = forwardb_e_0[2] ? execout_m_0 : execout_m_1;		//not too sure about the forward here
//assign result_w_1_out = forwarda_e_1[2] ? result_w_0 : result_w_1;		//not too sure about the forward here
//assign execout_m_1_out = forwardb_e_1[2] ? execout_m_0 : execout_m_1;		//not too sure about the forward here

//-LOGICS0-------------------------

assign srca_e_0 = 	(forwarda_e_0 == 3'b000) ? rfout1_e_0 :
					(forwarda_e_0 == 3'b001) ? result_w_0 :
					(forwarda_e_0 == 3'b010) ? execout_m_0 :
					(forwarda_e_0 == 3'b101) ? result_w_1 :
					(forwarda_e_0 == 3'b110) ? execout_m_1 :
					'bx;

//mux3 #(32) srca_mux_EXE_0 (
//	//.select(forwarda_e_0[1:0]),
//	.select(2'b00),
//	.d0(rfout1_e_0),
//	.d1(result_w_0_out),
//	.d2(execout_m_0_out),
//	.out(srca_e_0)
//);

assign writedata_e_0 = 	(forwardb_e_0 == 3'b000) ? rfout2_e_0 :
						(forwardb_e_0 == 3'b001) ? result_w_0 :
						(forwardb_e_0 == 3'b010) ? execout_m_0 :
						(forwardb_e_0 == 3'b101) ? result_w_1 :
						(forwardb_e_0 == 3'b110) ? execout_m_1 :
						'bx;
//mux3 #(32) wde_mux_EXE_0 (
//	//.select(forwarda_e_0[1:0]),
//	.select(2'b00),
//	.d0(rfout2_e_0),
//	.d1(32'bx),
//	.d2(32'bx),
//	.out(writedata_e_0)
//);

assign srcb_e_0 = alusrc_e_0 ? imm_e_0 : writedata_e_0;
//mux2 #(32) srcb_mux_EXE_0 (
//	.select(alusrc_e_0),
//	.d0(writedata_e_0),
//	.d1(imm_e_0),
//	.out(srcb_e_0)
//);

ALU alu_EXE_0 (
	.In1(srca_e_0),
	.In2(srcb_e_0),
	.Func(aluctrl_e_0),
	.ALUout(aluout_e_0)
);


/*
mux4 #(32) execout_mux_0 (
	.select(outselect_e_0),
	.d0(aluout_e_0),
	.d1(upperimm_e_0),
	.d2(32'bx),
	.d3(32'bx),
	.out(execout_e_0)
);
*/

mux2 #(5) writereg_instr_mux_0 (
	.select(regdst_e_0),
	.d0(rt_e_0),
	.d1(rd_e_0),
	.out(writereg_e_0)
);
//-LOGICS1-------------------------

assign srca_e_1 = 	(forwarda_e_1 == 3'b000) ? rfout1_e_1 :
					(forwarda_e_1 == 3'b001) ? result_w_0 :
					(forwarda_e_1 == 3'b010) ? execout_m_0 :
					(forwarda_e_1 == 3'b101) ? result_w_1 :
					(forwarda_e_1 == 3'b110) ? execout_m_1 :
					'bx;
//mux3 #(32) srca_mux_EXE_1 (
//	.select(forwarda_e_1[1:0]),
//	.d0(rfout1_e_1),
//	.d1(result_w_1_out),
//	.d2(execout_m_1_out),
//	.out(srca_e_1)
//);

assign writedata_e_1 = 	(forwardb_e_1 == 3'b000) ? rfout2_e_1 :
						(forwardb_e_1 == 3'b001) ? result_w_0 :
						(forwardb_e_1 == 3'b010) ? execout_m_0 :
						(forwardb_e_1 == 3'b101) ? result_w_1 :
						(forwardb_e_1 == 3'b110) ? execout_m_1 :
						'bx;
//mux3 #(32) wde_mux_EXE_1 (
//	//.select(forwardb_e_1[1:0]),
//	.select(2'b00),
//	.d0(rfout2_e_1),
//	.d1(32'bx),
//	.d2(32'bx),
//	.out(writedata_e_1)
//);

assign srcb_e_1 = alusrc_e_1 ? imm_e_1 : writedata_e_1;
//mux2 #(32) srcb_mux_EXE_1 (
//	.select(alusrc_e_1),
//	.d0(writedata_e_1),
//	.d1(imm_e_1),
//	.out(srcb_e_1)
//);

ALU alu_EXE_1 (
	.In1(srca_e_1),
	.In2(srcb_e_1),
	.Func(aluctrl_e_1),
	.ALUout(aluout_e_1)
);
/*
mux4 #(32) execout_mux_1 (
	.select(outselect_e_1),
	.d0(aluout_e_1),
	.d1(upperimm_e_1),
	.d2(32'bx),
	.d3(32'bx),
	.out(execout_e_1)
);
*/

mux2 #(5) writereg_instr_mux_1 (
	.select(regdst_e_1),
	.d0(rt_e_1),
	.d1(rd_e_1),
	.out(writereg_e_1)
);

endmodule