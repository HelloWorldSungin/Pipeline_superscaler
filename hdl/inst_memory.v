// file: inst_memory.v


// inst_memory: Instruction Memory

module inst_memory (
	address_0,
	address_1,
	rd_data_0,
	rd_data_1
);
//--Parameters------
parameter ADDR_WIDTH = 32;
parameter DATA_WIDTH = 32;
parameter CAPACITY_B = 64; // [B][bytes]
parameter RAM_DEPTH = CAPACITY_B << 2; // 256
//--Input Ports-----
input [ADDR_WIDTH-1:0] address_0;
input [ADDR_WIDTH-1:0] address_1;
//--Output Ports----
output [DATA_WIDTH-1:0] rd_data_0;
output [DATA_WIDTH-1:0] rd_data_1;

reg [ADDR_WIDTH-1:0] I_RAM [0:RAM_DEPTH-1];

assign rd_data_0 = I_RAM[address_0[ADDR_WIDTH-1:2]];
assign rd_data_1 = I_RAM[address_1[ADDR_WIDTH-1:2]];


//initial $readmemh("branchtest.mem", RAM);
//initial $readmemh("forlooptest.mem", RAM);
//initial $readmemh("simplelw_test.mem", RAM);
//initial $readmemh("swstall_test.mem", RAM);
//initial $readmemh("hazard_test.mem", RAM);
//initial $readmemh("lwstall_test.mem", RAM);
//initial $readmemh("program/bubblesort.mem", I_RAM);
//initial $readmemh("twoAdds.mem", I_RAM);
//initial $readmemh("program/memfile_1st.mem", I_RAM);
//initial $readmemh("program/forwarding.mem", I_RAM);
initial $readmemh("program/hazard.mem", I_RAM);
//initial $readmemh("superscalar_mips/program/lwstall.mem", I_RAM);
//initial $readmemh("program/nestedFor.mem", I_RAM);
//initial $readmemh("program/branch.mem", I_RAM);

endmodule

