// signalCombiner testbench
`timescale 1ps/1ps
module signalCombiner_tb();
	reg clk;
    reg rst;
    reg [3:0] sw_floor_in;    // button inside, [3:0] -> 4F:1F
    reg sw_1f_up;             // button outside, 0 inactive, 1 active 
    reg sw_2f_up;             // button outside, 0 inactive, 1 active 
    reg sw_2f_down;           // button outside, 0 inactive, 1 active 
    reg sw_3f_up;             // button outside, 0 inactive, 1 active 
    reg sw_3f_down;           // button outside, 0 inactive, 1 active 
    reg sw_4f_down;           // button outside, 0 inactive, 1 active
	reg [3:0] clr;
    output [3:0] des_floor;   // Destination floor
	initial begin
		$dumpfile("wave.vcd");        //生成的vcd文件名称
    	$dumpvars(0, signalCombiner_tb);     //tb模块名称
		clk = 'b0;
		rst = 'b1;
		clr = 0;
		#2 rst = 'b0;
		#2 rst = 'b1;
		sw_floor_in = 'b0000;
		sw_1f_up = 0;
		sw_2f_down = 0;
		sw_2f_up = 0;
		sw_3f_down = 0;
		sw_3f_up = 0;
		sw_4f_down = 0;
		#2
		sw_1f_up = 1;
		sw_2f_down = 1;
		sw_2f_up = 1;

		#4
		sw_floor_in = 'b0;
		sw_2f_down = 0;
		#4
		clr = 'b1010;

		#4
		sw_floor_in = 'b0111;
    	
	end
	always #1 clk = ~clk;
	signalCombiner signalCombiner(clk, rst, sw_floor_in, sw_1f_up, sw_2f_up, sw_2f_down, sw_3f_up, sw_3f_down, sw_4f_down, clr ,des_floor);
endmodule
