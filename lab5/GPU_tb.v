// GPU testbench
`timescale 1ps/1ps
module GPU_tb();
	reg clk;
	reg rst;
	reg [3:0] price;
    reg [3:0] num;
    reg [7:0] cur_unit_price;
    reg [3:0] total_num;
    reg [7:0] total_price;
	reg sw_add;
    output [31:0] dataBus;
	initial begin
		$dumpfile("wave.vcd");        //生成的vcd文件名称
    	$dumpvars(0, GPU_tb);     //tb模块名称
		sw_add = 0;
		clk = 0;
		rst = 0;
		num = 0;
		price = 0;
		#5 num = 2;
		price = 5;
		#5 sw_add = 1;
		#5 sw_add = 0;
		#5 num = 1;
		price = 1;
		#5 sw_add = 1;
		#5 sw_add = 0;
		#5 rst = 1;
		#5 rst = 0;


	end
	always #1 clk = ~clk;
	GPU GPU(clk, rst, price, num, cur_unit_price, total_num, total_price, sw_add, dataBus);
endmodule
