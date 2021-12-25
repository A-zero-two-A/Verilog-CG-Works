module hex2bcd2 (
    input [3:0]hex_num,
    output reg [7:0]bcd_num
);
    always @(*) begin
        case (hex_num)
            'b0000:bcd_num = 'b0000_0000;   //00
            'b0001:bcd_num = 'b0000_0001;   //01
            'b0010:bcd_num = 'b0000_0010;   //02
            'b0011:bcd_num = 'b0000_0011;   //03
            'b0100:bcd_num = 'b0000_0100;   //04
            'b0101:bcd_num = 'b0000_0101;   //05
            'b0110:bcd_num = 'b0000_0110;   //06
            'b0111:bcd_num = 'b0000_0111;   //07
            'b1000:bcd_num = 'b0000_1000;   //08
            'b1001:bcd_num = 'b0000_1001;   //09
            'b1010:bcd_num = 'b0001_0000;   //10
            'b1011:bcd_num = 'b0001_0001;   //11
            'b1100:bcd_num = 'b0001_0010;   //12
            'b1101:bcd_num = 'b0001_0011;   //13
            'b1110:bcd_num = 'b0001_0100;   //14
            'b1111:bcd_num = 'b0001_0101;   //15
            default: bcd_num = 'b1111_1111; //--
        endcase
    end  
endmodule