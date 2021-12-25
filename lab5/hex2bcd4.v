module hex2bcd4 (
    input [15:0] hex_num,
    output reg[15:0] bcd
);
    reg [3:0] hex0,hex1,hex2,hex3;
    wire [7:0] bcd_num0, bcd_num1, bcd_num2, bcd_num3;
    wire [15:0] bcd_num;
    initial begin
        hex0 = 0;
        hex1 = 0;
        hex2 = 0;
        hex3 = 0; 
        bcd = 0;
    end
    always @(*) begin
        hex0 = hex_num%'d10;
        hex1 = hex_num/'d10%'d10;
        hex2 = hex_num/'d100%'d10;
        hex3 = hex_num/'d1000%'d10; 
        bcd[3:0] = bcd_num0[3:0];
        bcd[7:4] = bcd_num1[3:0];
        bcd[11:8] = bcd_num2[3:0];
        bcd[15:12] = bcd_num3[3:0];
    end
    hex2bcd2 bcd0(hex0, bcd_num0[7:0]);
    hex2bcd2 bcd1(hex1, bcd_num1[7:0]);
    hex2bcd2 bcd2(hex2, bcd_num2[7:0]);
    hex2bcd2 bcd3(hex3, bcd_num3[7:0]); 
endmodule