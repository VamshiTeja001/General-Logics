`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/15/2024 02:04:02 PM
// Design Name: 
// Module Name: SISO_ShiftRegsiter
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


module SISO_ShiftRegsiter #(
WIDTH =32
    )
    
    (output Q,output TR, input data,input DIR,input clk,
    input rst);
    
    reg [WIDTH-1:0]Q_BUFF= 0;
    reg Q_R=0;
    assign  Q= Q_R;
    assign TR=TR_R;
    reg TX_R;reg TR_R;
    reg [WIDTH-1:0]COUNTER =0;
    
    always@(posedge clk)
    
    if (rst) Q_BUFF<=0;
    else begin  
    if(DIR) begin
        Q_BUFF = {Q_BUFF[WIDTH-2:0],data};
        TX_R <=1;
        
    end
    
    else if (!DIR) begin 
    
    Q_BUFF <= {data,Q_BUFF[WIDTH-1:1]};
    TX_R<=1;
  
    
    end
    
    
    if(TX_R)
    begin
    if(COUNTER<WIDTH) begin 
    Q_R = Q_BUFF[COUNTER]; 
    COUNTER=COUNTER+1; 
    TR_R=1;
    end
    
    
    else begin
    COUNTER=0;
    TX_R=0;
    TR_R<=0;
    end
    end
 
     end
     
   
     
endmodule
