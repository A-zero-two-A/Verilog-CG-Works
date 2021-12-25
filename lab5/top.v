module top (
    input clk100mhz,
    input rst,
    input sw_add,
    input [3:0] price,
    input [3:0] num,
    output [3:0] pos0,pos1,
    output [7:0] seg0,seg1
);
    wire clk190hz, clk3hz;
    wire [3:0] price_temp;
    wire [3:0] num_temp;
    wire [7:0] cur_unit_price;
    wire [3:0] total_num;
    wire [7:0] total_price;
    wire [31:0] dataBus;
    
    wire sw_add_led;

    clkDiv clkDiv(clk100mhz,clk190hz,clk3hz);
    unit_price unit_price(clk100mhz,rst,price,num,price_temp,num_temp,cur_unit_price);
    AC_mode AC_mode (clk100mhz,rst,sw_add_led,cur_unit_price,total_num,total_price);
    GPU GPU(clk100mhz,rst,price,num,cur_unit_price,total_num,total_price,sw_add,dataBus);
    segMsg segMsg0(clk190hz,dataBus[15:0],pos0,seg0);
    segMsg segMsg1(clk190hz,dataBus[31:16],pos1,seg1);
    keyled keyled(clk100mhz,rst,sw_add,sw_add_led);
endmodule