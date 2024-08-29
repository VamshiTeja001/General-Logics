`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/19/2024 11:21:27 AM
// Design Name: 
// Module Name: T_FlipFlop
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


module T_FlipFlop (
    input T,
    input clk,
    input reset,
    output Q,
    output Q_C
);
reg Q_R=1'b0; //Initial value as zero
assign Q = Q_R;
assign Q_C = ~ Q_R;
    always @(posedge clk or posedge reset) begin
        if (reset)
            Q_R <= 0;
        else if (T)
            Q_R <= ~Q_R;
    end
endmodule
