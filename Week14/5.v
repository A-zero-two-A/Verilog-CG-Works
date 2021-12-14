module top_module(
    input clk,
    input reset,    // 高电平有效
    input in,
    output reg disc,
    output reg flag,
    output reg err);
    reg [63:0]one_num;
    reg last;
    initial begin
        disc = 0;
        flag = 0;
        err = 0;
        one_num = 0;
        last = 0;
    end

    always @(posedge clk) begin
        if(last==0) begin
            one_num = 0;
        end
        if(in) begin
            one_num = one_num + 1;
            if(one_num>6)
                err = 1;
            last = 1;
        end
        else begin
            if(disc)
                disc = 0;
            else if(flag) begin
                flag = 0;
                one_num = 0;
            end
            else if(err) begin
                err = 0;
                one_num = 0;
            end
            else begin
                if(one_num==5)
                    disc = 1;
                else if(one_num==6)
                    flag = 1;
                else if(one_num>=7)
                    err = 1;
            one_num = 0;
            end
        end
    end
endmodule
