// unit_price testbench
`timescale 1ps/1ps
module unit_price_tb();
	reg clk;
	reg rst;
	reg [3:0] price;
	reg [3:0] num;
	output [3:0] price_temp;
    output [3:0] num_temp;
    output [7:0] cur_unit_price;
	initial begin
		$dumpfile("wave.vcd");        //生成的vcd文件名称
    	$dumpvars(0, unit_price_tb);     //tb模块名称
    	clk = 'b0;
		rst = 'b0;
		price = 'b0010;
		num = 'b1010;

		#5 price = 'b1001;
		num = 'b0010;

		#5 rst = 'b1;
		#5 rst = 'b0;

	end
	always #1 clk = ~clk;
	unit_price unit_price(clk, rst, price, num, price_temp, num_temp, cur_unit_price);
endmodule
