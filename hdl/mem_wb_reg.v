
module mem_wb_reg (
	clk, reset, clr,
	wb_ctrl_m,
	execout_m,
	readdata_m,
	writereg_m,
	wb_ctrl_w,
	execout_w,
	readdata_w,
	writereg_w
);
//--Input Ports-------------------------------------
input clk, reset, clr;
input [1:0]  wb_ctrl_m;
input [31:0] execout_m;
input [31:0] readdata_m;
input [4:0]	 writereg_m;
//--Output Ports------------------------------------
output reg [1:0]  wb_ctrl_w;
output reg [31:0] execout_w;
output reg [31:0] readdata_w;
output reg [4:0]  writereg_w;

//--Synchronous-----------
always @ (posedge clk or posedge reset) begin
	if (reset) begin
		wb_ctrl_w <= 0;
		execout_w <= 0;
		readdata_w <= 0;
		writereg_w <= 0;
	end else begin
		if (clr) begin
			wb_ctrl_w <= 0;
			execout_w <= 0;
			readdata_w <= 0;
			writereg_w <= 0;
		end else begin
			wb_ctrl_w <= wb_ctrl_m;
			execout_w <= execout_m;
			readdata_w <= readdata_m;
			writereg_w <= writereg_m;
		end
	end
end//always
endmodule
