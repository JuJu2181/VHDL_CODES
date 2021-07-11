library ieee;
use ieee.std_logic_1164.all;

entity tb_4_bit_multiplier is 
end tb_4_bit_multiplier;

architecture tb of tb_4_bit_multiplier is
    component mult4a is
        port(
            -- for A X B
            a: in std_logic_vector(3 downto 0); --multiplicand A
            b: in std_logic_vector(3 downto 0); --multiplier B
            p: out std_logic_vector(7 downto 0) --product
        );
    end component;

    signal a_in, b_in: std_logic_vector(3 downto 0);
    signal p_out: std_logic_vector(7 downto 0);

    begin
    multinstance: mult4a port map(a_in, b_in,p_out);

    process 
        begin
            a_in <= "0010";
            b_in <= "0001";
            wait for 1 ns;
    
            a_in <= "1001";
            b_in <= "0101";
            wait for 1 ns;
            
            a_in <= "1001";
            b_in <= "1000";
            wait for 1 ns;

            a_in <= "0011";
            b_in <= "0101";
            wait for 1 ns;

            wait;
    end process; 

end tb;
