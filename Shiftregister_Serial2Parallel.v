`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/15/2024 03:50:40 PM
// Design Name: 
// Module Name: SIPO_ShiftRegister
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


module SIPO_ShiftRegister #(
WIDTH =32
    )
    
    (output [WIDTH-1:0]Q, input data,input DIR,input clk,
    input rst);
    
    reg [WIDTH-1:0]Q_R= 0;
    
    assign  Q= Q_R;
    reg TX_R;
    reg [WIDTH-1:0]COUNTER =0;
    
    always@(posedge clk)
    
    if (rst) Q_R<=0;
    else begin  
    if(DIR) begin
        Q_R = {Q_R[WIDTH-2:0],data};
    end
    
    else if (!DIR) begin 
    Q_R <= {data,Q_R[WIDTH-1:1]};
    end
  
     end
  
endmodule
