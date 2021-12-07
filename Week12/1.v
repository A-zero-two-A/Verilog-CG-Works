module top_module (
    input [15:0] a, b, c, d, e, f, g, h, i,
    input [3:0] sel,
    output reg[15:0] out);

	initial begin
		assign out = 'b11111111_11111111;
	end

	always @(*) begin
		case (sel)
			0: assign out = a;
			1: assign out = b;
			2: assign out = c;
			3: assign out = d;
			4: assign out = e;
			5: assign out = f;
			6: assign out = g;
			7: assign out = h;
			8: assign out = i;
			default : assign out = 'b11111111_11111111;
		endcase
	end
endmodule
