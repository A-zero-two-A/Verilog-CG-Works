module top_module(
    input in,
    input [1:0] state,
    output reg [1:0] next_state,
    output reg out);
    always @(*) begin
        case (state)
            'b00:begin
                if(in)begin
                    next_state='b01;
                end
                else
                    next_state='b00;
                out=0;
            end

            'b01:begin
                if(in)
                    next_state='b01;
                else
                    next_state='b10;
                out=0;
            end 

            'b10:begin
                if(in)
                    next_state='b11;
                else
                    next_state='b00;
                out=0;
            end

            'b11:begin
                if(in)
                    next_state='b01;
                else
                    next_state='b10;
                out=1;
            end
        endcase
    end
endmodule
