`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03.03.2025 23:12:40
// Design Name: 
// Module Name: SR_FF
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


module SR_FF(
    input s,r,
    input clk,rst_n,
    output reg q,qbar
    );
always@(posedge clk or negedge rst_n) begin
    if(!rst_n) begin
        q<=1'b0;
        qbar<=1'b0;
    end
    else begin
        case ({s,r})
            2'b00:q<=q;
            2'b01:q<=0;
            2'b10:q<=1;
            2'b11:q<=1'bx;
        endcase
        qbar=~q;
    end
end
endmodule
