module top_module (
    input clk,
    input reset,
    input enable,
    output reg[3:0] Q
);
    initial begin
        Q=1;
    end

    always @(negedge reset) begin
        Q=1;
    end

    always @(posedge clk) begin
        if(enable)
            if(Q==12)
                Q = 1;
            else
                Q = Q+1;
    end
endmodule
