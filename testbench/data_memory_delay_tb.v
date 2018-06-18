

module data_memory_delay_tb ();

localparam RAM_DEPTH = 256;
//--Declare Simulation Parameters------------------------------------
reg clk;
reg reset;
reg rd_en;
reg wr_en;
reg [31:0] addr;
reg [31:0] wdata;
//
wire mem_rdy;
wire [31:0] rdata;

integer rand;

//--Clock Generator (20 clocks/cycle)--------------------------------
always #10 clk = ~clk;

//--Initialize the data memory unit----------------------------------
data_memory_delay dmem_dut (
							.clk(clk),
							.reset(reset),
							.wr_en(wr_en),
							.rd_en(rd_en),
							.addr(addr),
							.wdata(wdata),
							.ready(mem_rdy),
							.rdata(rdata)
						   );

//--Main Stimulus Generation-----------------------------------------
initial begin
	clk <= 1;
	reset <= 1;
	wr_en <= 0;
	rd_en <= 0;
	addr <= 0;
	wdata <= 0;
	#20
	reset <= 0;
	#20
	wr_en <= 1;
	//rand <= {$random} % (4096);
	wdata <= {$random} % (4096);
	addr <= {$random} % (RAM_DEPTH-1);
	#20
	wr_en <= 0;
	wdata <= 0;
	addr <= 0;
	
	repeat (10)
	begin
		#600
		rd_en <= 1;
		addr <= {$random} % (RAM_DEPTH-1);
		#20
		rd_en <= 0;
		addr <= 0;
		#600
		wr_en <= 1;
		//rand <= {$random} % (4096);
		wdata <= {$random} % (4096);
		addr <= {$random} % (RAM_DEPTH-1);
		#20
		wr_en <= 0;
		wdata <= 0;
		addr <= 0;
	end
end
//--Monitor Simulation Results-------------------------------------
initial begin
	$monitor (
		"@%d: rd_en=%b, wr_en=%b, addr=%d, wr_data=%d, rd_data=%d",
		$time, rd_en, wr_en, addr, wdata, rdata
	);
end

endmodule
