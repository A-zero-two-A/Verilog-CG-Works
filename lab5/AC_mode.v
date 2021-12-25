module AC_mode (
    input clk,
    input rst,
    input sw_add,
    input [7:0] cur_unit_price,
    output reg [3:0] total_num,
    output reg [7:0] total_price
);
    initial begin
        total_num = 0;
        total_price = 0;
    end
    always @(posedge sw_add or negedge rst) begin
        if(!rst) begin
            total_num = 0;
            total_price = 0;
        end
        else begin
            total_num = total_num + 1;
            total_price = total_price + cur_unit_price;
        end
    end
endmodule