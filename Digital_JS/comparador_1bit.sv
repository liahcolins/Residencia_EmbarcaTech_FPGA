module comparador_1bit(
    input logic a,b,
    output logic s1, s2, s3
);

    assign s1 = ~(a ^ b);
    assign s2 = a & ~b;
    assign s3 = ~a & b;
endmodule