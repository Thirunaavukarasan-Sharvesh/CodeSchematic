`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03.03.2025 23:22:36
// Design Name: 
// Module Name: SR_FF_tb
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


module SR_FF_tb;

reg s,r;
reg rst,clk;
wire q,qbar;

SR_FF dut(s,r,clk,rst,q,qbar);

initial begin
    clk=1'b0;
    forever #10 clk = ~clk;end
initial begin
    rst=0;#10;
    rst=1;
end
initial begin
    $monitor("Time =%0t | clk = %0b | rst= %0b | s= %0b | r= %0b | q= %0b | qbar =%0b",$time,clk,rst,s,r,q,qbar);
    $dumpfile("SR_FF.vcd");
    $dumpvars(0,SR_FF_tb);
    
    s = 0; r = 0; #20;  //No change
    
    s = 0; r = 1; #20; // Reset State
    
    s = 1; r = 0; #20;  // Set State
    
    s = 1; r = 1; #20;  // Invalid State 
    
    s = 0; r = 0; #20; 
    
    s = 0; r = 1; #20; 
    
    s = 1; r = 0; #20;
    $finish;  
end
endmodule
