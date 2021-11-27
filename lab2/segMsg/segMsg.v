module segMsg (
	input key1,
	input key2,
	input key3,
	input key4,
	output reg [3:0] pos,
	output reg [7:0] seg
);

wire [3:0] data = {key4, key3, key2, key1};

always @(data) begin
	pos = 4'b0001;
	case (data)
		4'b0000:seg = 8'b0011_1111;   //0
		4'b0001:seg = 8'b0000_0110;   //1
		4'b0010:seg = 8'b0101_1011;   //2
		4'b0011:seg = 8'b0100_1111;   //3
		4'b0100:seg = 8'b0110_0110;   //4
		4'b0101:seg = 8'b0110_1101;   //5
		4'b0110:seg = 8'b0111_1101;   //6
		4'b0111:seg = 8'b0000_0111;   //7
		4'b1000:seg = 8'b0111_1111;   //8
		4'b1001:seg = 8'b0110_1111;   //9
		4'b1010:seg = 8'b0111_0111;   //A
		4'b1011:seg = 8'b0111_1100;   //b
		4'b1100:seg = 8'b0011_1001;   //C
		4'b1101:seg = 8'b0101_1110;   //d
		4'b1110:seg = 8'b0111_1001;   //E
		4'b1111:seg = 8'b0111_0001;   //F
		default : seg = 8'b0000_1000; /* default */ //_
	endcase
end

endmodule : segMsg