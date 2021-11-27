`timescale 1 ps/ 1 ps
module mux2to1_BH_tb();

reg a;
reg b;
reg sel;
// wires                                               
wire out;

// assign statements (if any)                          
mux2to1_BH i1 (
// port map - connection between master ports and signals/registers   
    .a(a),
    .b(b),
    .out(out),
    .sel(sel)
);

initial                                                
begin                                                  
    a = 0;
    b = 0;
    sel = 0;
    $dumpfile("wave.vcd");        //生成的vcd文件名称
    $dumpvars(0, mux2to1_BH_tb);     //tb模块名称
end                  

always
begin
    #40 a = 1;
    #40 a = 0;
end

always
begin
    #20 b = 1;
    #20 b = 0;
    #20 b = 1;
    #20 b = 0;
end

always
begin
    #80 sel = 1;
    #80 sel = 0;
end
                                 
endmodule