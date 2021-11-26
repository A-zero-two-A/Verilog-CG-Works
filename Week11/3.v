module top_module (
                input x, 
                input y, 
                output z
        );
// x	0	1	0	1
// y	0	0	1	1
// z	1	0	0	1
// XNOR
	assign z = x ~^ y;
endmodule
