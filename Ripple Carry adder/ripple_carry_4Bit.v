`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06.01.2025 22:46:19
// Design Name: 
// Module Name: ripple_carry_4Bit
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


module ripple_carry_4Bit(
    input[3:0]a,b, 
    input cin, 
    output cout,
    output [3:0]sum 
 );
    wire w1,w2,w3;
    full_adder f1(.a(a[0]),.b(b[0]),.c(cin),.sum(sum[0]),.cout(w1));
    full_adder f2(.a(a[1]),.b(b[1]),.c(w1),.sum(sum[1]),.cout(w2));
    full_adder f3(.a(a[2]),.b(b[2]),.c(w2),.sum(sum[2]),.cout(w3));
    full_adder f4(.a(a[3]),.b(b[3]),.c(w3),.sum(sum[3]),.cout(cout));

endmodule
