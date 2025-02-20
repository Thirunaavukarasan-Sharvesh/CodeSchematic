`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 29.01.2025 20:33:04
// Design Name: 
// Module Name: Carry_Look_added_tb
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

module Carry_Look_added_tb;
    reg [3:0] a, b;
    reg c;
    wire [3:0] sum;
    wire cout;
    integer i,j,k;
    // Instantiate the UUT (Unit Under Test)
    CLB uut(
        .a(a),
        .b(b),
        .cin(c),
        .sum(sum),
        .cout(cout)
    );
    

 initial begin
        $dumpfile("waveform.vcd"); 
        $dumpvars(0, Carry_Look_added_tb);
        for (i = 0; i < 16; i = i + 1) begin
            for (j = 0; j < 16; j = j + 1) begin
                for (k = 0; k < 2; k = k + 1) begin
                    a = i[3:0];
                    b = j[3:0];
                    c = k;
                    #1; // Small delay for stability before displaying output
                    $display("Time=%0t | a=%b | b=%b | cin=%b | sum=%b | cout=%b", $time, a, b, c, sum, cout);
                end
            end
        end

        $stop;              
     end
endmodule