library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity mux_8a1_notas is
    Port ( 
        out_do        : in  STD_LOGIC;
        out_re        : in  STD_LOGIC;
        out_mi        : in  STD_LOGIC;
        out_fa        : in  STD_LOGIC;
        out_sol       : in  STD_LOGIC;
        out_la        : in  STD_LOGIC;
        out_si        : in  STD_LOGIC;
        out_do_agudo  : in  STD_LOGIC;
        sel           : in  STD_LOGIC_VECTOR (2 downto 0);
        nota_salida   : out STD_LOGIC
    );
end mux_8a1_notas;

architecture Behavioral of mux_8a1_notas is
begin
    process(sel, out_do, out_re, out_mi, out_fa, out_sol, out_la, out_si, out_do_agudo)
    begin
        case sel is
            when "000" => nota_salida <= out_do;
            when "001" => nota_salida <= out_re;
            when "010" => nota_salida <= out_mi;
            when "011" => nota_salida <= out_fa;
            when "100" => nota_salida <= out_sol;
            when "101" => nota_salida <= out_la;
            when "110" => nota_salida <= out_si;
            when "111" => nota_salida <= out_do_agudo;
            when others => nota_salida <= '0';
        end case;
    end process;
end Behavioral;
