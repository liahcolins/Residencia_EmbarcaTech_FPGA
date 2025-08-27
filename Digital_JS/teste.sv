module latch_sr_xor(
    input logic ns, nr,
    output logic q, nq
);

    nand g1(q, ns, nq);
    nand g2(nq, nr, q);
endmodule