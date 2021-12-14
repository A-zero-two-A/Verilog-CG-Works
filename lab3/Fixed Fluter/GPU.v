module GPU(
    input clk3hz,
    input clr,
    output [15:0]dataBus
);
    reg[31:0] msgArray;
    parameter NUMBER = 32'h40123456;
    assign dataBus=msgArray[31:16];
    initial begin
        msgArray = NUMBER;
    end

    always @ (posedge clk3hz or negedge clr)
    if(!clr)
        msgArray<=NUMBER;
    else begin
        msgArray[3:0]<=msgArray[31:28];
        msgArray[31:4]<=msgArray[27:0];
    end
endmodule
