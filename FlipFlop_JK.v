`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/19/2024 11:31:20 AM
// Design Name: 
// Module Name: JK_FlipFlop
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


module JK_FlipFlop(input clk, input j,input k,output q, output q_c);
    
    reg q_r= 1'b0;
    assign q = q_r;
    assign q_c = ~q_r;
    always @(posedge clk) begin
        case ({j, k})
            2'b00: q_r <= q_r;    // No change
            2'b01: q_r <= 0;    // Reset
            2'b10: q_r <= 1;    // Set
            2'b11: q_r <= ~q_r;   // Toggle
            default: q_r <= q_r;  // Default case
        endcase
    end
endmodule

