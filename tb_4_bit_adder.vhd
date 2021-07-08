library ieee;
use ieee.std_logic_1164.all;

entity tb_4_bit_fa is 
    --empty
end tb_4_bit_fa;

architecture tb of tb_4_bit_fa is
    component fourbitadder is
        port(
            a,b: in std_logic_vector(3 downto 0);
            sum: out std_logic_vector(3 downto 0);
            cin: in std_logic;
            cout: out std_logic
        );
    end component;

    signal a_in, b_in,sum: std_logic_vector(3 downto 0);
    signal c_in, c_out: std_logic;

    begin
    fainstance: fourbitadder port map(a_in, b_in,sum, c_in, c_out);

    process 
        begin
            a_in <= "0000";
            b_in <= "0001";
            c_in <= '0';
            wait for 1 ns;
    
            a_in <= "1001";
            b_in <= "1001";
            c_in <= '0';
            wait for 1 ns;
            
            wait;
    end process; 

end tb;
