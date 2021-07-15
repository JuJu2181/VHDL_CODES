library ieee;
use ieee.std_logic_1164.all;

entity tb_booths_multiplier is 
end tb_booths_multiplier;

architecture tb of tb_booths_multiplier is
    component booths_multiplier is
        port(
            -- for M X Q
            M: in std_logic_vector(5 downto 0); --multiplicand M
            Q: in std_logic_vector(5 downto 0); --multiplier Q
            P: out std_logic_vector(11 downto 0) -- product 
        );
    end component;

    signal M_in, Q_in: std_logic_vector(5 downto 0);
    signal P_out: std_logic_vector(11 downto 0);

    begin
    multinstance: booths_multiplier port map(M_in, Q_in,P_out);

    process 
        begin
            M_in <= "001001";
            Q_in <= "111101";
            wait for 1 ns;
    
            M_in <= "110110";
            Q_in <= "010001";
            wait for 1 ns;
            
            M_in <= "111001";
            Q_in <= "001010";
            wait for 1 ns;

            M_in <= "000010";
            Q_in <= "000110";
            wait for 1 ns;

            M_in <= "000011";
            Q_in <= "000010";
            wait for 1 ns;

            M_in <= "110000";
            Q_in <= "001010";
            wait for 1 ns;

            wait;
    end process; 

end tb;
