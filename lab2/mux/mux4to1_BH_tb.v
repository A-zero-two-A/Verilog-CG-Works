//TestBecth of Mux421
`timescale 1ps/1ps
module top_module ();

	reg clk;    // Clock
	reg a,b,c,d;
	reg [1:0] sel;
	wire out;
	initial begin

		$dumpfile("wave.vcd");        //生成的vcd文件名称
    	$dumpvars(0, top_module);     //tb模块名称

		clk = 1'b0;
		a = 1'b1;
		b = 1'b1;
		c = 1'b0;
		d = 1'b0;
		sel = 1'b00;
		#5 sel = 2'b01;
		#5 sel = 2'b10;
		#5 sel = 2'b11;
	end

	always #5 clk <= ~clk;
	
	mux4to1_BH mux4to1_BH(
			.a   (a),
			.b   (b),
			.c   (c),
			.d   (d),
			.sel0(sel[0]),
			.sel1(sel[1]),
			.out (out)
		);


endmodule