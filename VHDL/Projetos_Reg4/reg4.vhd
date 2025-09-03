-- Registrador de 4 bits com Reset Assíncrono
-- Baseado em: Digital Design and Computer Architecture (Harris & Harris)
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity reg4 is
    port(
        D       : in  STD_LOGIC_VECTOR(3 downto 0);  -- Entrada de dados
        Resetn  : in  STD_LOGIC;                     -- Reset ativo baixo
        Clock   : in  STD_LOGIC;                     -- Clock
        Q       : out STD_LOGIC_VECTOR(3 downto 0)   -- Saída
    );
end reg4;

architecture Behavioral of reg4 is
begin
    process(Resetn, Clock)
    begin
        if Resetn = '0' then
            Q <= "0000";
        elsif rising_edge(Clock) then
            Q <= D;
        end if;
    end process;
end Behavioral;
