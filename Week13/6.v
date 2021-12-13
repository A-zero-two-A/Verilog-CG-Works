module top_module(
    input clk,
    input areset,    // Asynchronous reset to state B
    input in,
    output reg out);
    
    always @(posedge clk) begin
        if(areset)
            out=1;
        else
            if(out==1)   begin
                if(in)
                    out=out;
                else
                    out=0;
            end
            else    begin
                if(in)
                    out=out;
                else
                    out=1;
            end

    end
endmodule
