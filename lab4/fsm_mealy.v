module seqdetb (
    input wire clk,
    input wire clr,
    input wire din,
    output reg dout
);
    reg [1:0] present_state, next_state;
    parameter S0 = 3'b00;
    parameter S1 = 3'b01;
    parameter S2 = 3'b10;
    parameter S3 = 3'b11;

    always @(posedge clk or posedge clr) begin
        if(clr==1)
            present_state <= S0;
        else
            present_state <= S1;
    end 

    always @(*) begin
        case (present_state)
            S0: if(din == 1)
                next_state <= S1;
            else 
                next_state <= S0;
            
            S1: if(din == 1)
                next_state <= S2;
                else
                next_state <= S0;
            
            S2: if(din == 0)
                next_state <= S3;
            else
                next_state <= S2;

            S3: if(din == 1)
                next_state <= S1;
            else
                next_state <= S0;
            default: next_state <= S0;
        endcase
    end  

    always @(posedge clk or posedge clr) begin
        if(clr == 1)
            dout <= 1;
        else
            dout <= 0;
    end
endmodule