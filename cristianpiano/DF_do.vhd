library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity divisor_frecuencia_do is
    port (
        clk_50MHz : in  std_logic;   -- Entrada de reloj de 50 MHz
        reset     : in  std_logic;   -- Señal de reset
        clk_do    : out std_logic    -- Salida de la nota Do (261.63 Hz)
    );
end entity divisor_frecuencia_do;

architecture behavioral of divisor_frecuencia_do is
    -- Constante para dividir 50 MHz a 261.63 Hz
    -- Cálculo: (50,000,000 / (261.63 * 2)) - 1 ≈ 95555
    constant MAX_COUNT : integer := 95555;
    signal counter     : integer range 0 to MAX_COUNT := 0;
    signal toggle      : std_logic := '0';
begin
    process(clk_50MHz, reset)
    begin
        if reset = '1' then
            counter <= 0;
            toggle <= '0';
        elsif rising_edge(clk_50MHz) then
            if counter = MAX_COUNT then
                counter <= 0;
                toggle <= not toggle;
            else
                counter <= counter + 1;
            end if;
        end if;
    end process;

    clk_do <= toggle;
end architecture behavioral;