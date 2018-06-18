//
//
//

module data_memory_delay (
                            clk,
                        	reset,
                        	rd_en,
                        	wr_en,
                        	addr,
                        	wdata,
                        	ready,
                        	rdata
                         );
//--Parameters----------------------------------------------------------------
//parameter CAPACITY = 1'bx;
parameter DATA_WIDTH = 32;
parameter ADDR_WIDTH = 32;
parameter RAM_DEPTH = 256;
parameter DELAY = 4;
//--Input Ports---------------------------------------------------------------
input clk;
input reset;
input rd_en;
input wr_en;
input [ADDR_WIDTH-1:0] addr;
input [DATA_WIDTH-1:0] wdata;
//--Output Ports--------------------------------------------------------------
output reg ready;
output reg [DATA_WIDTH-1:0] rdata;

reg [DATA_WIDTH-1:0] RAM [0:RAM_DEPTH-1];

reg [4:0] t;
reg [2:0] state, next_state;
reg [DATA_WIDTH-1:0] data_latch;
reg [ADDR_WIDTH-1:0] addr_latch;

//--FSM States----------------------------------------------------------------
localparam IDLE = 0;
localparam READING = 2;
localparam WRITING = 3;


integer i;
initial for (i = 0; i < RAM_DEPTH; i = i + 1) RAM[i] <= i;

//--Synchronous Next State Assignment-----------------------------------------
always @ (posedge clk or posedge reset) begin
	if (reset) begin
		state <= IDLE;
	end else begin
		state <= next_state;
	end
end

//--Delay Timer---------------------------------------------------------------
always @ (posedge clk or posedge reset) begin
	if (reset) begin
		t <= 0;
	end else begin
		if (t == DELAY-1) begin
			t <= 0;
		end
		else if (state == READING || state == WRITING) begin
			t <= t + 1;
		end
	end
end
//--Asynchronous Output Assignment--------------------------------------------
always @ (state or t or rd_en or wr_en or addr) begin
	next_state = 'bx;
	//rdata = 'bx;//{BLOCK_SIZE{DATA_WIDTH{1'bx}}};
	ready = 0;

	case (state)
		IDLE: begin
			if (rd_en) begin
                ready = 0;
                //@(posedge rd_en);
                $display("rd_en :: time is %0t",$time); 
				addr_latch = addr;
				next_state = READING;
			end
			else if (wr_en) begin
                ready = 0;
                //@(posedge wr_en);
                $display("wr_en :: time is %0t",$time); 
				addr_latch = addr;
				data_latch = wdata;
				next_state = WRITING;
			end
			else begin
				ready = 1;
				next_state = IDLE;
				rdata = 32'dz;
			end
		end
		READING: begin
			if (t == DELAY-1) begin
				rdata = RAM[addr_latch];
                ready = 1;
				next_state = IDLE;
			end
			else next_state = READING;
		end
		WRITING: begin
			if (t == DELAY-1) begin
				RAM[addr_latch] = data_latch;
                ready = 1;
				next_state = IDLE;
			end
			else next_state = WRITING;
		end
	endcase
end
endmodule

