library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
use ieee.std_logic_unsigned.all;

entity non_restoring_division is 
    port(
        -- Q/M , M originally of 4 bits converted to 5 bits for division
        Q: in std_logic_vector(3 downto 0); -- dividend
        M: in std_logic_vector(4 downto 0); -- divisor
        Qt: out std_logic_vector(3 downto 0); -- quotient 
        Rm: out std_logic_vector(4 downto 0) -- remainder
    );
end non_restoring_division;

architecture rtl of non_restoring_division is 
begin
    process(M,Q)
    variable A: std_logic_vector(4 downto 0); -- 5 bit accumulator
    variable Qtemp: std_logic_vector(3 downto 0); -- 4 bit Q
    variable Mtemp: std_logic_vector(4 downto 0); -- M 
    variable M1temp: std_logic_vector(4 downto 0); -- 2's complement of M
    variable count: integer; -- count 
    begin
        ---------- !!!! Initialization !!!! --------------
        A := "00000"; -- Acc inittally 0
        count := 4; -- for 4 bit numbers count is 4
        Qtemp := Q; -- original Q
        Mtemp := M; -- original M
        M1temp := (not M) + "00001"; -- 2's complement of M 
        ---------- !!!!! Main Loop !!!! -------------------
        while count > 0 loop
            --shift left A, Q
            A(4 downto 1) := A(3 downto 0);
            A(0) := Qtemp(3);
            Qtemp(3 downto 1) := Qtemp(2 downto 0);
            -- compare A if A < 0 
            if A(4) = '1' then
                A := A + Mtemp;
            else 
                A := A + M1temp;
            end if;
            -- compare A A < 0 
            if A(4) = '1' then
                Qtemp(0) := '0';
            else 
                Qtemp(0) := '1';
            end if;
            count := count - 1;
        end loop;
        -- compare if A > 0
        if A(4) = '0' then
            Qt <=Qtemp;
            Rm <= A;
        else
            A := A + Mtemp;
            Qt <= Qtemp;
            Rm <= A;
        end if;
    end process;
end rtl;
