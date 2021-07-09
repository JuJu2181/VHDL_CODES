library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity half_adder_subtractor is 
    port(
        a,b,e: in std_logic;
        cb,sd: out std_logic
    );
end half_adder_subtractor;

architecture rtl of half_adder_subtractor is
begin 
    -- process(e)
    --     begin 
    --     if(e='0') then
    --         --half adder 
    --         sd <= a xor b;
    --         cb <= a and b;
    --     elsif(e='1') then
    --         --half subtractor
    --         sd <= a xor b;
    --         cb <= not a and b;
    --     end if;
    -- end process;
    -- Alternatively using xor 
    sd <= a xor b;
    cb <= (e xor a) and b;
end rtl;
