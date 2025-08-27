// =============================================
// Módulo: Multiplexador 4 para 1
// =============================================
// Entradas:
//   - I1, I2, I3, I4: dados de entrada
//   - S1, S2: linhas de seleção
// Saída:
//   - O: saída selecionada
// =============================================

module mux4 (
    input wire I1,
    input wire I2,
    input wire I3,
    input wire I4,
    input wire S1,
    input wire S2,
    output wire O
);

    // Seleção usando atribuição condicional
    assign O = (S1 == 0 && S2 == 0) ? I1 :
               (S1 == 0 && S2 == 1) ? I2 :
               (S1 == 1 && S2 == 0) ? I3 :
               I4;

endmodule
