module GPU (
    input clk,
    input rst,
    input [2:0] cur_floor,
    input is_open,
    input [1:0] move,
    output reg [15:0] dataBus   // O(5)/C(6), U(7)/D(8)/S(9), Floor(1,2,3,4), F(0)  
);
    initial begin
        dataBus = 0;
    end

    always @(posedge clk ) begin
        if(is_open) begin
            dataBus[15:12] = 'd5; 
        end
        else begin
            dataBus[15:12] = 'd6;
        end

        case (move)
            0: dataBus[11:8] = 'd9;
            1: dataBus[11:8] = 'd7;
            2: dataBus[11:8] = 'd8; 
        endcase

        case (cur_floor)
            1:  dataBus[7:4] = 'd1;
            2:  dataBus[7:4] = 'd2;
            3:  dataBus[7:4] = 'd3;
            4:  dataBus[7:4] = 'd4; 
        endcase 

        dataBus[3:0] = 'd0;
    end
endmodule