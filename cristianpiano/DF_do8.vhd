library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity divisor_frecuencia_Do8 is
    port (
        clk_50MHz : in  std_logic;   -- Entrada de reloj de 50 MHz
        reset     : in  std_logic;   -- Reset activo en alto
        nota_Do8   : out std_logic    -- Salida de 1046.50 Hz (Do6)
    );
end divisor_frecuencia_Do8;

architecture Behavioral of divisor_frecuencia_Do8 is
    -- Cálculo preciso: 50,000,000/(2*1046.50) ≈ 23888.7 → 23889
    constant DIVISOR : integer := 23889;
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

    nota_Do8 <= toggle;
end Behavioral;