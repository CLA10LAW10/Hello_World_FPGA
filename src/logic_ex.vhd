library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity logic_ex is
    Port ( SW : in STD_LOGIC_VECTOR (1 downto 0);
           LED : out STD_LOGIC_VECTOR (3 downto 0));
end logic_ex;

architecture Behavioral of logic_ex is

    signal not1, and1, or1, xor1 : std_logic := '0';

begin

    not1 <= NOT SW(0);
    and1 <= SW(1) AND SW(0);
    or1 <= SW(1) OR SW(0);
    xor1 <= SW(1) XOR SW(0);
    
    LED <= xor1 & or1 & and1 & not1;

end Behavioral;

--ERROR: [XSIM 43-3980] File "/home/clayton/Documents/CSUN/ECE524/Labs/Lab1/sp23-e524-lab1-hello-world-CLA10LAW10/sim/logic_ex_tb_sysverilog.sv" Line 8 : The SystemVerilog feature " Wildcard pattern .* " is not supported yet for simulation.
-- 21 Minuts of Lab 1 video. Fresh Linux Image