`timescale 1ps / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04.02.2025 21:44:51
// Design Name: 
// Module Name: ALU_tb
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


module ALU_tb;
reg [7:0]a,b;
reg [3:0] op;
wire [7:0] result;
wire cf;
wire zf;
wire of;
wire nf;

ALU_8bit uut(
    .a(a),
    .b(b),
    .opcode(op),
    .result(result),
    .carry_flag(cf),
    .zero_flag(zf),
    .overflow_flag(of),
    .negative_flag(nf)
);
integer i,j,o;
initial begin
    $display("---------------------------------------------------");
        $display("  A      B      Opcode  Result  C  O  Z  N ");
        $display("---------------------------------------------------");
    for(o=0;o<16;o=o+1) begin
        op=o;
        for(i=0;i<128;i=i+1) begin
            a=i;
            for(j=0;j<128;j=j+1) begin
                b=j;
                #1;
                $display("%d   %d   %b   %d   %b  %b  %b  %b", 
                                a, b, op, result, 
                                cf, of, zf, nf);
            end
        end
    end
end
endmodule
