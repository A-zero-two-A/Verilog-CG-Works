module signalCombiner (
    input clk,
    input rst,
    input [3:0] sw_floor_in,    // button inside, [3:0] -> 4F:1F
    input sw_1f_up,             // button outside, 0 inactive, 1 active 
    input sw_2f_up,             // button outside, 0 inactive, 1 active 
    input sw_2f_down,           // button outside, 0 inactive, 1 active 
    input sw_3f_up,             // button outside, 0 inactive, 1 active 
    input sw_3f_down,           // button outside, 0 inactive, 1 active 
    input sw_4f_down,           // button outside, 0 inactive, 1 active 
    input [3:0] clr,
    output reg [3:0] des // Destination floor
);
    reg sw_1f_up_temp;
    reg sw_2f_down_temp;
    reg sw_2f_up_temp;
    reg sw_3f_down_temp;
    reg sw_3f_up_temp;
    reg sw_4f_down_temp;
    reg [3:0] des_floor;
    initial begin
        des_floor = 'b0001;
        des = des_floor;
        sw_1f_up_temp =sw_1f_up;
        sw_2f_down_temp =sw_2f_down;
        sw_2f_up_temp =sw_2f_up;
        sw_3f_down_temp =sw_3f_down;
        sw_3f_up_temp =sw_3f_up;
        sw_4f_down_temp =sw_4f_down;
    end

    always @(posedge clk or negedge rst) begin
        if(!rst) begin
            des_floor = 'b0001;
            des = des_floor;
            sw_1f_up_temp =sw_1f_up;
            sw_2f_down_temp =sw_2f_down;
            sw_2f_up_temp =sw_2f_up;
            sw_3f_down_temp =sw_3f_down;
            sw_3f_up_temp =sw_3f_up;
            sw_4f_down_temp =sw_4f_down;
        end
        else begin
            des[0] = des_floor[0] | sw_floor_in[0];
            des[1] = des_floor[1] | sw_floor_in[1];
            des[2] = des_floor[2] | sw_floor_in[2];
            des[3] = des_floor[3] | sw_floor_in[3];
            if(clr[0]) begin
                des[0] = 0;
            end
            if(clr[1]) begin
                des[1] = 0;
            end
            if(clr[2]) begin
                des[2] = 0;
            end
            if(clr[3]) begin
                des[3] = 0;
            end
        end
    end

    always @(posedge sw_1f_up or negedge sw_1f_up) begin
        if (!sw_1f_up)
            des_floor[0] = 1;
        else
            des_floor[0] = 1;
    end 

    always @(posedge sw_2f_down or negedge sw_2f_down or posedge sw_2f_up or negedge sw_2f_up) begin
        if (!sw_2f_down)
            des_floor[1] = 1;
        else
            if (!sw_2f_up)
                des_floor[1] = 1;
            else
                des_floor[1] = 1;
    end

    always @(posedge sw_3f_down or negedge sw_3f_down or posedge sw_3f_up or negedge sw_3f_up) begin
        if (!sw_3f_down)
            des_floor[2] = 1;
        else
            if (!sw_3f_up)
                des_floor[2] = 1;
            else
                des_floor[2] = 1;
    end

    always @(posedge sw_4f_down or negedge sw_4f_down) begin
        if (!sw_4f_down)
            des_floor[3] = 1;
        else
            des_floor[3] = 1;
    end 
endmodule