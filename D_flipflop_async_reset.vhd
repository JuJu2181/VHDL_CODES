library ieee;
use ieee.std_logic_1164.all;

entity dff is 
    port(
        d,clk,rst:in std_logic;
        q:out std_logic
    );
end dff;

architecture behavior of dff is 
begin
    process(rst,clk)
        begin 
        if(rst='1') then
            q<='0';
        elsif(clk'event and clk = '1') then
        -- elsif rising_edge(clk) then
            q <=d;
        end if;
    end process;
end behavior;