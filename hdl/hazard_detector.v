//
// FILE: hazard_detector.v
//
//

module hazard_detector (
				jump0_id,			jump1_id,
				branch0_id,			branch1_id,
				takebranch0_id,		takebranch1_id,
				rs0_id,				rs1_id,
				rt0_id,				rt1_id,
				rd0_id,				rd1_id,
				regwrite0_exe,		regwrite1_exe,
				memtoreg0_exe,		memtoreg1_exe,
				rt0_exe,			rt1_exe,
				writereg0_exe,		writereg1_exe,
				memtoreg0_mem,		memtoreg1_mem,
				writereg0_mem,		writereg1_mem,
				memread0_mem, 		memread1_mem,
				memwrite0_mem, 		memwrite1_mem,
				stall_latch_mem,
				cache_hit_mem,		valid_dirty_mem,
				flush0_id,			flush1_id,
				flush0_exe, 		flush1_exe,
				flush0_wb, 			flush1_wb,
				stall0_if, 			stall1_if,
				stall0_id, 			stall1_id,
				stall0_exe, 		stall1_exe,
				stall0_mem, 		stall1_mem
);
// Input Ports
input 			jump0_id,			jump1_id;
input 			branch0_id,			branch1_id;
input 			takebranch0_id,		takebranch1_id;
input [4:0] 	rs0_id,				rs1_id;
input [4:0] 	rt0_id,				rt1_id;
input [4:0] 	rd0_id,				rd1_id;
input 			regwrite0_exe,		regwrite1_exe;
input 			memtoreg0_exe,		memtoreg1_exe;
input [4:0] 	rt0_exe,			rt1_exe;
input [4:0] 	writereg0_exe,		writereg1_exe;
input 			memtoreg0_mem,		memtoreg1_mem;
input [4:0]		writereg0_mem,		writereg1_mem;
input 			memread0_mem, 		memread1_mem;
input 			memwrite0_mem, 		memwrite1_mem;
input 			stall_latch_mem,	cache_hit_mem,	valid_dirty_mem;
// Output Ports
output reg 		flush0_id,			flush1_id;
output reg 		flush0_exe, 		flush1_exe;
output reg 		flush0_wb, 			flush1_wb;
output reg 		stall0_if, 			stall1_if;
output reg 		stall0_id, 			stall1_id;
output reg 		stall0_exe, 		stall1_exe;
output reg 		stall0_mem, 		stall1_mem;


wire loaduse_haz0, loaduse_haz1, loaduse_haz2, loaduse_haz3;
wire loaduse_stall;

assign loaduse_haz0 = memtoreg0_exe && (rs0_id == rt0_exe || rt0_id == rt0_exe);
//assign loaduse_haz1 = memtoreg0_exe && (rs1_id == rt0_exe || rt1_id == rt0_exe);
//assign loaduse_haz2 = memtoreg1_exe && (rs0_id == rt1_exe || rt0_id == rt1_exe);
assign loaduse_haz3 = memtoreg1_exe && (rs1_id == rt1_exe || rt1_id == rt1_exe);

assign loaduse_stall = loaduse_haz0 | loaduse_haz3;


wire branchexe_haz0, branchexe_haz1, branchexe_haz2, branchexe_haz3;
wire branchmem_haz0, branchmem_haz1, branchmem_haz2, branchmem_haz3;
wire branch_stall;

assign branchexe_haz0 = branch0_id
						& regwrite0_exe 
						& (writereg0_exe == rs0_id | writereg0_exe == rt0_id);
assign branchexe_haz1 = branch0_id
						& regwrite0_exe 
						& (writereg0_exe == rs1_id | writereg0_exe == rt1_id);
assign branchexe_haz2 = branch0_id
						& regwrite1_exe 
						& (writereg1_exe == rs0_id | writereg1_exe == rt0_id);
assign branchexe_haz3 = branch0_id
						& regwrite1_exe 
						& (writereg1_exe == rs1_id | writereg1_exe == rt1_id);

assign branchmem_haz0 = branch0_id
						& memtoreg0_mem
						& (writereg0_mem == rs0_id | writereg0_mem == rt0_id);
assign branchmem_haz1 = branch0_id
						& memtoreg0_mem
						& (writereg0_mem == rs1_id | writereg0_mem == rt1_id);
assign branchmem_haz2 = branch0_id
						& memtoreg1_mem
						& (writereg1_mem == rs0_id | writereg1_mem == rt0_id);
assign branchmem_haz3 = branch0_id
						& memtoreg1_mem
						& (writereg1_mem == rs1_id | writereg1_mem == rt1_id);

