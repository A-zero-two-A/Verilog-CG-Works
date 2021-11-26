`timescale 1ps/1ps
module top_module ();
	reg clk;
	initial begin
		clk = 1'b0;
	end

	always #5 clk <= ~clk;
		dut dut(.clk(clk));
endmodule
