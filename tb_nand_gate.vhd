library IEEE;
use IEEE.std_logic_1164.all;

entity tb_nand_gate is
-- empty
end tb_nand_gate;

architecture tb of tb_nand_gate is

    component nandgate is
    port(a,b:in std_logic;
        c: out std_logic
    );
    end component;

    signal a_in, b_in, cout: std_logic;

    begin

    nandgateinstance: nandgate port map(a_in, b_in, cout); 
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
