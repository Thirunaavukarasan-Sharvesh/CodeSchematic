`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04.02.2025 21:03:05
// Design Name: 
// Module Name: ALU_8bit
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


module ALU_8bit(
input [7:0]a,b,
input [3:0] opcode,
output reg [7:0] result,
output reg carry_flag,
output reg zero_flag,
output reg overflow_flag,
output reg negative_flag 
    );
    reg signed[8:0] temp;
   always @(*) begin
   carry_flag=0;
   zero_flag=0;
   overflow_flag=0;
   negative_flag=0;
      case (opcode)
        4'b0000: begin
            {carry_flag,result}=a+b;
            overflow_flag=((a[7]==b[7]) && (result[7]!=a[7]));
        end
        
        4'b0001 : begin
            {carry_flag,result}=a-b;
            overflow_flag=((a[7]!=b[7]) && (result[7]!=a[7]));
        end
        
        4'b0010 : begin
            temp=a*b;
            result=temp[7:0];
            overflow_flag=(temp[8]!=result[7]);
        end

        4'b0011 : begin
            if(b==0) begin
                zero_flag=1;
                result=0;
            end

            else if(a==-128 && b==-1) begin
                overflow_flag=1;
                result =8'd127;
            end

            else begin
                result=a/b;
            end
        end
        4'b0100: result=a<<1;
        
        4'b0101: result=a>>1;

        4'b0110: 
            result={a[6:0],a[7]}; // rotate left by 1

        4'b0111: 
            result={a[0],a[7:1]}; // rotate rigth by 1

        4'b1000: 
            result=a&b;
        
         4'b1001: 
            result=a|b;
             
        4'b1010: 
            result=a^b;
        
         4'b1011: 
            result=~(a|b);

         4'b1100: 
            result=~(a&b);

         4'b1101: 
            result=~(a^b);

         4'b1110: 
            result=(a>b)? 8'd1 : 8'd0;

         4'b1111: 
            result=(a==b)? 8'd1 : 8'd0 ;
        
         default : result=8'b00000000;
   endcase

   negative_flag=result[7];
   zero_flag= (result==8'b00000000)?1:0;
   end
endmodule
