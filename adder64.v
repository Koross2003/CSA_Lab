module adder64(
    input[63:0] a,
    input[63:0] b,
    input cin,
    input sub,
    output[63:0] s,
    output[63:0] cout
    );
    wire[63:0] b_in;
    wire cin_in;
    wire[3:0] p;
    wire[3:0] g;
    wire[3:0] c;
    assign b_in = sub ? ~b : b;
    assign cin_in = sub ^ cin;
    adder16 a0(.a(a[15:0]), .b(b_in[15:0]), .cin(cin_in), .gout(g[0]), .pout(p[0]), .s(s[15:0]), .cout(cout[15:0]));
    adder16 a1(.a(a[31:16]), .b(b_in[31:16]), .cin(c[0]), .gout(g[1]), .pout(p[1]), .s(s[31:16]), .cout(cout[31:16]));
    adder16 a2(.a(a[47:32]), .b(b_in[47:32]), .cin(c[1]), .gout(g[2]), .pout(p[2]), .s(s[47:32]), .cout(cout[47:32]));
    adder16 a3(.a(a[63:48]), .b(b_in[63:48]), .cin(c[2]), .gout(g[3]), .pout(p[3]), .s(s[63:48]), .cout(cout[63:48]));
    cla u_cla(.p(p), .g(g), .cin(cin), .cout(c), .pout(), .gout());
endmodule