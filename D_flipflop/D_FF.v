`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02.03.2025 23:10:19
// Design Name: 
// Module Name: D_FF
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


module D_FF(
    input d,
    input clk,
    input rst_n, // Active Low 
    output reg q
    );
always@(posedge clk or negedge rst_n) begin
    if(!rst_n)
        q<=1'b0;
    else
        q<=d;
end
endmodule
