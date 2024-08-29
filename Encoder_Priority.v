`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/19/2024 12:30:01 PM
// Design Name: 
// Module Name: Priority_Encoder
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


module priority_encoder #(parameter N = 8, parameter M = $clog2(N)) (
    input wire [N-1:0] in,
    output reg [M-1:0] out,
    output reg valid
);

integer i;

always @(*) begin
    valid = 0;
    out = 0;
    for (i = N-1; i >= 0; i = i - 1) begin
        if (in[i]) begin
            out = i;
            valid = 1;
            break;
        end
    end
end

endmodule

