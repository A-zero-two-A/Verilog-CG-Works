module seqdetb_tb (
);
    reg clk;
    reg clr;
    reg din;
    wire dout;
    
    parameter  PERIOD = 40;
    seqdetb seqdetb(clk, clr, din, dout);

    initial begin
        $dumpfile("wave.vcd");
        $dumpvars(0, seqdetb_tb);
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
        #350 din =0;
        #50 din = 1;
        #100 din = 0;
        #50 din = 1;
    end
endmodule