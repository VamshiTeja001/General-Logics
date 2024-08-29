`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/14/2024 03:36:56 PM
// Design Name: 
// Module Name: ModuloNCounter
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


module ModuloNCounter #(
parameter N=10,
parameter WIDTH =4
    ) 
    
    (
    output [WIDTH-1:0] Q,
    input clk,
    input rst
    );
    
    reg [WIDTH-1:0]Q_R=0;
    assign Q = Q_R;
    always@(posedge clk) begin
    if (rst) Q_R<=0;
    else begin
    if(Q_R < N-1) Q_R<=Q_R+1;
    else Q_R <=0;
    
    end
      
    end
    
endmodule
