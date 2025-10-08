# Residencia_EmbarcaTech_FPGA
System Verilog, Iverilog, VHDL para programação de circuitos digitais e FPGA

## Digital JS
Trabalha com arquivos .sv na linguagem _**System Verilog**_. Para execução, basta instalar a extensão _**DigitalJS**_ no Visual Studio Code e clicar na porta lógica no canto superior direito e posteriormente, em synthesize. Logo em seguida será gerado o circuito simulado.

## Icarus Verilog
É preciso baixar o _**Icarus Verilog**_ pelo link: https://bleyer.org/icarus/iverilog-v12-20220611-x64_setup.exe <br>

Na sua instalação, é preciso que a caixa "add to path" esteja selecionada para que o caminho até o bin do iverilog e do gtkwave da pasta esteja no path das variáveis de usuário.<br>

A instalação do Icarus vem também com o _**gtkwave**_, onde aparecerá a simulação. Após isso, é necessário baixar também a extensão "Verilog HDL" no VsCode.<br>

Os arquivos serão o formato .v e será necessáio inicialmente a criação de dois, o arquivo principal, onde será montada a lógica do circuito e um arquivo secundário onde será montada a organização da simulação do circuito, o tb (test band), bancada de testes para simualação.<br>

Os outros arquivos serão gerados pelas seguinte linhas de comando que deverão ser digitadas no terminal do VsCode dentro da pasta onde os dois primeiros arquivos foram inseridos:<br>
  
 > _**iverilog -o nomedoarquivo.vvp nomedoarquivo.v <br>**_
 > _**iverilog -o nomedoarquivo_tb.vvp nomedoarquivo_tb.v <br>**_
 > _**vvp nomedoarquivo_tb.vvp <br>**_
 > _**gtkwave nomedoarquivo.vcd <br>**_

Após a execução desses comandos, ficará um somatório de 5 arquivos e abrirá uma janela do gtkwave com as entradas e saídas em formas de onda na simulação.

## VHDL
Inicialmente é necessária a instalação de dois links, o primeiro é o do ***VHDL***: https://github.com/ghdl/ghdl/releases/tag/v5.1.1 <br>
O segundo é do ***gtkwave***: https://gtkwave.sourceforge.net/ <br>

Após a instalação dos links acima, deve-se copiar as duas pastas para o disco C e descompactá-las. A partir disso, é necessário copiar o caminho até o bin de cada pasta e colar no path das variáveis de sistema. Após isso, o programa já poderá ser executado no VsCode. Os arquivos serão .vhd e deverão, assim como no iverilog, ser dois, um principal e um tb de teste band.<br>

Novamente, os outros arquivos serão gerados após as seguintes linhas de comando:

>***ghdl -a nomedoarquivo.vhd <br>***
>***ghdl -a tb_nomedoarquivo.vhd <br>***
>***ghdl -e tb_nomedoarquivo <br>***
>***ghdl -r tb_nomedoarquivo --vcd=onda.vcd <br>***
>***gtkwave onda.vcd <br>***

Ao finalizar a execução dos comandos, a pasta deverá ter 4 arquivos e o gtkwave deve ter iniciado. Assim, a execução terá sido bem sucedida. Caso o arquivo vcd esteja ficando muito grande, podemos adicionar --stop-time=120ns antes de --vcd=onda.vcd, assim o arquivo rodará normalmente, sem problemas.

## System Verilog
Anteriormente, é necessário baixar todos os programas, como o ***Lattice Diamond***, e fazer todas as ***configurações*** necessárias. Após isso você terá duas opções, executar pelo ***VsCode*** ou pelo ***Lattice Diamond***. Em ambos, serão necessários três arquivos:<br>

1. Um arquivo principal, onde será feito a estrutura e lógica do código: ***nomedoarquivo.sv*** <br>
2. Um arquivo colorlight que referencia todas entradas e saídas associando-as aos pinos do FPGA: ***colorlight_i9.lpf*** <br>
3. Um arquivo bat referenciando os outros arquivos e configurando o projeto: ***flash_openfpgaloader.bat*** <br>

### VsCode:
Obtendo os três arquivos, podemos rodar no terminal do VsCode o arquivo .bat, basta digitá-lo no cmd com a placa conectada que os arquivos adicionais (.ldf, .bit, etc) serão gerados e logo em seguida, o código será passado para a placa e executado.

OBS: O nome dado ao **module** no arquivo .sv deve ser o mesmo nome deste arquivo e, também, o mesmo nome referenciado em "set TOP=" no arquivo .bat.

### Lattice Diamond
Abra o Lattice -> new -> project -> escreva o nome do arquivo, com o mesmo nome do impl declarado no arquivo .bat -> selecione o arquivo ->

