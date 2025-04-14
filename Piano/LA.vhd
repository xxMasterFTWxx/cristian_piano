library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity divisor_la is
    Port ( clk : in STD_LOGIC;
           reset : in STD_LOGIC;
           out_la : out STD_LOGIC);
end divisor_la;

architecture Behavioral of divisor_la is
    constant MAX_COUNT : integer := 56818;
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

    out_la <= toggle;
end Behavioral;
