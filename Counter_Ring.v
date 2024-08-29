`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/14/2024 03:08:41 PM
// Design Name: 
// Module Name: RingCounter
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


module RingCounter(
output [31:0]Q,
input clk,
input reset

    );
    
    localparam WIDTH =32;
    reg [WIDTH:0]Q_R = 32'd1;
    assign Q = Q_R;
    
    always@(posedge clk)
    if (reset) Q_R <= 32'd1;
    else Q_R<= {Q_R[(WIDTH-2):0],Q_R[(WIDTH-1)]};
    
endmodule
