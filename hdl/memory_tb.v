module memory_tb();
//-INPUTS----------------------
reg clk, reset;
reg [31:0] aluout_m_0, aluout_m_1; 
reg [31:0] upperimm_m_0, upperimm_m_1;
reg [3:0] mem_ctrl_m_0, mem_ctrl_m_1;
reg [31:0] writedata_m_0, writedata_m_1;

//-OUTPUTS---------------------
wire [31:0] readdata_m_0, readdata_m_1;

 memory DUT(
	//Inputs
	.clk(clk), .reset(reset),
	.aluout_m_0(aluout_m_0), .aluout_m_1(aluout_m_1),
	.upperimm_m_0(upperimm_m_0), .upperimm_m_1(upperimm_m_1),
	.mem_ctrl_m_0(mem_ctrl_m_0), .mem_ctrl_m_1(mem_ctrl_m_1),
	.writedata_m_0(writedata_m_0), .writedata_m_1(writedata_m_1),

	//Outputs
	.readdata_m_0(readdata_m_0), .readdata_m_1(readdata_m_1)
);

always #10 clk = ~clk;

initial begin
	clk <= 1;
	reset <= 1;
	#40;
	reset <= 0;
	mem_ctrl_m_0 <= 4'b0000;
	aluout_m_0 <= 32'd10;
	writedata_m_0 <= 32'd30;

	mem_ctrl_m_1 <= 4'b0000;
	aluout_m_1 <= 32'd20;
	writedata_m_1 <= 32'd40;

	#20;
	mem_ctrl_m_0 <= 4'b1000;
	mem_ctrl_m_1 <= 4'b0000;
	#100;

	mem_ctrl_m_0 <= 4'b0100;
	mem_ctrl_m_1 <= 4'b0000;
	#100;

	mem_ctrl_m_0 <= 4'b0000;
	aluout_m_0 <= 32'd50;
	writedata_m_0 <= 32'd60;

	mem_ctrl_m_1 <= 4'b1000;
	aluout_m_1 <= 32'd70;
	writedata_m_1 <= 32'd80;
	#100;

	mem_ctrl_m_0 <= 4'b0000;
	mem_ctrl_m_1 <= 4'b0100;
	#100;

	mem_ctrl_m_0 <= 4'b1000;
	aluout_m_0 <= 32'd3;
	writedata_m_0 <= 32'd2;
	
	mem_ctrl_m_1 <= 4'b1000;
	aluout_m_1 <= 32'd1;
	writedata_m_1 <= 32'd4;
	#200;

	mem_ctrl_m_0 <= 4'b0100;
	aluout_m_0 <= 32'd100;
	writedata_m_0 <= 32'd200;
	
	mem_ctrl_m_1 <= 4'b0100;
	aluout_m_1 <= 32'd12;
	writedata_m_1 <= 32'd400;
	#200;
	$stop;
end


endmodule