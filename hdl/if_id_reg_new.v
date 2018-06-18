

module if_id_reg (
	clk, reset,
	enable, clr,
	
	pc_plus_8_f,
	instr_f,
	//branchfound_f,
	pc_f,

	pc_plus_8_d,
	instr_d,
	//branchfound_d,
	pc_d
);
//-PARAMETERS----------------------
parameter PC_WIDTH = 32;
parameter INSTR_WITDH = 32;

//--Input Ports-------------
input clk, reset, enable, clr;
input [PC_WIDTH-1:0] 		pc_plus_8_f;
input [INSTR_WITDH-1:0] 	instr_f;
//input 					branchfound_f;		
input [PC_WIDTH-1:0] 		pc_f;

//--Output Ports------------
output reg [PC_WIDTH-1:0] 		pc_plus_8_d;
output reg [INSTR_WITDH-1:0] 	instr_d;
//output reg					branchfound_d;
output reg [PC_WIDTH-1:0] 		pc_d;

always @ (posedge clk or posedge reset) begin
	if (reset) begin
		instr_d <= 0;
		pc_plus_8_d <= 0;
		//branchfound_d <= 0;
		pc_d <= 0;
	end
	else begin
		if (enable) begin
			if (clr) begin
				instr_d <= 0;
				pc_plus_8_d <= 0;
				//branchfound_d <= 0;
				pc_d <= 0;
			end
			else begin
				instr_d <= instr_f;
				pc_plus_8_d <= pc_plus_8_f;
				//branchfound_d <= branchfound_f;
				pc_d <= pc_f;
			end
		end
	end
end

endmodule
