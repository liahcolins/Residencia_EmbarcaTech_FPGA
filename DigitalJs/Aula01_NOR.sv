module porta_nor(
    input logic a,
    inout logic b,
    output logic y
);

    assign y = ~(a | b);
endmodule