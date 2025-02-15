`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 26.11.2024 21:58:06
// Design Name: 
// Module Name: dmux_bf_tb
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


module dmux_bf_tb();
reg [2:0]s;
reg a;
wire [7:0]y;
integer i,j;
demux_bf uut(
    .a(a),
    .s(s),
    .y(y)
);
initial begin
    $monitor("Time = %0t | a = %b | s = %b | y = %b", $time, a, s, y);
    // Ensure full coverage first
    for (i = 0; i < 8; i = i + 1) begin
        for (j = 0; j < 2; j = j + 1) begin
            s = i;
            a = j;
            #10;
        end
    end

    // Extra randomized testing
    // generates a signed 32-bit integer both +ve and -ve 
    repeat (10) begin
        // Bitwise AND ensure no negative values 
        a = $random & 1;  // LSB will only be 0 or 1  
        s = $random & 3'b111;  // Keeps only lower 3 bits (ensures 0-7)  
        #10;
    end

    $finish;
end
initial begin
    $dumpfile("waveform_dmux.vcd"); 
    $dumpvars(0, dmux_bf_tb);   
end
endmodule
