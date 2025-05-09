library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity divisor_frecuencia_la is
    port (
        clk_50MHz : in  std_logic;  -- Entrada de 50 MHz
        reset     : in  std_logic;  -- Reset activo en alto (1 = reset)
        nota_la   : out std_logic   -- Salida nota La (440 Hz)
    );
end entity divisor_frecuencia_la;

architecture Behavioral of divisor_frecuencia_la is
    -- Cálculo preciso: (50,000,000/(440.00*2))-1 = 56817
    constant DIVISOR : natural := 56817;
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
                salida <= not salida;  -- Genera flancos de subida/bajada
            else
                contador <= contador + 1;
            end if;
        end if;
    end process;

    nota_la <= salida;
end architecture Behavioral;