-- alternatively imlementing algorithm
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
use ieee.std_logic_unsigned.all;

entity mult4a_alt is 
    port(
        -- for M X Q
        M: in std_logic_vector(3 downto 0); --multiplicand M
        Q: in std_logic_vector(3 downto 0); --multiplier Q
        P: out std_logic_vector(7 downto 0)
    );
end mult4a_alt;

architecture rtl of mult4a_alt is 
begin
    process(M,Q)
    variable Acc: std_logic_vector(4 downto 0); -- her Acc is made 4 bit as the MSB will be carry out, IN CAQ instead of using C and A seperately here CA combines to give 4 bit A
    variable Qtemp: std_logic_vector(3 downto 0);
    begin
        Acc := "00000";
        Qtemp := Q;
        -- bp := Acc & Q;
        for i in 0 to 3 loop
            -- comparing each bit of original Q i-e Q0 with 1
            if Q(i) = '1' then 
            -- add accumulator and multiplicand
                Acc := Acc + M;
            end if;
            -- Right shift Q and Accumulator
            Qtemp := Acc(0) & Qtemp(3 downto 1);
            Acc := '0' & Acc(4 downto 1);
        end loop;
        -- content of A and Q is the actual 8 bit product
        P <= Acc(3 downto 0) & Qtemp;
    end process;
end rtl;
