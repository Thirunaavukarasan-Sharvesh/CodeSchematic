`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06.01.2025 22:39:00
// Design Name: 
// Module Name: ripple_carry_4Bit_tb
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


module ripple_carry_4bit_tb;
reg [3:0]a;
reg [3:0]b;
reg cin;
wire [3:0]sum;
wire cout;
integer i,j,k;
ripple_carry_4Bit uut(
     .a(a),
     .b(b),
     .cin(cin),
     .sum(sum),
     .cout(cout)
     );

initial begin
        $monitor("Time= 0%t | a= %b | b= %b | cin= %b |sum = %b | cout = %b ",$time,a,b,cin,sum,cout);
         for (i = 0; i < 16; i = i + 1) begin
            for (j = 0; j < 16; j = j + 1) begin
                for (k = 0; k < 2; k = k + 1) begin
                    a = i;
                    b = j;
                    cin = k;
                    #1; 
                end
            end
        end

        $finish;  
    end
    initial begin
        $dumpfile("waveform_ripplecarry.vcd");
        $dumpvars(0,ripple_carry_4bit_tb);
    end
endmodule
