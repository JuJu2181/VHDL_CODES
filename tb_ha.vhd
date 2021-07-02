library IEEE;
use IEEE.std_logic_1164.all;

entity tb_ha is
-- empty
end tb_ha;

architecture tb of tb_ha is

    component ha is
    port(
    a,b: in std_logic;
    c,s: out std_logic
    );
    end component;

    signal a_in, b_in, cout, sum : std_logic;

    begin

    hainstance1: ha port map(a_in, b_in, cout, sum); --ha component instance is DUT

    process
        begin
        a_in <= '0';
        b_in <= '0';
        wait for 1 ns;

        a_in <= '0';
        b_in <= '1';
        wait for 1 ns;

        a_in <= '1';
        b_in <= '0';
        wait for 1 ns;

        a_in <= '1';
        b_in <= '1';
        wait for 1 ns;

        wait;
    end process;
end tb;
