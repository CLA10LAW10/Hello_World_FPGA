-- Lab1
-- Introduction / Hello_World Lab
-- Author: Clayton Lawton
-- Date: January 27, 2022
-- ECE 524

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use std.env.stop;
use std.textio.all;

entity logic_ex_tb is
end logic_ex_tb;

architecture Behavioral of logic_ex_tb is

-- Instantiate the logic_ex module
component logic_ex is
    Port ( SW : in STD_LOGIC_VECTOR (1 downto 0);
           LED : out STD_LOGIC_VECTOR (3 downto 0));
end component logic_ex;

	-- Create a signal capable of holding it required bi width.
    signal SW_tb : STD_LOGIC_VECTOR (1 downto 0);
    signal LED_tb : STD_LOGIC_VECTOR (3 downto 0);
	
begin

	-- Call and associate the component to the file signals.
    UUT : logic_ex port map (SW_tb, LED_tb);
	
	--Stimulus
	-- stop commands used to quit after pass.
	process 
	begin
		-- For loop to iterate through 0-3 to allow for all possible combinations.
		for i in 0 to 3 loop
			-- Print text as well as integer to string conversion.
			report "Setting switches to " & to_bstring(std_logic_vector(to_unsigned(i, SW_tb'length)));
			-- Assign integer iteration to be the switch value.
			SW_tb <= std_logic_vector(to_unsigned(i, SW_tb'length));
			wait for 100 ns;
		end loop;
		report "PASS: logic_ex test PASSED!";
		stop;
    end process;
	
	-- Checking Gate Process
	-- stop commands used to quit after fail.
	process (LED_tb) begin
	
		-- Check the NOT gate.
		if (NOT SW_tb(0) /= LED_tb(0)) then
			report"FAIL: NOT Gate mismatch";
			stop;
		end if;
			
		-- Check the AND gate.
		if ((SW_tb(0) AND SW_tb(1)) /= LED_tb(1)) then
			report"FAIL: AND Gate mismatch";
			stop;
		end if;
			
		-- Check the OR gate.
		if ((SW_tb(0) OR SW_tb(1)) /= LED_tb(2)) then
			report"FAIL: OR Gate mismatch";
			stop;
		end if;
			
		-- Check the XOR gate.
		if ((SW_tb(0) XOR SW_tb(1)) /= LED_tb(3)) then
			report"FAIL: XOR Gate mismatch";
			stop;
		end if;
		
	end process;
end Behavioral ;