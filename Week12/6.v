module top_module(
           input d,
           input ena,              
           output reg q   
           );
initial begin
	q = 'b0;
end

// assign q= ena?d:q;
always @(ena or d) begin
	if(ena)
		q=d;
end
endmodule
