module GPU(
    input clk3hz,
    input clr,
    input sw_add,
    // input sw_sub,
    input sw_left,
    // input sw_right,
    input enable,
    output [31:0]dataBus
);
    
    wire  curPage;
    wire [35:0] msgArray;
    reg [35:0] msgOut;
    
    initial begin
        msgOut <= msgArray;
        
    end

    always @ (posedge clk3hz ) begin
        
        if(!clr)
            if(curPage=='b1)
            begin
               msgOut[31:16]<=msgArray[15:0];
               msgOut[15:0]<=msgArray[31:16]; 
            end
                
            else
                msgOut<=msgArray;
        else begin
            msgOut[3:0]<=msgOut[31:28];
            msgOut[31:4]<=msgOut[27:0];
        end
        msgOut[35:32] <= msgArray[35:32];

    end

    assign dataBus[15:0] = msgOut[31:16];
    assign dataBus[27:16] = 12'hccc;
    assign dataBus[31:28] = msgOut[35:32];
    inputNum inputNum(sw_left, /*sw_right,*/ sw_add, /*sw_sub,*/ enable, msgArray[35:0], clk3hz, clr, curPage);
endmodule
