// counter testbench
`timescale 1ps/1ps
module counter_tb ();
	reg clk;
	reg sw_add;
	reg sw_sub;
	reg en;
	output[3:0] num;
	initial begin
		$dumpfile("wave.vcd");        //生成的vcd文件名称
    	$dumpvars(0, counter_tb);     //tb模块名称

    	sw_add = 'b1;
    	sw_sub = 'b1;
    	en = 'b1;

    	#5 sw_add = 'b0;
    	#5 sw_add = 'b1;
    	#5 sw_add = 'b0;
    	#5 sw_add = 'b1;
    	#5 sw_sub = 'b0;
    	#5 sw_sub = 'b1;
    	#5 en = 'b0;
    	#5 sw_add = 'b0;
    	#5 sw_add = 'b1;
    	#5 sw_add = 'b0;
    	#5 sw_add = 'b1;
    	#5 sw_sub = 'b0;
    	#5 sw_sub = 'b1;
	end

	always #1 clk = ~clk;
	counter counter(sw_add,sw_sub,num,en);

endmodule