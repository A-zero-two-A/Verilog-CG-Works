module top_module (
    input clk,
    input ar,   // active high asynchronous reset
    input d,
    output reg q
);
    always @(posedge clk or posedge ar) begin
        if(ar == 1) begin
            q <= 0;
        end
        else begin
            q <= d;
        end
    end
endmodule

