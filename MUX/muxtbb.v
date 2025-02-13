`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 22.11.2024 21:32:56
// Design Name: 
// Module Name: muxtbb
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


module muxtbb();
    reg [2:0] s;
    reg [7:0] a;
    wire y;
    
    mux uut(.a(a), .s(s), .y(y));
    
    initial begin
        repeat (10) begin 
            a = $random;   // Assign a new random value to 'a'
            s = $random % 8; // Randomly select a value between 0-7
            #10; 
        end
        
        $finish;
    end
    
    initial begin
        $monitor("Time = %0t | a = %b | s = %b | y = %b", $time, a, s, y);
    end
endmodule


