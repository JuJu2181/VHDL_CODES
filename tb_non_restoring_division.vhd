library ieee;
use ieee.std_logic_1164.all;

entity tb_non_restoring_division is 
end tb_non_restoring_division;

architecture tb of tb_non_restoring_division is
    component non_restoring_division is
        port(
            -- Q/M , M originally of 4 bits converted to 5 bits for division
            Q: in std_logic_vector(3 downto 0); -- dividend
            M: in std_logic_vector(4 downto 0); -- divisor
            Qt: out std_logic_vector(3 downto 0); -- quotient 
            Rm: out std_logic_vector(4 downto 0) -- remainder
        );
    end component;

    signal Q_in: std_logic_vector(3 downto 0) := "0000";
    signal M_in: std_logic_vector(4 downto 0) := "00000";
    signal Qt: std_logic_vector(3 downto 0) := "0000";
    signal Rm: std_logic_vector(4 downto 0) := "00000";

    begin
    divinstance: non_restoring_division port map(Q_in, M_in,Qt,Rm);

    process 
        begin
            Q_in <= "1110";
            M_in <= "00011";
            wait for 1 ns;

            Q_in <= "1011";
            M_in <= "00011";
            wait for 1 ns;

            Q_in <= "1010";
            M_in <= "00010";
            wait for 1 ns;
            wait;
    end process; 

end tb;
