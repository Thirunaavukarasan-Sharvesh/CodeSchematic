`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02.03.2025 23:14:42
// Design Name: 
// Module Name: D_FF_tb
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


module D_FF_tb;
reg d;
reg clk;
reg rst;
wire q;
D_FF uut(
    .d(d),
    .clk(clk),
    .rst_n(rst),
    .q(q)
);
always #5 clk=~clk;
initial begin
    $dumpfile("D_FF.vcd");
    $dumpvars(0,D_FF_tb);
     
    $monitor("Time = %0t | clk = %b | rst = %b | d = %b | q = %b", $time, clk, rst, d, q);
    
    clk=0;
    rst=0;
    d=0;
    #10;
    
    rst=1;
    d=1;
    #10;
    
    d=0; #10;
    
    d=1; #10;
    
    d=0; #10;
    
    d=0; #10;
    
    d=1; #10;
    
    d=1; #10;
    
    $finish;
end
endmodule
