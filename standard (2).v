`timescale 1ns/10ps
module INVX2 (y, a);
	input a;
	output y;
	assign y = ~a;
endmodule

module NAND2X1 (y, a, b);
	input a, b;
	output y;
	assign y = ~(a & b);
endmodule

module NOR2X1 (y, a, b);
	input a, b;
	output y;
	assign y = ~(a | b);
endmodule

module AOI21X1 (y, a, b, c);
	input a, b, c;
	output y;
	wire q1, q2;
	assign q1 = b & c;
	assign q2 = q1 | a;
	assign y = ~q2;
endmodule

module OAI21X1 (y, a, b, c);
	input a, b, c;
	output y;
	wire q1, q2;
	assign q1 = b | c;
	assign q2 = q1 & a;
	assign y = ~q2;
endmodule

