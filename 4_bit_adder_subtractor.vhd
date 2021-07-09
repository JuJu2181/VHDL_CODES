library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity addsub4 is 
    port(
        a: in std_logic_vector(3 downto 0);
        b: in std_logic_vector(3 downto 0);
        E: in std_logic;
        cf: out std_logic;
        ovf: out std_logic;
        s: out std_logic_vector(3 downto 0)
    );
end addsub4;

architecture addsub4 of addsub4 is 
-- intermediate carries 
signal c: std_logic_vector(4 downto 0);
signal bx: std_logic_vector(3 downto 0); --b input to adder 
begin 
    bx <= b xor E & E & E & E;
    c(0) <= E;
    s <= a xor bx xor c(3 downto 0);
    c(4 downto 1) <= (a and bx) or (c(3 downto 0) and (a xor bx));
    cf <= c(4);
    ovf <= c(3) xor c(4);
end addsub4;
