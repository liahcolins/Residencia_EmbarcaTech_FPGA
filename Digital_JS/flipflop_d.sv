module d_latch(
 input d, e, // d = dado, e = enable
 output q, nq // q = saída, nq = saída invertida
);
 logic s, r, nd;
 not g5(nd, d); // nd = ~d
 and g3(r, e, nd); // r = e & ~d
 and g4(s, e, d); // s = e & d
 nor g1(q, r, nq); // q = ~(r | nq)
 nor g2(nq, s, q); // nq = ~(s | q)
endmodule

module dff_master_slave(
 input clk, d, // clk = clock, d = entrada
 output o // o = saída final
);
 logic q, nq1, nq2, nclk;
 not g(nclk, clk); // nclk = ~clk
 d_latch dl1(d, clk, q, nq1); // Latch mestre (ativo com clk = 1)
 d_latch dl2(q, nclk, o, nq2); // Latch escravo (ativo com clk = 0)
endmodule