`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 17.02.2025 22:07:09
// Design Name: 
// Module Name: Encoder
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


module Encoder(     // we shall go with the priority encoder (lowest to highest)
    input [7:0]a,
    output reg [2:0]o,
    output reg invalid 
    );
always @(*)
begin
    invalid =1'b0;
    casez(a)   // casez will help to ignore the unknown(z) and the dont cares (x) 
        8'b???????1: o = 3'b000;  // Lowest priority checks from the LSB to MSB
        8'b??????10: o = 3'b001;
        8'b?????100: o = 3'b010;
        8'b????1000: o = 3'b011;
        8'b???10000: o = 3'b100;
        8'b??100000: o = 3'b101;
        8'b?1000000: o = 3'b110;
        8'b10000000: o = 3'b111; // Highest priority 
        default: begin
            o=3'b000;
            invalid=1'b1;
            $display("ERROR: Invalid input detected at time %0t. Input: %b", $time, a);
        end
    endcase
end
endmodule
