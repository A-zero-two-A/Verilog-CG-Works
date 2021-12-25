// hex2bcd4 testbench
 `timescale 1ps/1ps
module hex2bcd4_tb();
	reg clk;
	reg rst;
	reg [15:0] hex_num;
	output [15:0] bcd_num;
	initial begin
		$dumpfile("wave.vcd");        //生成的vcd文件名称
    	$dumpvars(0, hex2bcd4_tb);     //tb模块名称
    	hex_num = 'd85;
		#5 hex_num ='d11;
		#5 hex_num = 'b1111_0000_1111_1101;
	end
	always #1 clk = ~clk;
	hex2bcd4 hex2bcd4(hex_num, cd_num);
endmodule
