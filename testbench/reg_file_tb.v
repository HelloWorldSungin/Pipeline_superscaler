// file: reg_file_tb.v


module reg_file_tb ();
//--Input Registers----
reg clk;
reg reset;
reg wr_en_a;
reg [4:0] rd_addr_a0;
reg [4:0] rd_addr_a1;
reg [4:0] wr_addr_a;
reg [31:0] wr_data_a;
reg wr_en_b;
reg [4:0] rd_addr_b0;
reg [4:0] rd_addr_b1;
reg [4:0] wr_addr_b;
reg [31:0] wr_data_b;
//--Output Wires----
wire [31:0] rd_data_a0;
wire [31:0] rd_data_a1;
wire [31:0] rd_data_b0;
wire [31:0] rd_data_b1;

//--Clock Generator----
always #10 clk = ~clk;

//--DUT Instantiation----
reg_file register_file (
	.clk(clk),
	.reset(reset),
	
	.wr_en_a(wr_en_a),
	.rd_addr_a0(rd_addr_a0),
	.rd_addr_a1(rd_addr_a1),
	.wr_addr_a(wr_addr_a),
	.wr_data_a(wr_data_a),
	.rd_data_a0(rd_data_a0),
	.rd_data_a1(rd_data_a1),
	
	.wr_en_b(wr_en_b),
	.rd_addr_b0(rd_addr_b0),
	.rd_addr_b1(rd_addr_b1),
	.wr_addr_b(wr_addr_b),
	.wr_data_b(wr_data_b),
	.rd_data_b0(rd_data_b0),
	.rd_data_b1(rd_data_b1)
);

//--Test Initialization----
initial begin
	clk <= 1'b0;
	reset <= 1'b1;
	#22;
	reset <= 1'b0;
	#18;
	
	wr_en_a <= 0;
	rd_addr_a0 <= 5'd4;
	rd_addr_a1 <= 5'd5;
	wr_addr_a <= 0;//5'bx;
	wr_data_a <= 0;//32'bx;
	wr_en_b <= 0;
	rd_addr_b0 <= 5'd6;
	rd_addr_b1 <= 5'd7;
	wr_addr_b <= 0;//5'bx;
	wr_data_b <= 0;//32'bx;
	
	#40;
	
	wr_en_a <= 0;
	rd_addr_a0 <= 5'd8;
	rd_addr_a1 <= 5'd9;
	wr_addr_a <= 0;//5'bx;
	wr_data_a <= 0;//32'bx;
	wr_en_b <= 0;
	rd_addr_b0 <= 5'd10;
	rd_addr_b1 <= 5'd11;
	wr_addr_b <= 0;//5'bx;
	wr_data_b <= 0;//32'bx;
	
	#40;

	wr_en_a <= 1;
	wr_data_a <= 32'd40;
	wr_addr_a <= 5'd10;
	wr_en_b <= 0;
	wr_data_b <= 32'd50;
	wr_addr_b <= 5'd20;

	#40;

	wr_en_a <= 0;
	wr_en_b <= 1;

	#40;

	wr_en_a <= 1;
	wr_data_a <= 32'd60;
	wr_addr_a <= 5'd15;
	wr_en_b <= 1;
	wr_data_b <= 32'd70;
	wr_addr_b <= 5'd25;

end




endmodule
