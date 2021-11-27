// 4bit CLA
module CLA (
    cin,cout,p,g
);
    input [3:0] p,g;
    input cin;
    output [3:0] cout;

    assign cout[0] = g[0] ^ (p[0] & cin);
    assign cout[1] = g[1] ^ (p[1] & g[0]) ^ (p[1]&p[0]&cin);
    assign cout[2] = g[2] ^ (p[2] & g[1]) ^ (p[2]&p[1]&g[0]) ^ (p[2]&p[1]&p[0]&cin);
    assign cout[3] = g[3] ^ (p[3]&g[2]) ^ (p[3]&p[2]&g[1]) ^ (p[3]&p[2]&p[1]&g[0]) ^ (p[3]&p[2]&p[1]&p[0]&cin);
endmodule

// add4
module add4 (
    a,b,cin,cout,S,Gm,Pm
);
    input [3:0] a;  // 设置4位二进制输入x,y
    input [3:0] b;
    input cin;      //设置二进制输入进位c0
    output cout,Gm,Pm; //设置二进制输出进位c4
    output [3:0] S; //设置二进制输出4位数F

    wire [3:0] c,p,g;

    add1 m_add1_1(.a(a[0]),.b(b[0]),.cin(cin),.sum(S[0]),.cout());
    add1 m_add1_2(.a(a[1]),.b(b[1]),.cin(c[0]),.sum(S[1]),.cout());
    add1 m_add1_3(.a(a[2]),.b(b[2]),.cin(c[1]),.sum(S[2]),.cout());
    add1 m_add1_4(.a(a[3]),.b(b[3]),.cin(c[2]),.sum(S[3]),.cout());

    CLA CLA(cin,c[3:0],p[3:0],g[3:0]);

    assign p[0] = a[0] ^ b[0];
    assign p[1] = a[1] ^ b[1];	  
    assign p[2] = a[2] ^ b[2];
    assign p[3] = a[3] ^ b[3];
    
    assign g[0] = a[0] & b[0];
    assign g[1] = a[1] & b[1];
    assign g[2] = a[2] & b[2];
    assign g[3] = a[3] & b[3];

    assign Pm = p[0]&p[1]&p[2]&p[3];
    assign Gm = g[3] ^ (p[3]&g[2]) ^ (p[3]&p[2]&g[1]) ^ (p[3]&p[2]&p[1]&g[0]);
    
endmodule

module add16 (
    a,b,cin,S,Pm,Gm
);
    input [15:0] a,b;
    input cin;
    output Pm,Gm;
    output [15:0] S;

    wire c4,c8,c12;
    wire [4:1] p,g;

    add4 m_add4_1(.a(a[3:0]),.b(b[3:0]),.cin(cin),.cout(),.S(S[3:0]),.Gm(g[1]),.Pm(p[1]));
    add4 m_add4_2(.a(a[7:4]),.b(b[7:4]),.cin(c4),.cout(),.S(S[7:4]),.Gm(g[2]),.Pm(p[2]));
    add4 m_add4_3(.a(a[11:8]),.b(b[11:8]),.cin(c8),.cout(),.S(S[11:8]),.Gm(g[3]),.Pm(p[3]));
    add4 m_add4_4(.a(a[15:12]),.b(b[15:12]),.cin(c12),.cout(),.S(S[15:12]),.Gm(g[4]),.Pm(p[4]));
    
    assign   c4 = g[1] ^ (p[1] & cin),//计算各个分级位进位输出取值
	         c8 = g[2] ^ (p[2] & g[1]) ^ (p[2] & p[1] & cin),
			 c12 = g[3] ^ (p[3] & g[2]) ^ (p[3] & p[2] & g[1]) ^ (p[3] & p[2] & p[1] & cin);
 
   assign  Pm = p[1] & p[2] & p[3] & p[4],//p和g分别为16进位传递输出和进位产生输出
	       Gm = g[4] ^ (p[4] & g[3]) ^ (p[4] & p[3] & g[2]) ^ (p[4] & p[3] & p[2] & g[1]);
endmodule


module csadd32 (
    a,b,cin,sum,cout
);
    input [32:1] a;
	input [32:1] b;
    input cin;
	output [33:1] sum;
	output cout;
	 
	wire px1,gx1,px2,gx2; //设置中间操作变量
    wire c16;

    add16 m_add16_1(a[16:1],b[16:1],cin,sum[16:1],px1,gx1);
    add16 m_add16_2(a[32:17],b[32:17],c16,sum[32:17],px2,gx2);

    assign  c16 = gx1 ^ (px1 && 0),     //默认AB相加时c0 = 0
            cout = gx2 ^ (px2 && c16),   //确定32位输出进位为c32
            sum[33]=cout;
endmodule
