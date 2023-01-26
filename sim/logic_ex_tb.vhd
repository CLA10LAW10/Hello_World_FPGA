library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use std.env.stop;
use std.textio.all;
--use ieee.std_logic_unsigned.all;
--use IEEE.std_logic_signed.all;

entity logic_ex_tb is
end logic_ex_tb;

architecture Behavioral of logic_ex_tb is

component logic_ex is
    Port ( SW : in STD_LOGIC_VECTOR (1 downto 0);
           LED : out STD_LOGIC_VECTOR (3 downto 0));
end component logic_ex;

    signal SW_tb : STD_LOGIC_VECTOR (1 downto 0);
    signal LED_tb : STD_LOGIC_VECTOR (3 downto 0);
	
begin

    UUT : logic_ex port map (SW_tb, LED_tb);
	
	--Stimulus
	process 
	begin
		--$printtimescale(logic_ex_tb);
		--SW_tb <= "00";
		for i in 0 to 3 loop
			report "Setting switches to " & to_bstring(std_logic_vector(to_unsigned(i, SW_tb'length)));
			SW_tb <= std_logic_vector(to_unsigned(i, SW_tb'length));
			wait for 100 ns;
		end loop;
		report "PASS: logic_ex test PASSED!";
		stop;
    end process;
	
	-- Checking
	process (LED_tb) begin
	
		if (NOT SW_tb(0) /= LED_tb(0)) then
			report"FAIL: NOT Gate mismatch";
			stop;
		end if;
			
		if ((SW_tb(0) AND SW_tb(1)) /= LED_tb(1)) then
			report"FAIL: AND Gate mismatch";
			stop;
		end if;
			
		if ((SW_tb(0) OR SW_tb(1)) /= LED_tb(2)) then
			report"FAIL: OR Gate mismatch";
			stop;
		end if;
			
		if ((SW_tb(0) XOR SW_tb(1)) /= LED_tb(3)) then
			report"FAIL: XOR Gate mismatch";
			stop;
		end if;
		
	end process;
end Behavioral ;