module top_module (
    input clk,
    input reset,
    input shift_ena,
    input count_ena,
    input data,
    output reg [3:0] q);
    initial begin
        q=0;
    end
    always @(posedge clk) begin
        if(reset)begin
            q=0;
        end
        else begin
            if(shift_ena)begin
                if(q==4)
                    q=9;
                else    begin  
                if(data)
                    q[0]=data;
                else
                    q=q<<1;
                end
            end

            if(count_ena)begin
                q=q-1;
            end
        end
    end
endmodule
