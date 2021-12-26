// AC_mode testbench
 `timescale 1ps/1ps
module AC_mode_tb();
	reg clk;
	reg rst;
	reg sw_add;
	reg [7:0] cur_unit_price;
	output [3:0] total_num;
    output [7:0] total_price;
	initial begin
		$dumpfile("wave.vcd");        //生成的vcd文件名称
    	$dumpvars(0, AC_mode_tb);     //tb模块名称
		
		sw_add = 0;
		rst = 0;
		#5 cur_unit_price = 8;
		#5 sw_add = 1;
		#5 sw_add = 0;
		#5 cur_unit_price = 9;
		#5 sw_add = 1;
		#5 sw_add = 0;
		#5 rst = 1;
		#5 rst = 0;	
	end
	always #1 clk = ~clk;
	AC_mode AC_mode(clk, rst, sw_add, cur_unit_price, total_num, total_price);
endmodule
