module seqdetea_tb (
    
    
    );
    reg clk;
    reg clr;
    reg din;
    wire dout;
    parameter PERIOD = 100;
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
        din = 1;
        #50 din = 0;
        #50 din = 1;
        #100 din = 0;
        #50 din = 1;
        #50 din = 0;
        #100 din = 1;
        #50 din = 0;
        #200 din = 1;
        #50 din = 0;
        #150 din = 1;
        #50 din = 0;
        #150 din = 1;
        #100 din = 0;
    end
endmodule