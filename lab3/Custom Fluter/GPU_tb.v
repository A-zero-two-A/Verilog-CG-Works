`timescale 1ps/1ps
module GPU_tb ();
    reg clk3hz;
    reg clr;
    reg sw_add;
    reg sw_left;
    reg enable;
    output [31:0]dataBus;


    initial begin
    	$dumpfile("wave.vcd");       
    	$dumpvars(0, GPU_tb);

    	clk3hz = 'b0;
    	clr = 'b0;
    	sw_add = 'b0;
    	sw_left = 'b0;
    	enable = 'b1;

    	#1 sw_add = 'b1;
    	#1 sw_add = 'b0;

    	#1 sw_left = 'b1;
    	#1 sw_left = 'b0;
    	#1 sw_left = 'b1;
    	#1 sw_left = 'b0;
    	#1 sw_left = 'b1;
    	#1 sw_left = 'b0;
    	#1 sw_left = 'b1;
    	#1 sw_left = 'b0;
    	#1 sw_left = 'b1;
    	#1 sw_left = 'b0;

    	#1 sw_add = 'b1;
    	#1 sw_add = 'b0;
    	#1 sw_add = 'b1;
    	#1 sw_add = 'b0;

    	#1 clr = 'b1;
    end

    always #1 clk3hz = ~clk3hz;

    GPU GPU(clk3hz, clr, sw_add, sw_left, enable, dataBus);
endmodule