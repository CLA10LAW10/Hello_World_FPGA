library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity logic_ex is
    Port ( SW : in STD_LOGIC_VECTOR (1 downto 0);
           LED : out STD_LOGIC_VECTOR (3 downto 0));
end logic_ex;

architecture Behavioral of logic_ex is

begin

    LED(0) <= NOT SW(0);
    LED(1) <= SW(1) AND SW(0);
    LED(2) <= SW(1) OR SW(0);
    LED(3) <= SW(1) XOR SW(0);

end Behavioral;