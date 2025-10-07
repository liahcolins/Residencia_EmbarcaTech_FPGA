module bcd_7seg (
    input  wire clk,       // Clock de entrada
    output logic a,        // Segmento A
    output logic b,        // Segmento B
    output logic c,        // Segmento C
    output logic d,        // Segmento D
    output logic e,        // Segmento E
    output logic f,        // Segmento F
    output logic g         // Segmento G
);

    logic [3:0] bcd;
    logic [6:0] seg; // vetor intermediário: {a,b,c,d,e,f,g}

    //logic [3:0] bcd = 4'd0;
    localparam int DIV_1HZ = 12_500_000;  
    
    logic [$clog2(DIV_1HZ)-1:0] freq_counter = '0;
    logic clk_1hz = 1'b0;

    always_ff @(posedge clk) begin
        if (freq_counter == DIV_1HZ-1) begin 
            freq_counter <= '0; 
            clk_1hz <= ~clk_1hz; 
        end
        else begin
            freq_counter <= freq_counter + 1'b1;      
        end
    end

    // Contador BCD simples (0 a 9)
    always_ff @(posedge clk_1hz) begin
        if (bcd == 4'd9)
            bcd <= 4'd0;
        else
            bcd <= bcd + 1;
    end

    // Decodificador BCD para 7 segmentos (cátod comum)
    always_comb begin
        case (bcd)
            4'd0: seg = 7'b1111110; 
            4'd1: seg = 7'b0110000;
            4'd2: seg = 7'b1101101;
            4'd3: seg = 7'b1111001;
            4'd4: seg = 7'b0110011;
            4'd5: seg = 7'b1011011;
            4'd6: seg = 7'b1011111;
            4'd7: seg = 7'b1110000;
            4'd8: seg = 7'b1111111;
            4'd9: seg = 7'b1111011;
            default: seg = 7'b0000000; 
        endcase
    end

    // Conecta os bits do vetor seg às saídas nominais dos segmentos
    always_comb begin
        a = seg[0];
        b = seg[1];
        c = seg[2];
        d = seg[3];
        e = seg[4];
        f = seg[5];
        g = seg[6];
    end

endmodule
