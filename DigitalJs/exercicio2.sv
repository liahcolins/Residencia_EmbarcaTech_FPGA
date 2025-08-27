module exercicio2(
    input logic a, b, c, d, e,
    output logic z
);
    logic w1, w2, w3, w4;

    assign w1 = a & b;
    assign w2 = c ^ d;
    assign w3 = ~e;
    assign w4 = w2 & w3;
    assign z = w1 | w4;
endmodule