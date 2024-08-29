`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/14/2024 04:35:13 PM
// Design Name: 
// Module Name: RippleCounter
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


module RippleCounter#(parameter WIDTH=32)(
output  [(WIDTH-1):0] Q,
input clk,          // Clock input
input rst        // Asynchronous reset
    
    );


integer i;
reg [(WIDTH-1):0] Q_R=0;
assign Q=Q_R;
    // On every positive edge of the clock
    always @(posedge clk or posedge rst) begin
        if (rst) begin
            Q_R <= 0; // Reset the counter to 0
        end else begin
            Q_R[0] <= ~Q_R[0]; // Toggle the first flip-flop
            // Loop to toggle each subsequent flip-flop based on the previous one
            for (i = 1; i < 4; i = i + 1) begin
                if (&Q_R[i-1:0]) begin
                    Q_R[i] <= ~Q_R[i];
                end
            end
        end
    end

endmodule