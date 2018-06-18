module execute_tb();
//-INPUTS-----------------------------------
reg [10:0] exe_ctrl_e_0, exe_ctrl_e_1;
reg [4:0] rs_e_0, rt_e_0, rd_e_0;
reg [4:0] rs_e_1, rt_e_1, rd_e_1;
reg [31:0] rfout1_e_0, rfout2_e_0;
reg [31:0] rfout1_e_1, rfout2_e_1;
reg [2:0] forwarda_e_0, forwarda_e_1, forwardb_e_0, forwardb_e_1;
reg [31:0] result_w_0, result_w_1;
reg [31:0] execout_m_0, execout_m_1;
reg [31:0] upperimm_e_0, upperimm_e_1;
reg [31:0] imm_e_0, imm_e_1;

//-OUTPUTS----------------------------------
wire [31:0] execout_e_0, execout_e_1;
wire [4:0] writereg_e_0, writereg_e_1;

execute DUT(
	//INPUTS
	exe_ctrl_e_0, exe_ctrl_e_1,
	rs_e_0, rt_e_0, rd_e_0,
	rs_e_1, rt_e_1, rd_e_1, 
	rfout1_e_0, rfout2_e_0,
	rfout1_e_1, rfout2_e_1,

	forwarda_e_0, forwarda_e_1, forwardb_e_0, forwardb_e_1,
	result_w_0, result_w_1,
	execout_m_0, execout_m_1,
	upperimm_e_0, upperimm_e_1,
	imm_e_0, imm_e_1, 

	//OUTPUTS
	execout_e_0, execout_e_1,
	writereg_e_0, writereg_e_1
);

initial begin

	//two add instrs
	exe_ctrl_e_0 <= {1'd1, 1'd0, 4'b0100,1'd0, 1'd0, 2'b00, 1'd0};
	rs_e_0 <= 5'd0;
	rt_e_0 <= 5'd2;
	rd_e_0 <= 5'd5;
	rfout1_e_0 <= 32'd0;
	rfout2_e_0 <= 32'd10;
	forwarda_e_0 <= 3'd0;
	forwardb_e_0 <= 3'd0;


	exe_ctrl_e_1 <= {1'd1, 1'd0, 4'b0100,1'd0, 1'd0, 2'b00, 1'd0};
	rs_e_1 <= 5'd20;
	rt_e_1 <= 5'd22;
	rd_e_1 <= 5'd25;
	rfout1_e_1 <= 32'd20;
	rfout2_e_1 <= 32'd30;
	forwarda_e_1 <= 3'd0;
	forwardb_e_1 <= 3'd0;
	#20;

	
end

endmodule
