`timescale 10ps/10ps

module testbenchALU();
	reg [15:0] prevcount, count;
	reg  [7:0] inp0, inp1;
	wire [7:0] out0, out1;
	reg  [1:0] prevfunc, func;
	reg  [1:0] cyc;
	reg [19:0] calc;
	
	initial begin
		count <= 16'b1010_1100_1110_0001;
		func <= 1;
		prevfunc <= 0;
		prevcount <= count;
		calc <= 1;
	end
	
	always @(calc)
		begin
			if ((prevfunc == 0)&&(cyc == 0)) #50 func <=2; 
			else if (prevfunc == 1) #50 func <=3;
			else if (prevfunc == 2) begin
				if (cyc < 3)
					#50 func <= 1;
				else begin
					#50 func <= 2;
				end
			end
			else if (prevfunc == 3) #50 func <=0;
			calc <= calc + 1;
		end
		
	always @(func)
		begin
			count[14:0] <= prevcount[15:1];
			count[15] <= prevcount[0] ^ prevcount[2] ^ prevcount[3] ^ prevcount[5] ^ prevcount[15];
			prevfunc <= func;
			prevcount <= count;
			inp0 <= count[7:0];
			inp1 <= count[15:8];
		end
	
	ALU testALU(.REGX(out0), .REGY(out1), .REGA(inp0), .REGB(inp1), .REGF(func), .REGS(cyc));
endmodule
	
