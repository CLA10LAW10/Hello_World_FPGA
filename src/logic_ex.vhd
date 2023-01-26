-- Lab1
-- Introduction / Hello_World Lab
-- Author: Clayton Lawton
-- Date: January 27, 2022
-- ECE 524

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Initialize input and output ports.
entity logic_ex is
    Port ( SW : in STD_LOGIC_VECTOR (1 downto 0);
           LED : out STD_LOGIC_VECTOR (3 downto 0));
end logic_ex;

architecture Behavioral of logic_ex is

begin

	-- Assign each operation to it's desired bit.
    LED(0) <= NOT SW(0);
    LED(1) <= SW(1) AND SW(0);
    LED(2) <= SW(1) OR SW(0);
    LED(3) <= SW(1) XOR SW(0);

end Behavioral;