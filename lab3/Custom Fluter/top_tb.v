// counter testbench
`timescale 1ps/1ps
module top_tb();
	reg clk100mhz;
	reg clr;
	reg sw_add;
	reg sw_left;
	reg enable;
	output [3:0] pos;
	output [7:0] seg0,seg1;

	initial begin
		$dumpfile("wave.vcd");        //生成的vcd文件名称
    	$dumpvars(0, top_tb);     //tb模块名称

    	sw_add = 'b0;
    	sw_left = 'b0;
    	clk100mhz = 'b0;
    	clr = 'b1;
    	enable = 'b0;

    	#5 sw_add = 'b1;
    	#5 sw_add = 'b0;
    	#5 sw_add = 'b1;
    	#5 sw_add = 'b0;
    	#5 sw_add = 'b1;
    	#5 sw_add = 'b0;
    	#5 sw_add = 'b1;
    	#5 sw_add = 'b0;

    	#5 sw_left = 'b1;
    	#5 sw_left = 'b0;
    	#5 sw_left = 'b1;
    	#5 sw_left = 'b0;
    	#5 sw_left = 'b1;
    	#5 sw_left = 'b0;
    	#5 sw_left = 'b1;
    	#5 sw_left = 'b0;
    	#5 sw_left = 'b1;
    	#5 sw_left = 'b0;
    
    	
    end

    always #1 clk100mhz = ~clk100mhz;
    top top(sw_add, sw_left, clk100mhz, clr, enable, pos, seg);

endmodule