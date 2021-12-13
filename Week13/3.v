module top_module (
    input clk,
    input reset,      // Synchronous active-high reset
    output reg[3:0] q);
    initial begin
        q=0;
    end

    always @(negedge reset) begin
        q=0;
    end

    always @(posedge clk) begin
        if(reset!=1)
            q = q+1;
    end
endmodule
