module exercicio4(
    input logic a, b, c,
    output logic s
);
    logic w1, w2;

    assign w1 = a & ~b;
    assign w2 = c & ~b;
    assign s = w1 | w2;
endmodule