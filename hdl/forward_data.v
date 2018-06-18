//
// FILE: forward_data.v
//
//

module data_forward (
						rs0_id,			rs1_id,
						rt0_id,			rt1_id,
						rs0_exe,		rs1_exe,
						rt0_exe,		rt1_exe,
						regwrite0_mem,	regwrite1_mem,
						regwrite0_wb,	regwrite1_wb,
						writereg0_mem,	writereg1_mem,
						writereg0_wb,	writereg1_wb,
						forwardA0_id,	forwardA1_id,
						forwardB0_id,	forwardB1_id,
						forwardA0_exe,	forwardA1_exe,
						forwardB0_exe,	forwardB1_exe
);
// Input Ports
input [4:0] 		rs0_id,			rs1_id;
input [4:0]			rt0_id,			rt1_id;
input [4:0]			rs0_exe,		rs1_exe;
input [4:0]			rt0_exe,		rt1_exe;
input 				regwrite0_mem,	regwrite1_mem;
input 				regwrite0_wb,	regwrite1_wb;
input [4:0]			writereg0_mem,	writereg1_mem;
input [4:0]			writereg0_wb,	writereg1_wb;
// Output Ports
output [1:0]		forwardA0_id,	forwardA1_id;
output [1:0]		forwardB0_id,	forwardB1_id;
output reg [2:0]	forwardA0_exe,	forwardA1_exe;
output reg [2:0]	forwardB0_exe,	forwardB1_exe;

assign forwardA0_id = 2'b00;
assign forwardB0_id = 2'b00;
assign forwardA1_id = 2'b00;
assign forwardB1_id = 2'b00;

// Forward 
always @ (*) begin
	forwardA0_exe <= 3'b000;
	forwardB0_exe <= 3'b000;
	forwardA1_exe <= 3'b000;
	forwardB1_exe <= 3'b000;
	// Forwarding conditions for srcA0_exe
	if (rs0_exe != 0) begin
		// Forward Data from the EXE/MEM register
		if (rs0_exe == writereg0_mem && regwrite0_mem == 1) begin
			forwardA0_exe <= 3'b010;
		end
		else if (rs0_exe == writereg1_mem && regwrite1_mem == 1) begin
			forwardA0_exe <= 3'b110;
		end
		// Forward Data from the MEM/WB register
		else if (rs0_exe == writereg0_wb && regwrite0_wb == 1) begin
			forwardA0_exe <= 3'b001;
		end
		else if (rs0_exe == writereg1_wb && regwrite1_wb == 1) begin
			forwardA0_exe <= 3'b101;
		end
	end

	// Forwarding conditions for srcB0_exe
	if (rt0_exe != 0) begin
		// Forward Data from the EXE/MEM register
		if (rt0_exe == writereg0_mem && regwrite0_mem == 1) begin
			forwardB0_exe <= 3'b010;
		end
		else if (rt0_exe == writereg1_mem && regwrite1_mem == 1) begin
			forwardB0_exe <= 3'b110; 
		end
		// Forward Data from the MEM/WB register
		else if (rt0_exe == writereg0_wb && regwrite0_wb == 1) begin
			forwardB0_exe <= 3'b001;
		end
		else if (rt0_exe == writereg1_wb && regwrite1_wb == 1) begin
			forwardB0_exe <= 3'b101;
		end
	end


	// Forwarding conditions for srcA1_exe
	if (rs1_exe != 0) begin
		// Forward Data from the EXE/MEM register
		if (rs1_exe == writereg0_mem && regwrite0_mem == 1) begin
			forwardA1_exe <= 3'b010;
		end
		else if (rs1_exe == writereg1_mem && regwrite1_mem == 1) begin
			forwardA1_exe <= 3'b110;
		end
		// Forward Data from the MEM/WB register
		else if (rs1_exe == writereg0_wb && regwrite0_wb == 1) begin
			forwardA1_exe <= 3'b001;
		end
		else if (rs1_exe == writereg1_wb && regwrite1_wb == 1) begin
			forwardA1_exe <= 3'b101;
		end
	end

	// Forwarding conditions for srcB1_exe
	if (rt1_exe != 0) begin
		// Forward Data from the EXE/MEM register
		if (rt1_exe == writereg0_mem && regwrite0_mem == 1) begin
			forwardB1_exe <= 3'b010;
		end
		else if (rt1_exe == writereg1_mem && regwrite1_mem == 1) begin
			forwardB1_exe <= 3'b110; 
		end
		// Forward Data from the MEM/WB register
		else if (rt1_exe == writereg0_wb && regwrite0_wb == 1) begin
			forwardB1_exe <= 3'b001;
		end
		else if (rt1_exe == writereg1_wb && regwrite1_wb == 1) begin
			forwardB1_exe <= 3'b101;
		end
	end
end

endmodule