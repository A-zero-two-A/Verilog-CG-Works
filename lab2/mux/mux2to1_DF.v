//Dataflow description of 2-to-1-line multiplexer
module mux2to1_DF(
            a,b,sel,
            out
            );
            
input a,b,sel;
output out;

assign out = (a&sel) |(b&(~sel));    //out = sel ? a : b;    

endmodule
