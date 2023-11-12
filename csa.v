`timescale 1ns / 1ps

module csa( // 保留进位加法器
    input[63:0] x, // 第一个加数
    input[63:0] y, // 第二个加数
    input[63:0] z, // 第三个加数
    output[63:0] s, // 和
    output[63:0] c // 进位
    );
    genvar i;
    generate
        for (i=0; i<64; i=i+1)
        begin: bit
            assign s[i] = x[i] ^ y[i] ^ z[i];
            assign c[i] = (x[i] & y[i]) | (y[i] & z[i]) | (z[i] & x[i]);
        end
    endgenerate
endmodule