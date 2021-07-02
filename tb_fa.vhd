library ieee;
use ieee.std_logic_1164.all;

entity tb_fa is 
    --empty
end tb_fa;

architecture tb of tb_fa is
    component full_adder is
        port(
            a,b,cin: in std_logic;
            s,cout: out std_logic
        );
    end component;

    signal a_in, b_in, c_in, sum, c_out: std_logic;

    begin
    fainstance: full_adder port map(a_in, b_in, c_in, sum, c_out);

    process 
        begin
            a_in <= '0';
            b_in <= '0';
            c_in <= '0';
            wait for 1 ns;
    
            a_in <= '0';
            b_in <= '0';
            c_in <= '1';
            wait for 1 ns;
            
            a_in <= '0';
            b_in <= '1';
            c_in <= '0';
            wait for 1 ns;

            a_in <= '0';
            b_in <= '1';
            c_in <= '1';
            wait for 1 ns;

            a_in <= '1';
            b_in <= '0';
            c_in <= '0';
            wait for 1 ns;

            a_in <= '1';
            b_in <= '0';
            c_in <= '1';
            wait for 1 ns;

            a_in <= '1';
            b_in <= '1';
            c_in <= '0';
            wait for 1 ns;

            a_in <= '1';
            b_in <= '1';
            c_in <= '1';
            wait for 1 ns;
            wait;
    end process; 

end tb;
