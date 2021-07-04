library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity tb_dflipflop is 
end tb_dflipflop;

architecture rtl of tb_dflipflop is 
component dff
    port(
        clk,d,rst:in std_logic;
        q:out std_logic
    );
end component;

signal d: std_logic :='0';
signal q: std_logic;
signal rst: std_logic :='1';
signal clk: std_logic := '0';

-- to avoid warning space before ns
constant clk_period: time :=1 ns;

begin 
-- here the order should be same as order in port above
    dut:dff port map(clk,d,rst,q);
    clk_process: process 
    begin 
        clk<='0'; 
        wait for clk_period/2;
        clk<='1';
        wait for clk_period/2;
    end process; 

    testprocess: process 
    begin 
        rst<='1';
        wait for 5 ns; 

        rst <='0';
        d<='0';
        wait for 5 ns;

        rst <= '0';
        d<='1';

        wait;
    end process;

end rtl;