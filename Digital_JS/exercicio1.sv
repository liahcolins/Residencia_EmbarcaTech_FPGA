module exercicio1(
    input logic a,
    input logic b,
    input logic c,
    output logic y
);

    assign y = ((a & b) | (~a & ~c));
endmodule