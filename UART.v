`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/20/2024 11:50:03 AM
// Design Name: 
// Module Name: UART
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


module UART(
output  [7:0] data_out, // Received data
         
    output  tx_busy,     // Transmitter busy signal
    output  rx_ready, 
    input  tx_start, // Start transmission signal  
    input  clk,          // System clock
    input  reset,        // System reset
    input  rx,           // UART receive line
    output  tx,          // UART transmit line
    input  [7:0] data_in // Data to be transmitted
    
);

    // Parameters for baud rate generation
    localparam BAUD_RATE = 9600;
    localparam CLOCK_FREQ = 50000000; // 50 MHz clock
    localparam BAUD_DIV = CLOCK_FREQ / BAUD_RATE;

    // Internal signals
    reg [15:0] baud_counter;
    reg [3:0] bit_counter;
    reg [7:0] shift_reg;
    reg tx_reg, tx_busy_reg, rx_ready_reg;
    reg [7:0] data_out_r= 8'd0;
    // Baud rate generator
    
    assign data_out = data_out_r; 
    assign tx = tx_reg;
    assign tx_busy = tx_busy_reg;
    assign rx_ready = rx_ready_reg;

    always @(posedge clk or posedge reset) begin
        if (reset) begin
            baud_counter <= 0;
        end else if (baud_counter == BAUD_DIV - 1) begin
            baud_counter <= 0;
        end else begin
            baud_counter <= baud_counter + 1;
        end
    end

    // Transmitter logic
    always @(posedge clk or posedge reset) begin
        if (reset) begin
            tx_reg <= 1'b1;
            tx_busy_reg <= 1'b0;
            bit_counter <= 0;
            shift_reg <= 0;
        end else if (tx_start && !tx_busy_reg) begin
            tx_busy_reg <= 1'b1;
            shift_reg <= data_in;
            bit_counter <= 0;
        end else if (tx_busy_reg && baud_counter == 0) begin
            if (bit_counter == 10) begin
                tx_busy_reg <= 1'b0;
                tx_reg <= 1'b1;
            end else begin
                tx_reg <= shift_reg[0];
                shift_reg <= {1'b1, shift_reg[7:1]};
                bit_counter <= bit_counter + 1;
            end
        end
    end

    // Receiver logic
    always @(posedge clk or posedge reset) begin
        if (reset) begin
            rx_ready_reg <= 1'b0;
            data_out_r <= 0;
        end else if (rx_ready_reg) begin
            rx_ready_reg <= 1'b0;
        end else if (baud_counter == 0 && !rx) begin
            data_out_r <= {rx, data_out[7:1]};
            rx_ready_reg <= 1'b1;
        end
    end

    
endmodule
