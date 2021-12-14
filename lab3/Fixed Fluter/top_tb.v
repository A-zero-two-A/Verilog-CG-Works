module top_tb();
	reg clk100mhz;
	reg clr;
	wire [3:0] pos;
	wire [7:0] seg;
	initial begin
		$dumpfile("wave.vcd");        //生成的vcd文件名称
		$dumpvars(0, top_tb);     //tb模块名称
		clk100mhz = 0;
		clr = 1;
		
	end
	always #1 clk100mhz = ~clk100mhz;

	top top(clk100mhz, clr, pos, seg);
endmodule
