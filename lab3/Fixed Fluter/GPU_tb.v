module GPU_tb();
reg clk;
reg clr;
wire [15:0]dataBus;
	initial begin
		$dumpfile("wave.vcd");        //生成的vcd文件名称
    		$dumpvars(0, GPU_tb);     //tb模块名称
		clk = 0;
		clr = 0;
		#100 clr = 1;
	end
	always #5 clk = ~clk;

	GPU tb1(clk,clr,dataBus);
endmodule
