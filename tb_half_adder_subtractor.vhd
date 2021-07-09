library ieee;
use ieee.std_logic_1164.all;

entity tb_half_adder_subtractor is 
    --empty
end tb_half_adder_subtractor;

architecture tb of tb_half_adder_subtractor is
    component half_adder_subtractor is
        port(
            a,b,e: in std_logic;
            cb,sd: out std_logic
        );
    end component;

    signal a_in, b_in,E: std_logic;
    signal cb_out,sd_out: std_logic;

    begin
    addsubinstance: half_adder_subtractor port map(a_in, b_in,E, cb_out, sd_out);

    process 
        begin
            -- for adder operations E 0
            a_in <= '0';
            b_in <= '0';
            E <= '0';
            wait for 1 ns;

            a_in <= '0';
            b_in <= '1';
            E <= '0';
            wait for 1 ns;
    
            a_in <= '1';
            b_in <= '0';
            E <= '0';
            wait for 1 ns;

            a_in <= '1';
            b_in <= '1';
            E <= '0';
            wait for 1 ns;
            
            -- for subtractor operations E 1

            a_in <= '0';
            b_in <= '0';
            E <= '1';
            wait for 1 ns;

            a_in <= '0';
            b_in <= '1';
            E <= '1';
            wait for 1 ns;
    
            a_in <= '1';
            b_in <= '0';
            E <= '1';
            wait for 1 ns;

            a_in <= '1';
            b_in <= '1';
            E <= '1';
            wait for 1 ns;

            wait;
    end process; 

end tb;
