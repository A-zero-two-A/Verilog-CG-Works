// elevator testbench
 `timescale 1ps/1ps
module elevator_tb();
	reg clk;
    reg rst;
    reg [3:0] des_floor;
    output [3:0] cur_floor; // 1, 2, 3, 4
    output is_open;         // 0 close, 1 open
    output [1:0] move;       // 0 stop, 1 up, 2 down
	output [3:0] clr;
	initial begin
		$dumpfile("wave.vcd");        //生成的vcd文件名称
    	$dumpvars(0, elevator_tb);     //tb模块名称

		clk = 'b0;
    	des_floor = 'b1000;
		#20 des_floor = 'b0010;
	end
	always #1 clk = ~clk;
	elevator elevator(clk, rst, des_floor, cur_floor, is_open, move, clr);
endmodule
