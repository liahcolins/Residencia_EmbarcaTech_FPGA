//exercício 8
module sr_latch(
    input logic s,r,
    output q, nq
);

    nor g1(q, r, nq);
    nor g2(nq, s, q);
endmodule