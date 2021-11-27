//Behavioral description of 2-to-1-line multiplexer
module mux2to1_BH(
                a,b,sel,
                out
                );
            
input a,b,sel;
output out;
reg out;

always @ (*)
begin
    if(sel == 1'b1)
        out = a;
    else
        out = b;
end

endmodule