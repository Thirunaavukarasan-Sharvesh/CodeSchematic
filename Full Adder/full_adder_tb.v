`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06.01.2025 22:11:13
// Design Name: 
// Module Name: full_adder_tb
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module full_adder_tb;
reg a,b,c;
wire sum, carry;
full_adder uut(
    .a(a),
    .b(b),
    .c(c),
    .sum(sum),
    .cout(carry)
);
reg[2:0] i;
initial begin
    $monitor("Time=%0t | a=%b | b=%b | c=%b | sum=%b | carry=%b", $time, a, b, c, sum, carry);
    for (i=0;i<8;i=i+1) begin
        {a,b,c}=i;
        #10;
    end
    $finish;
end
initial begin
    $dumpfile("waveform_fulladder.vcd");
    $dumpvars(0,full_adder_tb);
end
endmodule
