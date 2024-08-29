`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/19/2024 12:09:48 PM
// Design Name: 
// Module Name: SR_Latch
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


module SR_Latch(input wire S,    // Set input
    input R,    // Reset input
    input En,   // Enable input
    output Q,   // Output
    output Qn   // Inverted output
);

wire S_gated, R_gated;

// Gating the S and R inputs with the enable signal
assign S_gated = S & En;
assign R_gated = R & En;

// SR latch logic
assign Q = ~(R_gated | Qn);
assign Qn = ~(S_gated | Q);

endmodule