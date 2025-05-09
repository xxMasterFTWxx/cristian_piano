library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity divisor_frecuencia_sol is
    port (
        clk_50MHz : in  std_logic;  -- Entrada de 50 MHz
        reset     : in  std_logic;  -- Reset activo en alto
        nota_sol  : out std_logic   -- Salida de nota Sol (392 Hz)
    );
end entity divisor_frecuencia_sol;

architecture Behavioral of divisor_frecuencia_sol is
    -- Cálculo preciso: (50,000,000/(392.00*2))-1 = 63775
    constant DIVISOR : natural := 63775;
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
                salida <= not salida;  -- Invierte el estado
            else
                contador <= contador + 1;
            end if;
        end if;
    end process;

    nota_sol <= salida;
end architecture Behavioral;