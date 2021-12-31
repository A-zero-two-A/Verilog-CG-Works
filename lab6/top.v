module top (
    input clk100mhz,
    input rst,
    input [3:0] sw_floor_in,    // button inside, [3:0] -> 4F:1F
    input sw_1f_up,             // button outside, 0 inactive, 1 active 
    input sw_2f_up,             // button outside, 0 inactive, 1 active 
    input sw_2f_down,           // button outside, 0 inactive, 1 active 
    input sw_3f_up,             // button outside, 0 inactive, 1 active 
    input sw_3f_down,           // button outside, 0 inactive, 1 active 
    input sw_4f_down,           // button outside, 0 inactive, 1 active 
    output [3:0] pos,
    output [7:0] seg
);
    wire [3:0] sw_floor_in_led;
    wire [3:0] clr;
    wire [3:0] des;
    wire [15:0] dataBus;
    wire clk190hz, clk3hz;
    wire [3:0] cur_floor;
    wire is_open;
    wire [1:0] move;

    clkDiv clkDiv(clk100mhz, clk190hz, clk3hz);
    keyled keyled0(clk100mhz, rst, sw_floor_in[0], sw_floor_in_led[0]);
    keyled keyled1(clk100mhz, rst, sw_floor_in[1], sw_floor_in_led[1]);
    keyled keyled2(clk100mhz, rst, sw_floor_in[2], sw_floor_in_led[2]);
    keyled keyled3(clk100mhz, rst, sw_floor_in[3], sw_floor_in_led[3]);
    signalCombiner signalCombiner(clk100mhz, rst, sw_floor_in_led, sw_1f_up, sw_2f_up, sw_2f_down, sw_3f_up, sw_3f_down, sw_4f_down, clr ,des);
    elevator elevator(clk3hz, rst, des, cur_floor, is_open, move, clr);
    GPU GPU(clk100mhz, rst, cur_floor, is_open, move, dataBus);
    segMsg segMsg(clk190hz,dataBus,pos,seg);
endmodule