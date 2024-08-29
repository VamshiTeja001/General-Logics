`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/19/2024 11:28:21 AM
// Design Name: 
// Module Name: SR_FlipFlop
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


module srff(input clk, input s, input r,output q,output q_r);
   
   reg  q_r = 1'b0;
   assign q = q_r;
    assign q_c = ~ q_r;
    always @(posedge clk) begin
        case ({s, r})
            2'b00: q_r <= q_r;    // No change
            2'b01: q_r <= 0;    // Reset
            2'b10: q_r <= 1;    // Set
            2'b11: q_r <= 1'bx; // Invalid state
            default: q_r <= q_r;  // Default case
        endcase
    end
endmodule

