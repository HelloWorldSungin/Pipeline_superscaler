module mips_cpu_tb();
//-inputs------------------------------------------
reg clk, reset;

//-outputs-----------------------------------------
wire [31:0] pc_f_0, pc_f_1;
wire [31:0] instr_d_0, instr_d_1;
wire [31:0] rfout1_e_0, rfout2_e_0, rfout1_e_1, rfout2_e_1;
wire [31:0] aluout_m_0, aluout_m_1, readdata_m_0, readdata_m_1;
//-regs--------------------------------------------
reg [31:0] cycle_num;

mips_cpu superscaler_mips(
	//Inputs
	.clk(clk), 
	.reset(reset),
	//Outputs
	//fetch
	.pc_f_0(pc_f_0),
	.pc_f_1(pc_f_1),
	//decode
	.instr_d_0(instr_d_0),
	.instr_d_1(instr_d_1),
	//execute
	.rfout1_e_0(rfout1_e_0),
	.rfout2_e_0(rfout2_e_0),
	.rfout1_e_1(rfout1_e_1), 
	.rfout2_e_1(rfout2_e_1),
	//memory
	.aluout_m_0(aluout_m_0), 
	.aluout_m_1(aluout_m_1),
	.readdata_m_0(readdata_m_0),
	.readdata_m_1(readdata_m_1)
);

initial begin
	cycle_num <= 0;
	reset <= 1; #22; reset <= 0;
end

always begin clk <= 1; #10; clk <= 0; #10; end

always @(posedge clk) begin
	if(~reset) cycle_num <= cycle_num + 1;
end

endmodule