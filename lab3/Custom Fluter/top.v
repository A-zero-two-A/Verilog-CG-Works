// module top(
//     input clk100mhz,
//     input clr,
//     output [3:0] pos,
//     output [7:0] seg
// );
// wire clk190hz,clk3hz;
// wire [15:0]dataBus;

// clkDiv U1(clk100mhz,clk190hz,clk3hz);
// GPU U2(clk3hz,clr,dataBus);
// segMsg U3(clk190hz,dataBus,pos,seg);


// endmodule
module top(
    input sw_add,
    // input sw_sub,
    input sw_left,
    // input sw_right,
    input clk100mhz,
    input rst,
    input clr,
    input enable,
    output [3:0] pos0,pos1,
    output [7:0] seg0,seg1
);
wire clk190hz,clk3hz;
wire [31:0]dataBus;
wire sw_add_led, sw_left_led;

clkDiv U1(clk100mhz,clk190hz,clk3hz);
GPU U2(clk3hz, clr, sw_add_led,/* sw_sub,*/ sw_left_led,/* sw_right,*/ enable, dataBus);
segMsg U3(clk190hz,dataBus[15:0],pos0,seg0);
segMsg U4(clk190hz,dataBus[31:16],pos1,seg1);
keyled U5(clk100mhz,rst,sw_left,sw_left_led);
keyled U6(clk100mhz,rst,sw_add,sw_add_led);


endmodule