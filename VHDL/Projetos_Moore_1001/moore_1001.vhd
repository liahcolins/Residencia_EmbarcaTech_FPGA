-- FSM Moore para detectar sequência "1001"
library ieee;
use ieee.std_logic_1164.all;

entity moore_1001 is
    port (
        clk     : in std_logic;
        reset   : in std_logic;
        din     : in std_logic;
        dout    : out std_logic
    );
end moore_1001;

architecture behavior of moore_1001 is
    type state_type is (S0, S1, S2, S3, S4);
    signal state, next_state : state_type;
begin

    -- Processo de transição de estado com reset síncrono
    process(clk, reset)
    begin
        if reset = '1' then
            state <= S0;
        elsif rising_edge(clk) then
            state <= next_state;
        end if;
    end process;

    -- Processo de lógica de transição e definição da saída Moore
    process(state, din)
    begin
        case state is
            when S0 =>
                dout <= '0';
                if din = '1' then
                    next_state <= S1;
                else
                    next_state <= S0;
                end if;

            when S1 =>
                dout <= '0';
                if din = '0' then
                    next_state <= S2;
                else
                    next_state <= S1;
                end if;

            when S2 =>
                dout <= '0';
                if din = '0' then
                    next_state <= S3; -- ← CORRIGIDO
                else
                    next_state <= S1;
                end if;

            when S3 =>
                dout <= '0';
                if din = '1' then
                    next_state <= S4; -- sequência "1001" completa
                else
                    next_state <= S0;
                end if;

            when S4 =>
                dout <= '1'; -- ← saída Moore ativada no estado
                if din = '1' then
                    next_state <= S1;
                else
                    next_state <= S0;
                end if;

            when others =>
                dout <= '0';
                next_state <= S0;
        end case;
    end process;

end behavior;
