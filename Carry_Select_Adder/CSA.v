`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03.02.2025 20:04:11
// Design Name: 
// Module Name: CSA
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


module CSLA(
input [3:0]a,b,
input cin,
output [3:0]s,
output cout
);
wire [3:0]prop;
wire gen;
wire c0;
ripple_carry_4Bit r1(.a(a[3:0]),.b(b[3:0]),.cin(cin),.cout(c0),.sum(s[3:0]));
prop_gen prop1(.a(a[3:0]),.b(b[3:0]),.prop(prop[3:0]),.gen(gen));
mux1bit m1(.in1(cin),.in2(c0),.sel(gen),.out(cout));
endmodule
