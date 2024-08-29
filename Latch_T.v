`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/19/2024 12:19:23 PM
// Design Name: 
// Module Name: T_Latch
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


module T_Latch(
    output Q,
    output Qn,
    input T,
    input En
);

wire S, R;

assign S = En & T & ~Q;
assign R = En & T & Q;

nor (Qn, S, Q);
nor (Q, R, Qn);

endmodule