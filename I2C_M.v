`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/20/2024 12:13:55 PM
// Design Name: 
// Module Name: I2C
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


module I2C_master (
    input  clk,
    input  reset,
    input  start,
    input  [7:0] data_in,
    output scl,
    inout  sda,
    output  done
);

    // State machine states

        localparam IDLE =10;
        localparam START=11;
        localparam ADDRESS=12;
        localparam WRITE=13;
        localparam STOP=14;
   

    reg[3:0] state =0;
    reg [3:0] next_state=0;
    reg [7:0] data;
    reg [3:0] bit_count;
    reg done_r=0, scl_r=0,sda_r=0;
    // State machine
    
    assign sda= sda_r;
    assign scl = scl_r;
    assign done = done_r;
    
    always @(posedge clk or posedge reset) begin
        if (reset) begin
            state <= IDLE;
            scl_r <= 1;
            done_r <= 0;
        end else begin
            state <= next_state;
        end
    end

    // Next state logic
    always @(*) begin
        case (state)
            IDLE: begin
                if (start) next_state = START;
                else next_state = IDLE;
            end
            START: begin
                next_state = ADDRESS;
            end
            ADDRESS: begin
                if (bit_count == 8) next_state = WRITE;
                else next_state = ADDRESS;
            end
            WRITE: begin
                if (bit_count == 8) next_state = STOP;
                else next_state = WRITE;
            end
            STOP: begin
                next_state = IDLE;
            end
            default: next_state = IDLE;
        endcase
    end

    // Output logic
    always @(posedge clk or posedge reset) begin
        if (reset) begin
            scl_r <= 1;
            done_r <= 0;
            bit_count <= 0;
        end else begin
            case (state)
                IDLE: begin
                    scl_r <= 1;
                    done_r <= 0;
                end
                START: begin
                    scl_r <= 0;
                    sda_r <= 0;
                end
                ADDRESS: begin
                    scl_r <= ~scl_r;
                    if (scl_r) begin
                        sda_r <= data_in[7 - bit_count];
                        bit_count <= bit_count + 1;
                    end
                end
                WRITE: begin
                    scl_r <= ~scl_r;
                    if (scl_r) begin
                        sda_r <= data[7 - bit_count];
                        bit_count <= bit_count + 1;
                    end
                end
                STOP: begin
                    scl_r <= 1;
                    sda_r <= 1;
                    done_r <= 1;
                end
            endcase
        end
    end

endmodule

