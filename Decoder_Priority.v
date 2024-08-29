`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/19/2024 12:32:41 PM
// Design Name: 
// Module Name: Priority_Decoder
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


module Priority_Decoder#(parameter N = 8, parameter M = $clog2(N)) (
    input wire [M-1:0] in,
    output reg [N-1:0] out,
    output reg valid
);

integer i;

always @(*) begin
    valid = 0;
    out = 0;
    for (i = 0; i < N; i = i + 1) begin
        if (in == i) begin
            out[i] = 1;
            valid = 1;
            break;
        end
    end
end

endmodule