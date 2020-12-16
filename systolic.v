`timescale 1ns/10ps

module systolicH(SUMout, Cout, SUMin, a, b);
	input a, b;
	output SUMout, Cout, SUMin;
	wire w1;
	assign w1 = a & b;
	HalfAdder  HA1(SUMout, Cout, SUMin, w1);
endmodule

module systolicF(SUMout, Cout, SUMin, a, b, Cin);
	input a, b, Cin;
	output SUMout, Cout, SUMin;
	wire w1;
	assign w1 = a & b;
	FullAdder  FA1(SUMout, Cout, SUMin, w1, Cin);
endmodule

module systolicMult4x4(p, a, b);
	input  [3:0] a, b;
	output [7:0] p;
	wire  [11:0] c;
	wire  [11:0] s;
	wire         a0b0, a1b0, a2b0, a3b0;
	
	assign a0b0 = a[0] & b[0];
	assign a1b0 = a[1] & b[0];
	assign a2b0 = a[2] & b[0];
	assign a3b0 = a[3] & b[0];
	assign p[0] = a0b0;
	
	systolicH S00(s[0], c[0], a1b0, a[0], b[1]);
	systolicF S01(s[1], c[1], a2b0, a[1], b[1], c[0]);
	systolicF S02(s[2], c[2], a3b0, a[2], b[1], c[1]);
	systolicH S03(s[3], c[3], c[2], a[3], b[1]);
	systolicH S04(s[4], c[4], s[1], a[0], b[2]);
	systolicF S05(s[5], c[5], s[2], a[1], b[2], c[4]);
	systolicF S06(s[6], c[6], s[3], a[2], b[2], c[5]);
	systolicF S07(s[7], c[7], c[3], a[3], b[2], c[6]);
	systolicH S08(s[8], c[8], s[5], a[0], b[3]);
	systolicF S09(s[9], c[9], s[6], a[1], b[3], c[8]);
	systolicF S10(s[10], c[10], s[7], a[2], b[3], c[9]);
	systolicF S11(s[11], c[11], c[7], a[3], b[3], c[10]);
	
	assign p[1] = s[0];
	assign p[2] = s[4];
	assign p[3] = s[8];
	assign p[4] = s[9];
	assign p[5] = s[10];
	assign p[6] = s[11];
	assign p[7] = c[11];
endmodule	
	
	