`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/14/2024 11:21:30 AM
// Design Name: 
// Module Name: DRAM
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


module DRAM(
output [31:0]DATA_OUT,
input clk,
input REn,
input WEn,
input [31:0] ADDRESS, input [31:0] DATA_INPUT, input CAS, input RAS
    );
    integer i;
    localparam ADDRESS_WIDTH = 32 ;
    localparam MEMORY_LOCATIONS = 2**ADDRESS_WIDTH;
    
    reg [(ADDRESS_WIDTH-1):0] MEMORY [(MEMORY_LOCATIONS-1):0];
    reg [(ADDRESS_WIDTH-1):0] DATA_OUT_R;
    reg [(ADDRESS_WIDTH-1):0] UPDATE_COUNTER;
    assign DATA_OUT = DATA_OUT_R;
    
        initial begin  
            for(i=0;i<MEMORY_LOCATIONS;i=i+1)begin
                MEMORY[i]<=0;
            end
        end 
    
    always@(posedge clk) begin
    
    if (WEn & (!REn)) MEMORY [ADDRESS]<=DATA_INPUT;
    if (REn & (!WEn)) begin 
        DATA_OUT_R = MEMORY[ADDRESS];
        MEMORY[ADDRESS] = DATA_OUT_R;
        end
    
    if (!(WEn || REn) & (ADDRESS && UPDATE_COUNTER))  MEMORY[UPDATE_COUNTER] = MEMORY[UPDATE_COUNTER];    
    end
    
    
    always@(posedge clk) begin 
            if(UPDATE_COUNTER < MEMORY_LOCATIONS) UPDATE_COUNTER <= UPDATE_COUNTER + 1; 
    end
endmodule
