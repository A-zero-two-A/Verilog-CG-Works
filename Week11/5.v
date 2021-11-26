module top_module( 
        input [2:0] a,
        input [2:0] b,
        output [2:0] out_or_bitwise,
        output out_or_logical,
        output [5:0] out_not
);

	//bitwise-or
	assign out_or_bitwise = a | b;

	//logical-or
	assign out_or_logical = a || b;

	//NOT
	assign out_not[5:3] = ~b;
	assign out_not[2:0] = ~a;

endmodule
