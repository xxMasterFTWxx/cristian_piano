library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity divisor_frecuencia_mi is
    port (
        clk_50MHz : in  std_logic;  -- Entrada de reloj 50 MHz
        reset     : in  std_logic;  -- Reset activo alto
        nota_mi   : out std_logic   -- Salida nota Mi (329.63 Hz)
    );
end entity divisor_frecuencia_mi;

architecture Behavioral of divisor_frecuencia_mi is
    -- Divisor para 329.63 Hz: (50,000,000/(329.63*2))-1 = 75817
    constant DIVISOR : natural := 75817;
    signal contador  : natural range 0 to DIVISOR := 0;
    signal salida    : std_logic := '0';
begin
    process(clk_50MHz, reset)
    begin
        if reset = '1' then
            contador <= 0;
            salida <= '0';
        elsif rising_edge(clk_50MHz) then
            if contador = DIVISOR then
                contador <= 0;
                salida <= not salida;
            else
                contador <= contador + 1;
            end if;
        end if;
    end process;

    nota_mi <= salida;
end architecture Behavioral;