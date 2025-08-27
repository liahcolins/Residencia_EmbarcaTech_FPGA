module d_latch_portas (
 input D, // Entrada de dado
 input CLK, // Sinal de controle (habilitação)
 output Q, // Saída principal
 output QN // Saída complementar
);
 wire Dn, S, R; // Fios internos: inverso de D, sinais S e R
 // Inversor: Dn = ~D
 nand (Dn, D, D); 
 // Geração dos sinais de controle S e R
 and (R, Dn, CLK); 
 and (S, D, CLK); 
 // Latch SR com portas NOR cruzadas
 nor (Q, R, QN); // Q depende de R e QN
 nor (QN, S, Q); // QN depende de S e Q
endmodule