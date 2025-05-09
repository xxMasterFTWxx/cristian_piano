library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity divisor_frecuencia_si is
    port (
        clk_50MHz : in  std_logic;   -- Entrada de reloj de 50 MHz
        reset     : in  std_logic;   -- Reset activo en alto
        nota_si    : out std_logic    -- Salida de 493.88 Hz (nota SI)
    );
end divisor_frecuencia_si;

architecture Behavioral of divisor_frecuencia_si is
    -- Cálculo del divisor: 50,000,000/(2*493.88) ≈ 50619.5
    constant DIVISOR : integer := 50620;  -- Redondeado para mejor precisión
    signal counter   : integer range 0 to DIVISOR-1 := 0;
    signal toggle    : std_logic := '0';
begin
    process(clk_50MHz, reset)
    begin
        if reset = '1' then
            counter <= 0;
            toggle  <= '0';
        elsif rising_edge(clk_50MHz) then
            if counter = DIVISOR-1 then
                counter <= 0;
                toggle  <= not toggle;
            else
                counter <= counter + 1;
            end if;
        end if;
    end process;

    nota_si <= toggle;
end Behavioral;