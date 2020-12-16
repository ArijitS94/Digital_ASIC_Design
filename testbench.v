`timescale 10ps/10ps

module testbench();
	reg [7:0] I, temp;
	wire P0, P1, P2, I0, I1, I2, I3, I4, I5, I6, I7;
	
	assign  I0 = I[0];
	assign  I1 = I[1];
	assign  I2 = I[2];
	assign  I3 = I[3];
	assign  I4 = I[4];
	assign  I5 = I[5];
	assign  I6 = I[6];
	assign  I7 = I[7];
	
	initial
	begin
		I <= 1;
		temp <= 1;
	end
	
	always @*
		begin
		#10	I <= I + temp; //random variables
			temp <= temp + temp;
		end
	
	PriorityEncoder testencoder (.P2(P2), .P1(P1), .P0(P0), 
									.I7(I7), .I6(I6), .I5(I5), .I4(I4),
									.I3(I3), .I2(I2), .I1(I1), .I0(I0));
endmodule