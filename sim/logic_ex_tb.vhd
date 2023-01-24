library ieee;
use ieee.std_logic_1164.all;


entity logic_ex_tb is
end logic_ex_tb;

architecture Behavioral of logic_ex_tb is

component logic_ex is
    Port ( SW : in STD_LOGIC_VECTOR (1 downto 0);
           LED : out STD_LOGIC_VECTOR (3 downto 0));
end component logic_ex;

    signal SW_tb : STD_LOGIC_VECTOR (1 downto 0)
    signal LED_tb : TD_LOGIC_VECTOR (3 downto 0);
	
begin

    UUT : logic_ex port map (SW_tb, LED_tb);
	
	--Stimulus
	process 
	begin
		$printtimescale(logic_ex_tb);
		SW_tb <= 00;
		for i in 0 to 10 loop
			report "Setting switches to" & integer'image(SW_tb(1:0));
			SW_tb <= i(1:0);
			wait for 100 ns;
		end loop;
		report "PASS: logic_ex test PASSED!";
    end process
	
	-- Checking
	process (SW_tb, LED) begin
	
		if (NOT SW_tb(0) !== LED(0)) then
			report"FAIL: NOT Gate mismatch";
		
	end
end Behavioral ;

    
    if (!SW[0] !== LED[0]) begin
      $display("FAIL: NOT Gate mismatch");
      $stop;
    end
    
    if (&SW[1:0] !== LED[1]) begin
      $display("FAIL: AND Gate mismatch");
      $stop;
    end

    if (|SW[1:0] !== LED[2]) begin
      $display("FAIL: OR Gate mismatch");
      $stop;
    end

    if (^SW[1:0] !== LED[3]) begin
      $display("FAIL: XOR Gate mismatch");
      $stop;
    end

  end
endmodule // logic_ex_tb_sysverilog