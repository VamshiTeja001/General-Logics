`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/16/2024 11:55:58 AM
// Design Name: 
// Module Name: SIPO_Encoder
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


module SIPO_Encoder#(WIDTH=32)(
 output [WIDTH-1:0] Q,
 output DR, //Data Ready
input  clk,       // Clock input
    input reset,     // Reset input
    input serial_in, // Serial data input
    input TB
);

reg [WIDTH-1:0] Q_R =0;
reg DR_R;
reg [WIDTH:0] COUNTER=0;
assign Q= Q_R;
assign DR=DR_R;
always @(posedge clk or posedge reset) begin
    if (reset) begin
        Q_R <= 8'b0; // Reset the output to 0
    end else begin
    if(TB && COUNTER<WIDTH) begin 
        Q_R <= {Q_R[WIDTH-2:0], serial_in}; 
        COUNTER= COUNTER+1;
        DR_R=1'b0;
        end // Shift left and insert serial_in
    
    else if (TB && COUNTER>=WIDTH) begin COUNTER = 0; DR_R=1'b1;  end
    
    else DR_R=1'b1;
     
    
    end
end

endmodule