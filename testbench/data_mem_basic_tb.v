module data_mem_basic_tb();
//-INPUTS------------------------
reg clk, reset;
reg wr_en, rd_en;
reg [31:0] addr;
reg [31:0] wr_data;
//-OUTPUTS-----------------------
wire ready;
wire [31:0] rd_data;

data_memory_basic DUT(
	.clk(clk),
	.reset(reset),
	.ready(ready),
	.wr_en(wr_en),
	.rd_en(rd_en),
	.addr(addr),
	.wr_data(wr_data),
	.rd_data(rd_data)
);

always #10 clk = ~clk;

initial begin
	clk <= 1;
	reset <= 1;
	#40;
	//read
	reset <= 0;
	rd_en <= 1;
	wr_en <= 0;
	addr <= 32'd0;
	#20
	wr_en <= 1;
	rd_en <= 0;
	addr <= 32'd10;
	wr_data <= 32'd15;
	#120;
	wr_en <= 0;
	rd_en <= 0;
	#20
	rd_en <= 1;
	wr_en <= 0;
	addr <= 32'd10;
	#20;
end

endmodule