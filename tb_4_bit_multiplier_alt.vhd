library ieee;
use ieee.std_logic_1164.all;

entity tb_4_bit_multiplier_alt is 
end tb_4_bit_multiplier_alt;

architecture tb of tb_4_bit_multiplier_alt is
    component mult4a_alt is
        port(
            -- for M X Q
            M: in std_logic_vector(3 downto 0); --multiplicand M
            Q: in std_logic_vector(3 downto 0); --multiplier Q
            P: out std_logic_vector(7 downto 0)
        );
    end component;

    signal M_in, Q_in: std_logic_vector(3 downto 0);
    signal P_out: std_logic_vector(7 downto 0);

    begin
    multinstance: mult4a_alt port map(M_in, Q_in,P_out);

    process 
        begin
            M_in <= "0010";
            Q_in <= "0001";
            wait for 1 ns;
    
            M_in <= "1001";
            Q_in <= "0101";
            wait for 1 ns;
            
            M_in <= "1001";
            Q_in <= "1000";
            wait for 1 ns;

            M_in <= "0011";
            Q_in <= "0101";
            wait for 1 ns;

            wait;
    end process; 

end tb;
