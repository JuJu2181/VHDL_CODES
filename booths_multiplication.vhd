-- 5 bit booths multiplier
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
use ieee.std_logic_unsigned.all;

entity booths_multiplier is 
    port(
        -- for M X Q, M, Q is of 5 bits converted to 6 bits and Product will be of 12 bits 
        M: in std_logic_vector(5 downto 0); --multiplicand M
        Q: in std_logic_vector(5 downto 0); --multiplier Q
        P: out std_logic_vector(11 downto 0) -- product 
    );
end booths_multiplier;

architecture rtl of booths_multiplier is 
begin
    process(M,Q)
    -- here for 5 bit numbers we consider 6 bit Acc, Q and M
    variable Acc: std_logic_vector(5 downto 0); -- 6 bit accumulator
    variable Qtemp: std_logic_vector(5 downto 0); -- 6 bit Q
    variable Q1temp: std_logic; -- 1 bit Q-1
    variable Q0Q1: std_logic_vector(1 downto 0); -- 2bit Q0Q-1
    variable count: integer; -- count 
    begin
        ---------- !!!! Initialization !!!! --------------
        Acc := "000000"; -- Acc inittally 0
        count := 6; -- for 5 bit numbers count is 6
        Qtemp := Q; -- original Q
        Q1temp := '0'; -- Q-1 initially 0
        ---------- !!!!! Main Loop !!!! -------------------
        while count > 0 loop
            -- concat Q0 and Q-1
            Q0Q1 := Qtemp(0) & Q1temp;
            -- if 10 subtract M from Acc
            if Q0Q1 = "10" then 
                Acc := Acc - M;
            -- if 01 add M to Acc
            elsif Q0Q1 = "01" then 
                Acc := Acc + M;
            end if;
            -- Arithmetic right shift of AQQ1
            Q1temp := Qtemp(0);
            Qtemp(4 downto 0) := Qtemp(5 downto 1);
            Qtemp(5) := Acc(0);
            Acc(4 downto 0) := Acc(5 downto 1);
            -- first bit of acc determines next bit for acc
            if Acc(5) = '1' then 
                Acc(5) := '1';
            else 
                Acc(5) := '0';
            end if;
            count := count - 1;
        end loop;
        -- content of A and Q is the actual 10 bit product
        P <= Acc & Qtemp;
    end process;
end rtl;
