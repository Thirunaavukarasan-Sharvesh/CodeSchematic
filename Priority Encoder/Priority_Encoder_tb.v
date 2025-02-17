`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 17.02.2025 22:16:17
// Design Name: 
// Module Name: Encoder_tb
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


module Encoder_tb;
 reg [7:0]a;
 wire [2:0]y;
 wire invalid;
 reg [7:0]i;
 Encoder uut(
     .a(a),
     .o(y),
     .invalid(invalid)
 );
 initial begin
    $monitor("Time = %0t | a = %b | y = %b | invalid = %b", $time, a, y, invalid);
    for(i=0;i<256;i=i+1) begin
        a=i;
        #1;
    end
    
 end
 initial begin
    $dumpfile("waveform_encoder.vcd"); 
    $dumpvars(0,Encoder_tb);   
end
endmodule