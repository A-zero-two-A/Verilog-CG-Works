module GPU (
    input clk,
    input rst,
    input [3:0] price,
    input [3:0] num,
    input [7:0] cur_unit_price,
    input [3:0] total_num,
    input [7:0] total_price,
    input sw_add,
    output reg [31:0] dataBusBCD
);
    reg show_mode;  // 0 unit, 1 AC
    reg [3:0] price_temp;
    reg [3:0] num_temp;
    wire [31:0] dataBus0,dataBus1;
    initial begin
        show_mode = 0;
        price_temp= 0;
        num_temp = 0;
    end

    always @(posedge clk) begin
        if(num!=num_temp || price!=price_temp) begin
            show_mode = 0;
        end
        else if(sw_add) begin
            show_mode = 1;
        end

        num_temp = num;
        price_temp = price;

        if(!show_mode) begin
            // dataBus[31:24] = num;
            // dataBus[23:16] = price;
            // dataBus[15:0] = cur_unit_price;
            dataBusBCD = dataBus0;
        end
        else begin
            // dataBus[31:24] = 'hac;
            // dataBus[23:16] = total_num;
            // dataBus[15:0] = total_price;
            dataBusBCD[23:0] = dataBus1[23:0];
            dataBus1[31:24] = 'b1010_1100;
        end
    end

    hex2bcd2 bcd0(num, dataBus0[31:24]);
    hex2bcd2 bcd1(price, dataBus0[23:16]);
    hex2bcd4 bcd2(cur_unit_price, dataBus0[15:0]);
    hex2bcd2 bcd3(total_num, dataBus1[23:16]);
    hex2bcd4 bcd4(total_price, dataBus1[15:0]);
endmodule