library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity tb_4_bit_fa_alt is 
end tb_4_bit_fa_alt;

architecture rtl of tb_4_bit_fa_alt is 
    --component
    component adder4b is
        port(
            a: in std_logic_vector(3 downto 0);
            b: in std_logic_vector(3 downto 0);
            s: out std_logic_vector(3 downto 0);
            cf: out std_logic;
            ovf: out std_logic
        );
    end component;
    --signals
    signal a_in,b_in,sum: std_logic_vector(3 downto 0);
    signal cf,ovf:std_logic;

    begin 
    fainstance: adder4b port map(a_in,b_in,sum,cf,ovf);
    process 
        begin 
            a_in <= "0010";
            b_in <= "0011";
            wait for 1 ns;

            a_in <= "1001";
            b_in <= "1001";
            wait for 1 ns;

            a_in <= "0111";
            b_in <= "1000";
            wait for 1 ns;

            wait;
    end process;
end rtl;
