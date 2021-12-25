module unit_price(
    input clk,
    input rst,
    input [3:0] price,
    input [3:0] num,
    output reg [3:0] price_temp,
    output reg [3:0] num_temp,
    output reg [7:0] cur_unit_price
);
always @(posedge clk or negedge rst) begin
    if(!rst) begin
        price_temp = 0;
        num_temp = 0;
        cur_unit_price = 0;
    end
    else begin
        price_temp = price;
        num_temp = num;
        cur_unit_price = price_temp * num_temp;
    end
end
endmodule