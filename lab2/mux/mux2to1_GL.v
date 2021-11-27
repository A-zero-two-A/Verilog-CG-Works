//Gate-level description of 2-to-1-line multiplexer
module mux2to1_GL(
               a,b,sel,
               out
               );
               
input a,b,sel;        
output out;
wire nsel,a1,b1;    //定义中间变量

not U1(nsel,sel);
and U2(b1,b,nsel);
and U3(a1,a,sel);
or  U4(out,a1,b1);
endmodule