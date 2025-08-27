// =============================================
// Testbench para o módulo mux4
// =============================================

`include "mux4.v"
`timescale 1ns/1ps

module mux4_tb;

    // Entradas do multiplexador
    reg I1, I2, I3, I4;
    reg S1, S2;
    wire O;

    // Instanciação do DUT (Device Under Test)
    mux4 dut (
        .I1(I1),
        .I2(I2),
        .I3(I3),
        .I4(I4),
        .S1(S1),
        .S2(S2),
        .O(O)
    );

    // Geração das formas de onda
    initial begin
        $dumpfile("mux4.vcd");
        $dumpvars(0, mux4_tb);

        // Teste com diferentes combinações de seleção
        I1 = 0; I2 = 1; I3 = 0; I4 = 1;

        S1 = 0; S2 = 0; #10; // Espera-se O = I1
        S1 = 0; S2 = 1; #10; // Espera-se O = I2
        S1 = 1; S2 = 0; #10; // Espera-se O = I3
        S1 = 1; S2 = 1; #10; // Espera-se O = I4

        // Mudança nas entradas
        I1 = 1; I2 = 0; I3 = 1; I4 = 0;

        S1 = 0; S2 = 0; #10; // Espera-se O = I1
        S1 = 0; S2 = 1; #10; // Espera-se O = I2
        S1 = 1; S2 = 0; #10; // Espera-se O = I3
        S1 = 1; S2 = 1; #10; // Espera-se O = I4

        $finish;
    end

endmodule