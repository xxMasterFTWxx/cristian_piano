library ieee;
use ieee.std_logic_1164.all;

entity mux_16to1_individual is
    port (
        -- 16 entradas individuales
        din0, din1, din2, din3, din4, din5, din6, din7, 
        din8, din9, din10, din11, din12, din13, din14, din15 : in std_logic;
        
        -- 4 señales de selección individuales
        sel0, sel1, sel2, sel3 : in std_logic;
        
        -- Salida
        dout : out std_logic
    );
end mux_16to1_individual;

architecture Behavioral of mux_16to1_individual is
    signal selection : integer range 0 to 15;
begin
    -- Convertir señales de selección binarias a entero
    selection <= 0 when (sel3 = '0' and sel2 = '0' and sel1 = '0' and sel0 = '0') else
                 1 when (sel3 = '0' and sel2 = '0' and sel1 = '0' and sel0 = '1') else
                 2 when (sel3 = '0' and sel2 = '0' and sel1 = '1' and sel0 = '0') else
                 3 when (sel3 = '0' and sel2 = '0' and sel1 = '1' and sel0 = '1') else
                 4 when (sel3 = '0' and sel2 = '1' and sel1 = '0' and sel0 = '0') else
                 5 when (sel3 = '0' and sel2 = '1' and sel1 = '0' and sel0 = '1') else
                 6 when (sel3 = '0' and sel2 = '1' and sel1 = '1' and sel0 = '0') else
                 7 when (sel3 = '0' and sel2 = '1' and sel1 = '1' and sel0 = '1') else
                 8 when (sel3 = '1' and sel2 = '0' and sel1 = '0' and sel0 = '0') else
                 9 when (sel3 = '1' and sel2 = '0' and sel1 = '0' and sel0 = '1') else
                10 when (sel3 = '1' and sel2 = '0' and sel1 = '1' and sel0 = '0') else
                11 when (sel3 = '1' and sel2 = '0' and sel1 = '1' and sel0 = '1') else
                12 when (sel3 = '1' and sel2 = '1' and sel1 = '0' and sel0 = '0') else
                13 when (sel3 = '1' and sel2 = '1' and sel1 = '0' and sel0 = '1') else
                14 when (sel3 = '1' and sel2 = '1' and sel1 = '1' and sel0 = '0') else
                15; -- (sel3 = '1' and sel2 = '1' and sel1 = '1' and sel0 = '1')
    
    -- Multiplexación
    dout <= din0  when selection = 0 else
            din1  when selection = 1 else
            din2  when selection = 2 else
            din3  when selection = 3 else
            din4  when selection = 4 else
            din5  when selection = 5 else
            din6  when selection = 6 else
            din7  when selection = 7 else
            din8  when selection = 8 else
            din9  when selection = 9 else
            din10 when selection = 10 else
            din11 when selection = 11 else
            din12 when selection = 12 else
            din13 when selection = 13 else
            din14 when selection = 14 else
            din15;
end Behavioral;