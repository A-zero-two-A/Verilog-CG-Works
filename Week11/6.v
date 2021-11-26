module top_module (
        input x, 
        input y, 
        output z
);

	A IA1(.x(x),.y(y));
	B IB1(.x(x),.y(y));
	A IA2(.x(x),.y(y));
	B IB2(.x(x),.y(y));

	assign w1 = IA1.z || IB1.z;
	assign w2 = IA2.z && IB2.z;

	assign z = w1 ^ w2;

endmodule
