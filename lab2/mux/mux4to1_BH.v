// Mux4to1 using two Mux2to1_BH
module mux4to1_BH (
	a,b,c,d,sel1,sel0,
	out);

input a,b,c,d,sel1,sel0;
output out;
reg out;


mux2to1_BH mux0(.a(a),.b(b),.sel(sel0));
mux2to1_BH mux1(.a(c),.b(d),.sel(sel0));
always @(*) begin
	if(sel1)
		out = mux1.out;
	else
		out = mux0.out;
end

endmodule