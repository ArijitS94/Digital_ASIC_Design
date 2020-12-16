`timescale 1ns/10ps
module AND (y, a, b);
	input  [7:0] a, b;
	output [7:0] y;
	assign y = a & b;
endmodule

module XOR (y, a, b);
	input  [7:0] a, b;
	output [7:0] y;
	assign y = a ^ b;
endmodule

