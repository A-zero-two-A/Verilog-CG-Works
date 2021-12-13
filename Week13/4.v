module top_module(
    input clk,
    input load,
    input ena,
    input [1:0] amount,
    input [63:0] data,
    output reg [63:0] q);
    reg op_num;
    initial begin
        q=0;
    end
    always @(posedge clk ) begin
        if(load)
            q=data;
        else
            if(ena)begin
                case (amount)
                    2'b00:begin
                        op_num=q[63];
                        q = q << 1;
                        q[63] = op_num;
                    end
                    2'b01:begin
                        repeat (8)begin
                            op_num=q[63];
                            q = q << 1;
                            q[63] = op_num;
                        end
                    end
                    2'b10:begin
                        op_num=q[63];
                        q = q >> 1;
                        q[63] = op_num;
                    end
                    2'b11:begin
                        repeat (8)begin
                            op_num=q[63];
                            q = q >> 1;
                            q[63] = op_num;
                        end
                    end
                endcase
            end
    end
endmodule

