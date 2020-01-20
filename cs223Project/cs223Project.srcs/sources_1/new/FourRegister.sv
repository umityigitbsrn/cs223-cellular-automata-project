`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/21/2019 08:12:05 PM
// Design Name: 
// Module Name: fourRegister
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


module fourRegister(
    input logic clk,
    input logic reset,
    input logic en,
    input logic[3:0] in,
    output logic[3:0] out
    );

always_ff@(posedge clk, posedge reset)
    if (reset) out <= 4'b0;
    else if (en) out <= in;
endmodule
