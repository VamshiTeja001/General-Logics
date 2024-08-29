`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/16/2024 01:47:59 PM
// Design Name: 
// Module Name: XY2X_Encoder
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


module XY2X_Encoder #(IN_WIDTH=8, OP_WIDTH=3) (
     output  [OP_WIDTH-1:0] Q,
     input  [IN_WIDTH-1:0] inputCODE,
     input rst,
     input en
     
    );
    
      genvar i, j;
      
      for (i=0; i <OP_WIDTH; i=i+1) begin
        
        for(j=1; j< IN_WIDTH; j=j+j) begin
        
         assign Q[i] = Q[i] && inputCODE[j];

        end 
        
        
      
      
      end
      
      
      
      
      
    
endmodule
