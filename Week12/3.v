module top_module(
	input [31:0] a,
	input [31:0] b,
	output [31:0] sum
);
	wire [31:0] sum_temp;
	wire cout_p,cout_0,cout_1;
	add16 add_p(a[15:0], b[15:0], 0, sum[15:0], cout_p);
	add16 add_0(a[31:16], b[31:16], 0, sum_temp[15:0], cout_0);
	add16 add_1(a[31:16], b[31:16], 1, sum_temp[31:16], cout_1);
	assign sum[31:16] = cout_p?sum_temp[31:16]:sum_temp[15:0];
endmodule