 module top_module(
    input [31:0] a,
    input [31:0] b,
    output [31:0] sum
    );
    wire c16,cout;

    add16 m_add16_1(a[15:0],b[15:0],0,sum[15:0],c16);
    add16 m_add16_2(a[31:16],b[31:16],c16,sum[31:16],cout);
endmodule
	


//module add16 ( input[15:0] a, input[15:0] b, input cin, output[15:0] sum, output cout );



module add1 ( 
    input a, 
    input b, 
    input cin,   
    output sum, 
    output cout 
	);
	assign sum = a ^ b ^ cin;
	assign cout =  (cin==1)|(cin==0)?(a & cin) | (b & cin)| (a & b):1'bx;
	
endmodule
