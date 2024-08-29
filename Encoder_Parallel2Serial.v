`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/16/2024 12:28:55 PM
// Design Name: 
// Module Name: PISO_Encoder
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


module PISO_Encoder#(WIDTH=32)(
 output Q,
 input [WIDTH-1:0] parallel_Inp,
 output DT, //Data Transmit
 input  clk,       // Clock input
 input reset,     // Reset input
     // Serial data input
    input Trigger
);

reg [WIDTH-1:0] BUFFER =0;
reg Q_R;
reg DT_T;
reg process_done =0;
reg [WIDTH:0] COUNTER=0;

assign Q= Q_R;
assign DT=DT_T;
always @(posedge clk or posedge reset) begin
    if (reset) begin
        Q_R <= 8'b0; // Reset the output to 0
        BUFFER <= 0;
    end else begin
    BUFFER <=parallel_Inp;
    if(DT_T && COUNTER<WIDTH) begin 
        process_done <=1'b0;
        Q_R <= BUFFER[COUNTER]; 
        COUNTER<= COUNTER+1;
        
        end // Shift left and insert serial_in
        
    
    else if (DT_T && COUNTER>=WIDTH) begin COUNTER = 0; process_done=1'b1;  end
    
   
     
    
    end
end


always@(posedge clk or posedge Trigger)

if (Trigger) DT_T=1;

else if (process_done) DT_T=0;
endmodule

