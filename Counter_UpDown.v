`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/14/2024 04:21:02 PM
// Design Name: 
// Module Name: UpDownCounter
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


module UpDownCounter #(parameter WIDTH = 32)(
output [WIDTH-1:0]Q,
input clk,
input rst,
input DIR_SEL
    );
    reg [WIDTH-1:0]Q_R;
    always@(posedge clk)
    
    begin
     if(rst) Q_R <= 0;
     else begin  
     
             if (DIR_SEL) Q_R<= Q_R+1;
             else Q_R <= Q_R-1;
     
     
     end
     
    end
endmodule
