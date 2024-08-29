`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/20/2024 01:51:45 PM
// Design Name: 
// Module Name: I2C_S
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


module I2C_S (
    input  clk,
    input  reset,
    inout  sda,
    input  scl,
    output  [7:0] data_out,
    output data_ready
);

    // State machine states
 
        localparam  IDLE =10,
                    ADDRESS =11,
                    READ=12,
                    WRITE=13,
                    ACK=14;
    

    reg [4:0] state= IDLE; reg [4:0] next_state;
    reg [7:0] data;
    reg [3:0] bit_count;
    reg[7:0] data_out_r;
    reg data_ready_r;
    reg sda_r;

    // State machine
    
    assign data_out = data_out_r;
    assign data_ready= data_ready_r;
    assign sda = sda_r;
    
    always @(posedge clk or posedge reset) begin
        if (reset) begin
            state <= IDLE;
            data_ready_r <= 0;
        end else begin
            state <= next_state;
        end
    end

    // Next state logic
    always @(*) begin
        case (state)
            IDLE: begin
                if (scl && !sda) next_state = ADDRESS; // Start condition
                else next_state = IDLE;
            end
            ADDRESS: begin
                if (bit_count == 8) next_state = ACK;
                else next_state = ADDRESS;
            end
            READ: begin
                if (bit_count == 8) next_state = ACK;
                else next_state = READ;
            end
            WRITE: begin
                if (bit_count == 8) next_state = ACK;
                else next_state = WRITE;
            end
            ACK: begin
                next_state = IDLE;
            end
            default: next_state = IDLE;
        endcase
    end

    // Output logic
    always @(posedge clk or posedge reset) begin
        if (reset) begin
            data_ready_r <= 0;
            bit_count <= 0;
        end else begin
            case (state)
                IDLE: begin
                    data_ready_r <= 0;
                end
                ADDRESS: begin
                    if (scl) begin
                        data[7 - bit_count] <= sda;
                        bit_count <= bit_count + 1;
                    end
                end
                READ: begin
                    if (scl) begin
                        data[7 - bit_count] <= sda;
                        bit_count <= bit_count + 1;
                    end
                end
                WRITE: begin
                    if (scl) begin
                        sda_r <= data[7 - bit_count];
                        bit_count <= bit_count + 1;
                    end
                end
                ACK: begin
                    data_out_r <= data;
                    data_ready_r <= 1;
                end
            endcase
        end
    end

endmodule

