library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity divisor_do is
    Port ( clk : in STD_LOGIC;
           reset : in STD_LOGIC;
           out_do : out STD_LOGIC);
end divisor_do;

architecture Behavioral of divisor_do is
    constant MAX_COUNT : integer := 95529;
    signal counter : integer range 0 to MAX_COUNT := 0;
    signal toggle : STD_LOGIC := '0';
begin
    process(clk, reset)
    begin
        if reset = '1' then
            counter <= 0;
            toggle <= '0';
        elsif rising_edge(clk) then
            if counter = MAX_COUNT then
                counter <= 0;
                toggle <= not toggle;
            else
                counter <= counter + 1;
            end if;
        end if;
    end process;

    out_do <= toggle;
end Behavioral;
