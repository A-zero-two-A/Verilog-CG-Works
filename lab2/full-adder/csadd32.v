module csadd32 (
    input  wire [31:0] a,
    input  wire [31:0] b,
    input  wire        cin,
    output wire [31:0] s,
    output wire        cout
);

  wire [31:0] sum0;
  wire [31:0] sum1;
  wire [31:0] carry0;

  wire [31:0] carry1;
  wire [31:0] select;

  genvar i;
  generate
    for (i = 0; i < 32; i = i + 1) begin : selet_adders
      add1 u_add1_0 (
          .a(a[i]),
          .b(b[i]),
          .cin(1'b0),
          .sum(sum0[i]),
          .cout(carry0[i])
      );

      add1 u_add1_1 (
          .a(a[i]),
          .b(b[i]),
          .cin(1'b1),
          .sum(sum1[i]),    
          .cout(carry1[i])
      );

      if (i == 0) begin
        assign s[i] = (cin == 1'b0) ? sum0[i] : sum1[i];
        assign select[i] = (cin == 1'b0) ? carry0[i] : carry1[i];
      end else begin
        assign s[i] = (select[i-1] == 1'b0) ? sum0[i] : sum1[i];
        assign select[i] = (select[i-1] == 1'b0) ? carry0[i] : carry1[i];
      end
    end
  endgenerate
  assign cout = select[31];

endmodule

module add1 (
    input  wire a,
    input  wire b,
    input  wire cin,
    output wire sum,
    output wire cout
);
  assign sum  = a ^ b ^ cin;
  assign cout = (a & b) | (cin & (a ^ b));
endmodule

