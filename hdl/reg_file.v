// file: reg_file.v


module reg_file (
	clk,
	reset,
// input/output ports for set 'a' regs
	wr_en_a,
	rd_addr_a0,
	rd_addr_a1,
	wr_addr_a,
	wr_data_a,
	rd_data_a0,
	rd_data_a1,
// input/output ports for set 'b' regs
	wr_en_b,
	rd_addr_b0,
	rd_addr_b1,
	wr_addr_b,
	wr_data_b,
	rd_data_b0,
	rd_data_b1
);
//--Input Ports-------
input clk;
input reset;
input wr_en_a;
input [4:0] rd_addr_a0;
input [4:0] rd_addr_a1;
input [4:0] wr_addr_a;
input [31:0] wr_data_a;
input wr_en_b;
input [4:0] rd_addr_b0;
input [4:0] rd_addr_b1;
input [4:0] wr_addr_b;
input [31:0] wr_data_b;
//--Output Ports------
output reg [31:0] rd_data_a0;
output reg [31:0] rd_data_a1;
output reg [31:0] rd_data_b0;
output reg [31:0] rd_data_b1;
//--Internal Registers-----------------------------------
reg [31:0] regs [0:31];


integer i;
//assign rd_data1 = (rd_reg_addr1 == 0) ? 0 : registers[rd_reg_addr1];
//assign rd_data2 = (rd_reg_addr2 == 0) ? 0 : registers[rd_reg_addr2];


// register writeback happens on posedge clk
// do NOT write to $zero
always @ (posedge clk or posedge reset) begin
	if(reset) begin
		for (i = 0; i < 32; i = i + 1) regs[i] <= i;
		//regs[0] <= 0;
		rd_data_a0 <= 0;
		rd_data_a1 <= 0;
		rd_data_b0 <= 0;
		rd_data_b1 <= 0;
	end else begin
		if (wr_addr_a != 0 && wr_en_a == 1) begin
			regs[wr_addr_a] <= wr_data_a;
		end
		if (wr_addr_b != 0 && wr_en_b == 1) begin
			regs[wr_addr_b] <= wr_data_b;
		end
	end
end


/*
* Forwarding between (MEM) / (WB) stages is handles within the register_file
*  by checking the state of the "write_enable" signal and if the register to
*  to be read has just been written. If so, the requested register can be
*  returned right away using the "write_data" value.
*/
always @ (negedge clk) begin
// reg_0 from set 'a'
	if (rd_addr_a0 == 0) begin
		rd_data_a0 <= 0;
	end else if (wr_en_a == 1 && rd_addr_a0 == wr_addr_a) begin
		rd_data_a0 <= wr_data_a;
	end else begin
		rd_data_a0 <= regs[rd_addr_a0];
	end
// reg_1 from set 'a'
	if (rd_addr_a1 == 0) begin
		rd_data_a1 <= 0;
	end else if (wr_en_a == 1 && rd_addr_a1 == wr_addr_a) begin
		rd_data_a1 <= wr_data_a;
	end else begin
		rd_data_a1 <= regs[rd_addr_a1];
	end

// reg_0 from set 'b'
	if (rd_addr_b0 == 0) begin
		rd_data_b0 <= 0;
	end else if (wr_en_b == 1 && rd_addr_b0 == wr_addr_b) begin
		rd_data_b0 <= wr_data_b;
	end else begin
		rd_data_b0 <= regs[rd_addr_b0];
	end
// reg_1 from set 'b'
	if (rd_addr_b1 == 0) begin
		rd_data_b1 <= 0;
	end else if (wr_en_b == 1 && rd_addr_b1 == wr_addr_b) begin
		rd_data_b1 <= wr_data_b;
	end else begin
		rd_data_b1 <= regs[rd_addr_b1];
	end

end

endmodule

