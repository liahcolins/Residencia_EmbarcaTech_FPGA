@echo off
echo ========================================
echo Compilando os arquivos VHDL com GHDL...
echo ========================================
ghdl -a moore_1001.vhd
ghdl -a tb_moore_1001.vhd

echo ========================================
echo Elaborando o testbench...
echo ========================================
ghdl -e tb_moore_1001

echo ========================================
echo Executando simulação...
echo ========================================
ghdl -r tb_moore_1001 --vcd=moore_1001.vcd --stop-time=300ns

echo ========================================
echo Abrindo GTKWave...
echo ========================================
gtkwave moore_1001.vcd

del *.cf
pause