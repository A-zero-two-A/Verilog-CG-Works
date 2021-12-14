// counter testbench
`timescale 1ns/1ns
module inputNum_tb();
	reg clk;
	reg sw_add;
	reg sw_sub;
	reg sw_left;
	reg sw_right;
	output[31:0] nums;

	initial begin
		$dumpfile("wave.vcd");        //生成的vcd文件名称
    	$dumpvars(0, inputNum_tb);     //tb模块名称

    	sw_add = 'b1;
    	sw_sub = 'b1;
    	sw_left = 'b1;
    	sw_right = 'b1;

    	#5 sw_add = 'b0;
    	#5 sw_add = 'b1;
    	#5 sw_add = 'b0;
    	#5 sw_add = 'b1;
    	#5 sw_sub = 'b0;
    	#5 sw_sub = 'b1;

    	#5 sw_right = 'b0;
    	#5 sw_right = 'b1;
    	#5 sw_add = 'b0;
    	#5 sw_add = 'b1;
    	#5 sw_add = 'b0;
    	#5 sw_add = 'b1;

    	#5 sw_left = 'b0;
    	#5 sw_left = 'b1;
    	#5 sw_left = 'b0;
    	#5 sw_left = 'b1;
    	#5 sw_add = 'b0;
    	#5 sw_add = 'b1;
    	#5 sw_add = 'b0;
    	#5 sw_add = 'b1;

    	#5 sw_right = 'b0;
    	#5 sw_right = 'b1;
    	#5 sw_add = 'b0;
    	#5 sw_add = 'b1;
    	#5 sw_add = 'b0;
    	#5 sw_add = 'b1;
    	#5 sw_add = 'b0;
    	#5 sw_add = 'b1;
    	#5 sw_add = 'b0;
    	#5 sw_add = 'b1;
    	#5 sw_add = 'b0;
    	#5 sw_add = 'b1;
    	#5 sw_add = 'b0;
    	#5 sw_add = 'b1;
    	#5 sw_add = 'b0;
    	#5 sw_add = 'b1;
    	#5 sw_add = 'b0;
    	#5 sw_add = 'b1;
    	#5 sw_add = 'b0;
    	#5 sw_add = 'b1;
    	#5 sw_add = 'b0;
    	#5 sw_add = 'b1;
    	#5 sw_add = 'b0;
    	#5 sw_add = 'b1;
    	#5 sw_add = 'b0;
    	#5 sw_add = 'b1;
    	#5 sw_add = 'b0;
    	#5 sw_add = 'b1;
    	#5 sw_add = 'b0;
    	#5 sw_add = 'b1;
    	#5 sw_add = 'b0;
    	#5 sw_add = 'b1;
    	#5 sw_add = 'b0;
    	#5 sw_add = 'b1;
	end

	always #5 clk = ~clk;
	inputNum inputNum(sw_left, sw_right, sw_add, sw_sub, nums);

endmodule