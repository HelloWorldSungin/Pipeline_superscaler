

/*
* EXE/MEM Pipeline Register:
*/
module exe_mem_reg (
	clk, reset,
	enable,
	mem_ctrl_e,
	wb_ctrl_e,
	aluout_e,
	writedata_e,
	writereg_e,
	upperimm_e,

	mem_ctrl_m,
	wb_ctrl_m,
	aluout_m,
	writedata_m,
	writereg_m,
	upperimm_m
);
//--Input Ports-------------------------------
input clk, reset, enable;
input [3:0] 	mem_ctrl_e;
input [1:0]		wb_ctrl_e;
input [31:0] 	aluout_e;
input [31:0] 	writedata_e;
input [4:0] 	writereg_e;
input [31:0]	upperimm_e;
//--Outputs-----------------------------------
output reg [3:0] 	mem_ctrl_m;
output reg [1:0]	wb_ctrl_m;
output reg [31:0] 	aluout_m;
output reg [31:0] 	writedata_m;
output reg [4:0] 	writereg_m;
output reg [31:0]	upperimm_m;

always @ (posedge clk or posedge reset) begin
	if (reset) begin
		mem_ctrl_m <= 0;
		wb_ctrl_m <= 0;
		aluout_m <= 0;
		writedata_m <= 0;
		writereg_m <= 0;
		upperimm_m <= 0;
	end
	else begin
		if (enable) begin
			mem_ctrl_m <= mem_ctrl_e;
			wb_ctrl_m <= wb_ctrl_e;
			aluout_m <= aluout_e;
			writedata_m <= writedata_e;
			writereg_m <= writereg_e;
			upperimm_m <= upperimm_e;
		end
	end
end//always

endmodule