assign branch_stall = 	branchexe_haz0 | branchexe_haz1
						| branchexe_haz2 | branchexe_haz3
						| branchmem_haz0 | branchmem_haz1
						| branchmem_haz2 | branchmem_haz3;

assign mem_stall = stall_latch_mem;

//(memread0_mem | memwrite0_mem | memread1_mem | memwrite1_mem) & (valid_dirty_mem | stall_latch_mem) & ~cache_hit;

always @ (*) begin
	{flush0_id, flush0_exe, flush0_wb, stall0_if, stall0_id, stall0_exe, stall0_mem} = 'bx;
	{flush1_id, flush1_exe, flush1_wb, stall1_if, stall1_id, stall1_exe, stall1_mem} = 'bx;

	if (mem_stall) begin

		stall0_mem = mem_stall;
		stall0_exe = stall0_mem;
		flush0_wb = stall0_mem;
		stall0_id = stall0_mem;
		stall0_if = stall0_mem;

		stall1_mem = mem_stall;
		stall1_exe = stall1_mem;
		flush1_wb = stall1_mem;
		stall1_id = stall1_mem;
		stall1_if = stall1_mem;

		flush0_id = 0;		flush1_id = 0;
		flush0_exe = 0;		flush1_exe = 0;
	end

	else if (loaduse_stall) begin
		
		stall0_id = 1;
		stall0_if = stall0_id;
		flush0_exe = stall0_id;

		stall1_id = 1;
		stall1_if = stall1_id;
		flush1_exe = stall1_id;
	
		flush0_id = 0;		flush1_id = 0;
		flush0_wb = 0;		flush1_wb = 0;
		stall0_exe = 0;		stall1_exe = 0;
		stall0_mem = 0;		stall1_mem = 0;
	end
	//else if (takebranch0_id | jump0_id) begin
	//	flush_d = 1'b1;
	//end

	else begin
		{flush0_id, flush0_exe, flush0_wb, stall0_if, stall0_id, stall0_exe, stall0_mem} = 0;
		{flush1_id, flush1_exe, flush1_wb, stall1_if, stall1_id, stall1_exe, stall1_mem} = 0;
	end
end


endmodule
/*
///--Branch Control Hazard-----------------------------------------------------
// In our pipline the branch condition is resolved in the ID stage which
//   creates the possibility of a hazard where the branch condition is data-
//   dependent on the destination register of the previous instruction loaded
//   from memory. As a result, when a branch is being "decoded" in ID,
//   its operand may not be ready.
//   If the dependedent data is being computed by 
///
assign branch_haz_e = branch_d & regwrite_e & (writereg_e == rs_d | writereg_e == rt_d);
assign branch_haz_m = branch_d & memtoreg_m & (writereg_m == rs_d | writereg_m == rt_d);
assign branch_stall = branch_haz_e | branch_haz_m;

///--LOAD-USE Data Hazard----------------------
// Stall uder the this condition by setting the following signals:
//  - stall_f, stall_d, flush_e all equal tp 1'b1.
///
assign lw_use_haz = (memtoreg_e & ((rs_d == rt_e) | (rt_d == rt_e)));
assign lw_stall = lw_use_haz;

assign data_stall = branch_stall | lw_stall;
//assign {stall_f, stall_d, stall_e, stall_m,
//		flush_e, flush_d, flush_w} = (data_stall) ? 7'b111_0000 : 7'b000_0000;


///--MEMORY Data Hazard---------------------------------
// With the addition of a new abstraction model for the main data memory
//  unit, a new type of data hazard was introduced into our pipeline:
//    - Now that it takes 20 clock cycles to read(load) or write(store)
//      anything from memory, the balance in the execution time amongst
//      stages is no longer ideal.
//    - To accomodate this reality while maintaining the integrity of our
//      pipeline, we must set handle the hazards it creates.
///
// set stall_f, stall_d, stall_e, stall_m, and flush_w all to 1'b1
// this will create a "bubble" or "noop"

assign mem_stall = (memread_m | memwrite_m) & ~memready_m;
//assign mem_stall = (memread_m | memwrite_m);


wire new_branch;
assign new_branch = (~branchtaken_e & branchfound_e) | (branchtaken_e & ~branchfound_e);

always @ (*) begin
	{stall_f, stall_d, flush_d, flush_e, stall_e, stall_m, flush_w} = 7'b0000000;

	if (new_branch) begin
		flush_d = new_branch;
		flush_e = flush_d;
	end
	
	else if (jump_d) begin
		flush_d = 1'b1;
	end

	else if (data_stall) begin
		stall_d = data_stall;
		stall_f = stall_d;
		flush_e = stall_d;
	end
end

endmodule

*/