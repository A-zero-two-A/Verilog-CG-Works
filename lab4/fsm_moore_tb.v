`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/12/09 15:54:51
// Design Name: 
// Module Name: fsm_mealy_tb
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module seqdetea_tb (
    
    
    );
    reg clk;
    reg clr;
    reg din;
    wire dout;
    parameter PERIOD = 40;
    seqdetea seqdetea(
        .clk(clk),
        .clr(clr),
        .din(din),
        .dout(dout)
    );
    initial begin
        $dumpfile("wave.vcd");
        $dumpvars(0, seqdetea_tb);
        clk = 0;
        forever begin
            #(PERIOD/2) clk = 1;
            #(PERIOD/2) clk = 0;
        end
    end
    initial begin
        clr = 1;
        forever begin
            #50 clr = 0;
        end
    end
    initial begin
        din = 0;
        #80 din = 1;
        #40 din = 1;
        #40 din = 0;
        #40 din = 1;
        #40 din = 0;
        #40 din = 0;
        #40 din = 1;
        #40 din = 0;
        #40 din = 0;
        #40 din = 0;
        #40 din = 0;
        #40 din = 1;
        #40 din = 0;
        #40 din = 0;
        #40 din = 0;
        #40 din = 1;
        #40 din = 0;
        #40 din = 0;
        #40 din = 0;
        #40 din = 1;
        #40 din = 1;
    end
endmodule