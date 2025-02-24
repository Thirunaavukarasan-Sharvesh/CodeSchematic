`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10.02.2025 22:01:42
// Design Name: 
// Module Name: binary_multiplier_tb
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


module binary_multiplier_tb;
reg [3:0] a,b;
wire [7:0] p;

Binary_Multiplier uut
(
    .a(a),
    .b(b),
    .p(p)
);
integer i,j;
initial begin
    $dumpfile("Binary_multiplier.vcd");
    $dumpvars(0,binary_multiplier_tb);
    $monitor("A = %b, B = %b, P = %b", a, b, p);
    for(i=0;i<16;i=i+1) begin
        for(j=0;j<16;j=j+1) begin
            a=i;
            b=j;
            #5;
        end
    end
    $stop; 
end
endmodule
