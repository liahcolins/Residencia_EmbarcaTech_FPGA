module exercicio3(
    input logic a, b, c,
    output logic s
);
    logic w1, w2;

    assign w1 = a & c;
    assign w2 = a & b;
    assign s = w1 | w2;
endmodule