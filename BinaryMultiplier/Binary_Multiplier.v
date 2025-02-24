`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10.02.2025 21:52:31
// Design Name: 
// Module Name: Binary_Multiplier
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


module Binary_Multiplier(
input [3:0]a,b,
output [7:0]p
);

wire [3:0] pp0,pp1,pp2,pp3;  // Partial Product 
wire [7:0] s0,s1,s2;   // summation wires

assign pp0=(b[0])? a: 4'b0;
assign pp1= (b[1])? a:4'b0;
assign pp2= (b[2])? a:4'b0;
assign pp3= (b[3])? a:4'b0;

assign s0={pp1,1'b0} +{4'b0,pp0};
assign s1={pp2,2'b0}+ s0;
assign p={pp3,3'b0} + s1;

endmodule
