module top_module (
    input clk,
    input reset,
    output reg [3:0] q);
    initial begin
        q=0;
    end

    always @(negedge reset) begin
        q=1;
    end

    always @(posedge clk) begin
        q = q+1;
    end
endmodule
