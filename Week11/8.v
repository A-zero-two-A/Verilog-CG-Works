`timescale 1ps/1ps
module top_module();
	reg [1:0] in;
	initial begin
		in = 'b00;
		#10 in = 'b01;
		#10 in = 'b10;
		#10 in = 'b11;
	end

	andgate andgate(.in(in));
	
endmodule

// module andgate (
//         input [1:0] in,
//         output out
// );

