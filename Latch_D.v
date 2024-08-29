`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/19/2024 12:26:25 PM
// Design Name: 
// Module Name: DLatch
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


module DLatch(output Q,
    output Qn,
    input D,
    input En
);

wire S, R;

assign S = En & D;
assign R = En & ~D;

nor (Qn, S, Q);
nor (Q, R, Qn);

endmodule
