library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
use IEEE.std_logic_unsigned.all;

entity adder4a is 
    port(
        a: in std_logic_vector(3 downto 0);
        b: in std_logic_vector(3 downto 0);
        cf: out std_logic;
        ovf: out std_logic;
        s: out std_logic_vector(3 downto 0)
    );
end adder4a;

architecture adder4a of adder4a is 
-- intermediate carries 
signal c: std_logic_vector(4 downto 0);
begin 
    c(0) <= '0';
    s <= a xor b xor c(3 downto 0);
    c(4 downto 1) <= (a and b) or (c(3 downto 0) and (a xor b));
    cf <= c(4);
    ovf <= c(3) xor c(4);
end adder4a;
