library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity fourbitadder is 
    port(
        a,b: in std_logic_vector(3 downto 0);
        cin: in std_logic;
        cout: out std_logic;
        sum: out std_logic_vector(3 downto 0)
    );
end fourbitadder;

architecture rtl of fourbitadder is 
    --individual full adder
    component fa is 
        port(
            a,b,cin: in std_logic;
            cout,s: out std_logic
        );
    end component;

    --signals
    signal c1,c2,c3: std_logic;

    begin 
    -- in map instead of writing a=>a(0) only a can also be written
    fa1: fa port map(a=>a(0), b=>b(0), cin=>cin, cout=>c1, s=>sum(0));
    fa2: fa port map(a=>a(1), b=>b(1), cin=>c1, cout=>c2, s=>sum(1));
    fa3: fa port map(a=>a(2), b=>b(2), cin=>c2, cout=>c3, s=>sum(2));
    fa4: fa port map(a=>a(3), b=>b(3), cin=>c3, cout=>cout, s=>sum(3));

end rtl;