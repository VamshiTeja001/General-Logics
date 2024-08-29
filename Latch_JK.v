`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/19/2024 12:21:15 PM
// Design Name: 
// Module Name: JKLatch
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


module JKLatch(

   output Q,
    output Qn,
    input J,
    input K,
    input En
);

wire S, R;

assign S = En & J & ~K;
assign R = En & ~J & K;

nor (Qn, S, Q);
nor (Q, R, Qn);

endmodule
