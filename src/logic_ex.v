`timescale 1ns / 1ps

module logic_ex(
    input [1:0] SW,
    output [3:0] LED
    );
    
wire not1, and1, or1, xor1;

not(not1,SW[0]);
and(and1,SW[1],SW[0]);
or(or1,SW[1],SW[0]);
xor(xor1,SW[1],SW[0]);

assign LED = {xor1, or1, and1, not1};
    
endmodule
