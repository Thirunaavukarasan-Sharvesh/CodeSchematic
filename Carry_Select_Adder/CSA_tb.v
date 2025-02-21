`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03.02.2025 21:07:13
// Design Name: 
// Module Name: CSA_tb
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


module tb_CSLA;

    reg [3:0] a, b;     
    reg cin;            
    wire [3:0] s;        
    wire cout;           

    CSLA uut (
        .a(a), 
        .b(b), 
        .cin(cin), 
        .s(s), 
        .cout(cout)
    );

    integer i, j, k;
    initial begin
        $dumpfile("CSLA_waveform.vcd");
        $dumpvars(0, tb_CSLA);

        $display("Testbench Start");
        $display("a   b   cin  |  sum  cout");

        for (i = 0; i < 16; i = i + 1) begin
            for (j = 0; j < 16; j = j + 1) begin
                for (k = 0; k < 2; k = k + 1) begin
                    a = i;      
                    b = j;     
                    cin = k;   
                    #1;        

                   
                    $display("%b   %b   %b   |   %b    %b", a, b, cin, s, cout);
                end
            end
        end
        
        $display("Testbench End");
        $finish;
            end

endmodule
