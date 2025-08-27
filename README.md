# Residencia_EmbarcaTech_FPGA
System Verilog, Iverilog, VHDL para programação de circuitos digitais e FPGA

## Digital JS
Trabalha com arquivos .sv na linguagem _**System Verilog**_. Para execução, basta instalar a extensão _**DigitalJS**_ no Visual Studio Code e clicar na porta lógica no canto superior direito e posteriormente, em synthesize. Logo em seguida será gerado o circuito simulado.

## Icarus Verilog
É preciso baixar o _**Icarus Verilog**_ pelo link: https://bleyer.org/icarus/iverilog-v12-20220611-x64_setup.exe <br>

A instalação do Icarus vem também com o _**gtkwave**_, onde aparecerá a simulação. Após isso, é necessário baixar também a extensão "Verilog HDL" no VsCode.<br>

Os arquivos serão o formato .v e será necessáio inicialmente a criação de dois, o arquivo principal, onde será montada a lógica do circuito e um arquivo secundário onde será montada a organização da simulação do circuito, o tb (test band), bancada de testes para simualação.<br>

Os outros arquivos serão gerados pelas seguinte linhas de comando que deverão ser digitadas no terminal do VsCode dentro da pasta onde os dois primeiros arquivos foram inseridos:<br>
  
 > _**iverilog -o nomedoarquivo.vvp nomedoarquivo.v <br>**_
 > _**iverilog -o nomedoarquivo_tb.vvp nomedoarquivo_tb.v <br>**_
 > _**vvp nomedoarquivo_tb.vvp <br>**_
 > _**gtkwave nomedoarquivo.vcd <br>**_

Após a execução desses comandos, abrirá uma janela do gtkwave com as entradas e saídas em formas de onda na simulação.


