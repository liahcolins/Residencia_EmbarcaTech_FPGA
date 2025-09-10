library ieee;
use ieee.std_logic_1164.all;

entity tb_moore_1001 is
end tb_moore_1001;

architecture test of tb_moore_1001 is
    signal clk   : std_logic := '0';
    signal reset : std_logic := '1';
    signal din   : std_logic := '0';
    signal dout  : std_logic;

    component moore_1001
        port (
            clk   : in std_logic;
            reset : in std_logic;
            din   : in std_logic;
            dout  : out std_logic
        );
    end component;

begin

    -- Instanciação do DUT (Device Under Test)
    uut: moore_1001 port map(clk, reset, din, dout);

    -- Geração de clock (20 ns período)
    clk_process : process
    begin
        while True loop
            clk <= '0'; wait for 10 ns;
            clk <= '1'; wait for 10 ns;
        end loop;
    end process;

    -- Estímulos de entrada
    stim_proc: process
    begin
        -- Reset
        reset <= '1'; wait for 25 ns;
        reset <= '0'; wait for 20 ns;

        -- Sequência correta: "1 0 0 1" → dout = '1' no estado final
        din <= '1'; wait for 20 ns;
        din <= '0'; wait for 20 ns;
        din <= '0'; wait for 20 ns;
        din <= '1'; wait for 20 ns;

        -- Espera e aplica nova sequência válida
        wait for 40 ns;
        din <= '1'; wait for 20 ns;
        din <= '0'; wait for 20 ns;
        din <= '0'; wait for 20 ns;
        din <= '1'; wait for 20 ns;

        -- Fim do teste
        wait;
    end process;

end test;
