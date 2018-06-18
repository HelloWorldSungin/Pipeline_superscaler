//
//
//
//

module memory (
				clk,
				reset,
				aluout_m_0, 		aluout_m_1,
				upperimm_m_0, 		upperimm_m_1,
				mem_ctrl_m_0, 		mem_ctrl_m_1,
				mem_ctrl_e_0,		mem_ctrl_e_1,
				writedata_m_0,		writedata_m_1,
				readdata_m_0,		readdata_m_1,
				execout_m_0,		execout_m_1,
				memready_m,			stall_latch_m,
				cache_hit_m,		valid_dirty_m
);

//-INPUTS----------------------
input 			clk;
input 			reset;
input [31:0] 	aluout_m_0, 		aluout_m_1;
input [31:0] 	upperimm_m_0, 		upperimm_m_1; 
input [3:0] 	mem_ctrl_m_0, 		mem_ctrl_m_1;
input [3:0]		mem_ctrl_e_0,		mem_ctrl_e_1;
input [31:0] 	writedata_m_0, 		writedata_m_1;

//-OUTPUTS---------------------
output [31:0] 	readdata_m_0, 		readdata_m_1;
output [31:0] 	execout_m_0, 		execout_m_1;
output memready_m, stall_latch_m, cache_hit_m, valid_dirty_m;

//-WIRES-----------------------
wire 			memwrite_m_0, 		memwrite_m_1;
wire 			memread_m_0, 		memread_m_1;
wire [1:0] 		outselect_m_0, 		outselect_m_1;
wire 			memwrite_m;
wire 			memread_m;
wire [31:0] 	aluout_m;
wire [31:0] 	writedata_m;
wire [31:0] 	readdata_m;
wire 			stall_m;
//wire 			memready_m;
wire 			cache_miss_m;
wire [1:0]		idle_plus_m;
wire 			cache_reset;


//-REGS------------------------
reg wait_flag;
reg inst_count;

//-ASSIGNMENTS-----------------

assign {memwrite_m_0, memread_m_0,outselect_m_0} = mem_ctrl_m_0;
assign {memwrite_m_1, memread_m_1,outselect_m_1} = mem_ctrl_m_1;

assign memread_m =(inst_count) ? memread_m_1 : memread_m_0;
//assign memread_m = (wait_flag) ? ((inst_count) ? memread_m_1 : memread_m_0) : ((inst_count) ? memread_m_0 : memread_m_1);
assign memwrite_m =(inst_count) ? memwrite_m_1 : memwrite_m_0;
//assign memwrite_m = (wait_flag) ? ((inst_count) ? memwrite_m_1 : memwrite_m_0) : ((inst_count) ? memwrite_m_0 : memwrite_m_1);
assign aluout_m = (inst_count) ? aluout_m_1 : aluout_m_0;
//assign execout_m = (wait_flag) ? ((inst_count) ? execout_m_1 : execout_m_0) : ((inst_count) ? execout_m_0 : execout_m_1);
assign writedata_m = (inst_count) ? writedata_m_1 : writedata_m_0;
//assign writedata_m = (wait_flag) ? ((inst_count) ? writedata_m_1 : writedata_m_0) : ((inst_count) ? writedata_m_0 : writedata_m_1);


assign readdata_m_0 = (!(inst_count) & memready_m & !(memwrite_m_0|memwrite_m_1)) ? readdata_m : 32'dz;
assign readdata_m_1 = (inst_count & memready_m & !(memwrite_m_0|memwrite_m_1)) ? readdata_m : 32'dz;
assign memready_m = !stall_m;
assign cache_reset = mem_ctrl_e_0[3] | mem_ctrl_e_0[2] | mem_ctrl_e_1[3] | mem_ctrl_e_1[2];

data_cache_memory_interface data_memory (
	.clk(clk),
	.reset(cache_reset),
	.RE(memread_m),
	.WE(memwrite_m),
	.WD(writedata_m),
	.addr(aluout_m),
	.RD(readdata_m),
	.stall(stall_m),

	.cache_hit(cache_hit_m),
	.cache_miss(cache_miss_m),
	.valid_dirty(valid_dirty_m),
	.idle_plus(idle_plus_m),
	.stall_latch(stall_latch_m)
);

initial begin
	inst_count = 0;
end

always @ (mem_ctrl_m_0 or mem_ctrl_m_1) begin
	wait_flag = 0;
	if((memwrite_m_0|memread_m_0) & (memwrite_m_1|memread_m_1)) begin
		wait_flag = 1;
		inst_count = 0;
	end
	else if((memwrite_m_0|memread_m_0) & !(memwrite_m_1|memread_m_1)) begin
		inst_count = 0;
	end
	else if(!(memwrite_m_0|memread_m_0) & (memwrite_m_1|memread_m_1)) begin
		inst_count = 1;
	end
end

always @ (memready_m) begin
	if(wait_flag & !inst_count) begin
		@(negedge memready_m);
		inst_count = 1;
		wait_flag = 0;
	end
end

//-LOGIC0-----------------------------------
mux4 #(32) execout_mux_0 (
	.select(outselect_m_0),
	.d0(aluout_m_0),
	.d1(upperimm_m_0),
	.d2(32'bx),
	.d3(32'bx),
	.out(execout_m_0)
);

//-LOGIC1-----------------------------------
mux4 #(32) execout_mux_1 (
	.select(outselect_m_1),
	.d0(aluout_m_1),
	.d1(upperimm_m_1),
	.d2(32'bx),
	.d3(32'bx),
	.out(execout_m_1)
);


endmodule
