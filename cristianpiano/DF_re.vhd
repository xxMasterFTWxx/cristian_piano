library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity divisor_frecuencia_re is
    port (
        clk_50MHz : in  std_logic;  -- Entrada de reloj 50 MHz
        reset     : in  std_logic;  -- Reset activo alto
        nota_re   : out std_logic   -- Salida nota Re (293.66 Hz)
    );
end entity divisor_frecuencia_re;

architecture Behavioral of divisor_frecuencia_re is
    -- Divisor para 293.66 Hz: (50,000,000/(293.66*2))-1 = 85117
    constant DIVISOR : natural := 85117;
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

    nota_re <= salida;
end architecture Behavioral;