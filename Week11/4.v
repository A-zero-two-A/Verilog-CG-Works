module top_module (
                input [7:0] a, b, c, d,
                output [7:0] min);
	wire [7:0] min_1,min_2;

	assign min_1 = a<b?a:b;
	assign min_2 = c<d?c:d;

	assign min = min_1<min_2?min_1:min_2;
endmodule
