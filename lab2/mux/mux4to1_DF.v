// Mux4to1 using two Mux2to1_BH
module mux4to1_DF (
	a,b,c,d,sel1,sel0,
	out);

input a,b,c,d,sel1,sel0;
output out;


mux2to1_BH mux0(.a(a),.b(b));
mux2to1_BH mux1(.a(c),.b(d));

assign out = sel1 ? mux1.out : mux0.out;

endmodule