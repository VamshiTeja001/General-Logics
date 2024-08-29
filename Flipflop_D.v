`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/19/2024 11:22:14 AM
// Design Name: 
// Module Name: D_FlipFlop
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


module D_FlipFlop (
    input D,
    input clk,
    input reset,
    output Q
);
reg Q_R=1'b0; //Initial value as zero
assign Q = Q_R;
assign Q_C = ~ Q_R;
    always @(posedge clk or posedge reset) begin
        if (reset)
            Q_R <= 0;
        else
            Q_R <= D;
    end
endmodule

