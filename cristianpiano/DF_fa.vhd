library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity divisor_frecuencia_fa is
    port (
        clk_50MHz : in  std_logic;  -- Entrada de reloj 50 MHz
        reset     : in  std_logic;  -- Reset activo alto (1 = reset)
        nota_fa   : out std_logic   -- Salida nota Fa (349.23 Hz)
    );
end entity divisor_frecuencia_fa;

architecture Behavioral of divisor_frecuencia_fa is
    -- Cálculo del divisor: (50,000,000/(349.23*2))-1 = 71579
    constant DIVISOR : natural := 71579;
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
                salida <= not salida;  -- Genera flanco de subida/bajada
            else
                contador <= contador + 1;
            end if;
        end if;
    end process;

    nota_fa <= salida;
end architecture Behavioral;