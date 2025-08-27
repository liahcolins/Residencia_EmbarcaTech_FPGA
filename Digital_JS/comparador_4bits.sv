module comparador_4bits(
    input logic a0, a1, a2, a3,
    input logic b0, b1, b2, b3,
    output logic s1, s2, s3
);
    //a = b
    logic x1, x2, x3, x4;
    assign x1 = ~(a3 ^ b3);
    assign x2 = ~(a2 ^ b2);
    assign x3 = ~(a1 ^ b1);
    assign x4 = ~(a0 ^ b0);
    assign s1 = x1 & x2 & x3 & x4;

    //a > b
    logic y1, y2, y3, y4;
    assign y1 = a3 & ~b3;
    assign y2 = x1 & a2 & ~b2;
    assign y3 = x1 & x2 & a1 & ~b1;
    assign y4 = x1 & x2 & x3 & a0 & ~b0;
    assign s2 = y1 | y2 | y3 | y4;

    //a < b
    logic z1, z2, z3, z4;
    assign z1 = ~a3 & b3;
    assign z2 = x1 & ~a2 & b2;
    assign z3 = x1 & x2 & ~a1 & b1;
    assign z4 = x1 & x2 & x3 & ~a0 & b0;
    assign s3 = z1 | z2 | z3 | z4;

endmodule