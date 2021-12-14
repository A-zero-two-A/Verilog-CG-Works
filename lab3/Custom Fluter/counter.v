// counter 'd
module counter (
    sw_add, /*sw_sub,*/ num, en, clk
);
    input sw_add;
    // input sw_sub;
    input en;
    input clk;
    output[3:0] num;
    reg[3:0] num_temp; 
    wire sw_add_led; 
    initial begin
        num_temp = 0;
    end


    always @(posedge sw_add) begin
        if (en) begin
            if (num_temp == 9)
                num_temp = 0;
            else
                num_temp = num_temp + 1;
        end
    end    

    // always @(negedge sw_sub) begin
    //     if (en) begin
    //         if (num_temp == 0)
    //             num_temp = 9;
    //         else
    //             num_temp = num_temp - 1;
    //     end
    // end

    assign num = num_temp;
    keyled keyled(clk, sw_add, sw_add_led);

endmodule