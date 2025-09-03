-- Testbench para Registrador de 4 bits
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity tb_reg4 is
end tb_reg4;

architecture Behavioral of tb_reg4 is
    component reg4
        port(
            D       : in  STD_LOGIC_VECTOR(3 downto 0);
            Resetn  : in  STD_LOGIC;
            Clock   : in  STD_LOGIC;
            Q       : out STD_LOGIC_VECTOR(3 downto 0)
        );
    end component;
    
    signal D_tb      : STD_LOGIC_VECTOR(3 downto 0);
    signal Resetn_tb : STD_LOGIC;
    signal Clock_tb  : STD_LOGIC := '0';
    signal Q_tb      : STD_LOGIC_VECTOR(3 downto 0);
    
    constant clock_period : time := 10 ns;
    
begin
    -- Instanciação do DUT (Device Under Test)
    uut: reg4 port map (
        D => D_tb,
        Resetn => Resetn_tb,
        Clock => Clock_tb,
        Q => Q_tb
    );
    
    -- Geração do clock
    clock_process: process
    begin
        Clock_tb <= '0';
        wait for clock_period/2;
        Clock_tb <= '1';
        wait for clock_period/2;
    end process;
    
    -- Processo de estímulos
    stim_proc: process
    begin
        -- Reset inicial
        Resetn_tb <= '0';
        D_tb <= "0000";
        wait for 20 ns;
        
        -- Libera reset
        Resetn_tb <= '1';
        wait for 10 ns;
        
        -- Testa diferentes valores
        D_tb <= "1010";
        wait for 20 ns;
        
        D_tb <= "1111";
        wait for 20 ns;
        
        D_tb <= "0101";
        wait for 20 ns;
        
        -- Testa reset durante operação
        Resetn_tb <= '0';
        wait for 10 ns;
        Resetn_tb <= '1';
        wait for 20 ns;
        
        wait;
    end process;
end Behavioral;
