`timescale 1ns / 1ps

module add32_tb();
    reg [31:0]a;
    reg [31:0]b;
    reg cin;
    reg clk;
    wire [31:0]s0,s1,s2;
    wire cout0,cout1,cout2;
    initial begin
        a = 4'bxxxx;
        b = 4'bxxxx;
        cin = 1'bx;
        clk = 0;

        $dumpfile("wave.vcd");
        $dumpvars(0, add32_tb);
    end
    always #100 clk = ~clk;
    always@(posedge clk)begin
        a={$random}%2**30;
        b={$random}%2**30;
        cin={$random}%2;
        #150;
        cin=1'bx;
    end

    csadd32 A(a,b,cin,s0,cout0);//选择加法器
    rcadd32 B(a,b,cin,s1,cout1);//逐位加法器

endmodule


//一位全加器
module add1(
	input a,
	input b,
	input cin,
	output sum,
	output cout);
	assign #4 sum = a ^ b ^ cin;
	assign #2 cout =  (cin==1)|(cin==0)?(a & cin) | (b & cin)| (a & b):1'bx;
	//assign #3 cout = (a & b) | (a & cin) | (b & cin);
endmodule
