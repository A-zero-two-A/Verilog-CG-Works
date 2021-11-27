// ripple-carry adder
module	rcadd32(
    Ai,Bi,Cin,S,OUT
);
    input [31:0] Ai,Bi;
	input Cin;
    output [31:0] S,OUT;
    wire [30:0] CY;
    
    add1 U0(Ai[0],Bi[0],Cin,S[0],CY[0]);
    add1 U1(Ai[1],Bi[1],CY[0],S[1],CY[1]);
	add1 U2(Ai[2],Bi[2],CY[1],S[2],CY[2]);
	add1 U3(Ai[3],Bi[3],CY[2],S[3],CY[3]);
	add1 U4(Ai[4],Bi[4],CY[3],S[4],CY[4]);
	add1 U5(Ai[5],Bi[5],CY[4],S[5],CY[5]);
	add1 U6(Ai[6],Bi[6],CY[5],S[6],CY[6]);
	add1 U7(Ai[7],Bi[7],CY[6],S[7],CY[7]);
	add1 U8(Ai[8],Bi[8],CY[7],S[8],CY[8]);
	add1 U9(Ai[9],Bi[9],CY[8],S[9],CY[9]);
	add1 U10(Ai[10],Bi[10],CY[9],S[10],CY[10]);
	add1 U11(Ai[11],Bi[11],CY[10],S[11],CY[11]);
	add1 U12(Ai[12],Bi[12],CY[11],S[12],CY[12]);
	add1 U13(Ai[13],Bi[13],CY[12],S[13],CY[13]);
	add1 U14(Ai[14],Bi[14],CY[13],S[14],CY[14]);
	add1 U15(Ai[15],Bi[15],CY[14],S[15],CY[15]);
	add1 U16(Ai[16],Bi[16],CY[15],S[16],CY[16]);
	add1 U17(Ai[17],Bi[17],CY[16],S[17],CY[17]);
	add1 U18(Ai[18],Bi[18],CY[17],S[18],CY[18]);
	add1 U19(Ai[19],Bi[19],CY[18],S[19],CY[19]);
	add1 U20(Ai[20],Bi[20],CY[19],S[20],CY[20]);
	add1 U21(Ai[21],Bi[21],CY[20],S[21],CY[21]);
	add1 U22(Ai[22],Bi[22],CY[21],S[22],CY[22]);
	add1 U23(Ai[23],Bi[23],CY[22],S[23],CY[23]);
	add1 U24(Ai[24],Bi[24],CY[23],S[24],CY[24]);
	add1 U25(Ai[25],Bi[25],CY[24],S[25],CY[25]);
	add1 U26(Ai[26],Bi[26],CY[25],S[26],CY[26]);
	add1 U27(Ai[27],Bi[27],CY[26],S[27],CY[27]);
	add1 U28(Ai[28],Bi[28],CY[27],S[28],CY[28]);
	add1 U29(Ai[29],Bi[29],CY[28],S[29],CY[29]);
	add1 U30(Ai[30],Bi[30],CY[29],S[30],CY[30]);
	add1 U31(Ai[31],Bi[31],CY[30],S[31],OUT);

endmodule