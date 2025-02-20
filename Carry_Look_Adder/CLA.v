`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 29.01.2025 20:05:02
// Design Name: 
// Module Name: Carry Look Adder
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

module CLA(
    input [3:0] a, b,
    input cin,
    output [3:0] sum,
    output cout
);

    wire [3:0] p;
    wire [3:0] g;
    wire [3:0] c;

    // Propagate and Generate signals
    assign p = a ^ b;  // P = A XOR B
    assign g = a & b;  // G = A AND B

    // Carry generation logic
    assign c[0] = g[0] | (p[0] & cin);
    assign c[1] = g[1] | (p[1] & g[0]) | (p[1] & p[0] & cin);
    assign c[2] = g[2] | (p[2] & g[1]) | (p[0] & p[1] & g[0]) | (p[2] & p[1] & p[0] & cin);
    assign c[3] = g[3] | (p[3] & g[2]) | (p[3] & p[2] & g[1]) | (p[3] & p[2] & p[1] & g[0]) | (p[3] & p[2] & p[1] & p[0] & cin);
    // Sum and final carry output
    assign sum = p ^ {c[2:0], cin};  // S = P XOR Carry
    assign cout = c[3];

endmodule



/*module CLA_6bit(
    input [5:0] a, b,
    input cin,
    output [5:0] sum,
    output cout
);

    wire [5:0] p, g, c;

    // **Step 1: Generate Propagate (P) and Generate (G) signals**
    genvar i;
    generate
        for (i = 0; i < 6; i = i + 1) begin
            assign p[i] = a[i] ^ b[i]; // Propagate: p[i] = a[i] ? b[i]
            assign g[i] = a[i] & b[i]; // Generate: g[i] = a[i] ? b[i]
        end
    endgenerate

    // **Step 2: Generate Carry (C) signals using Carry Lookahead Logic**
    assign c[0] = g[0] | (p[0] & cin);
    generate
        for (i = 1; i < 6; i = i + 1) begin
            assign c[i] = g[i] | (p[i] & c[i-1]);
        end
    endgenerate

    // **Step 3: Compute Sum bits**
    generate
        for (i = 0; i < 6; i = i + 1) begin
            assign sum[i] = p[i] ^ (i == 0 ? cin : c[i-1]);
        end
    endgenerate

    // **Step 4: Compute Final Carry Out**
    assign cout = c[5];

endmodule
*/