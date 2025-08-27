module codificadorbcd3x2(e1, e2, e3, s0, s1);
    input e1, e2, e3;
    output s0, s1;

assign s0 = e2 | e3;
assign s1 = e1 | e3;
endmodule
