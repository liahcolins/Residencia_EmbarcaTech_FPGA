`include "codificadorbcd3x2.v"
`timescale 1ns/100ps

module codificadorbcd3x2_tb;
reg e1, e2, e3;
wire s0, s1;
codificadorbcd3x2 uut (.e1(e1),.e2(e2),.e3(e3),.s0(s0),.s1(s1));

initial begin
$dumpfile("codificadorbcd3x2.vcd");
$dumpvars(0, codificadorbcd3x2_tb);
     e1 = 0; e2 = 0; e3 = 0;
#10; e1 = 0; e2 = 0; e3 = 1; 
#10; e1 = 0; e2 = 1; e3 = 0; 
#10; e1 = 0; e2 = 1; e3 = 1; 
#10; e1 = 1; e2 = 0; e3 = 0; 
#10; e1 = 1; e2 = 0; e3 = 1;
#10; e1 = 1; e2 = 1; e3 = 0; 
#10; e1 = 1; e2 = 1; e3 = 1; 
#10; $finish;
end
endmodule