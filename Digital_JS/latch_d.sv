module latch_portas (
 input A, // Entrada de dado
 input B, // Sinal de controle (habilitação)
 output S, C // Saída complementar
);
assing S = A ^ B;
assing C = ~A & B;

endmodule