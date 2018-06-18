
module flopenr0 #(parameter WIDTH=4) (
	input clk, reset, enable,
	input [WIDTH-1:0] d,
	output reg [WIDTH-1:0] q
);
//--Input Ports-----
//--Output Ports----

always @ (posedge clk or posedge reset) begin
	if (reset) q <= 0;
	else if (enable) q <= d;
end//always

endmodule

module flopenr1 #(parameter WIDTH=4) (
	input clk, reset, enable,
	input [WIDTH-1:0] d,
	output reg [WIDTH-1:0] q
);
//--Input Ports-----
//--Output Ports----

always @ (posedge clk or posedge reset) begin
	if (reset) q <= 4;
	else if (enable) q <= d;
end//always

endmodule

