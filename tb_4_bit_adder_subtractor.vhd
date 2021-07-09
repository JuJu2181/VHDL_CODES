library ieee;
use ieee.std_logic_1164.all;

entity tb_4_bit_adder_subtractor is 
    --empty
end tb_4_bit_adder_subtractor;

architecture tb of tb_4_bit_adder_subtractor is
    component addsub4 is
        port(
            a: in std_logic_vector(3 downto 0);
            b: in std_logic_vector(3 downto 0);
            E: in std_logic;
            cf: out std_logic;
            ovf: out std_logic;
            s: out std_logic_vector(3 downto 0)
        );
    end component;

    signal a_in, b_in: std_logic_vector(3 downto 0);
    signal E_in, cf_out, ovf_out: std_logic;
    signal sum: std_logic_vector(3 downto 0);

    begin
    addsub4instance: addsub4 port map(a_in, b_in,E_in, cf_out, ovf_out,sum);

    process 
        begin
            -- for adder operations E 0
            a_in <= "0010";
            b_in <= "0011";
            E_in <= '0';
            wait for 1 ns;

            a_in <= "1001";
            b_in <= "1001";
            E_in <= '0';
            wait for 1 ns;

            -- for subtactor operation E 1

            a_in <= "0000";
            b_in <= "0101";
            E_in <= '1';
            wait for 1 ns;

            a_in <= "1010";
            b_in <= "1100";
            E_in <= '1';
            wait for 1 ns;

            a_in <= "1010";
            b_in <= "0010";
            E_in <= '1';
            wait for 1 ns;

            wait;
    end process; 

end tb;
