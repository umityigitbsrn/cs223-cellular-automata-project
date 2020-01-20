`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/23/2019 09:48:16 PM
// Design Name: 
// Module Name: sixteenRegister
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


module sixteenRegister(
    input logic clk,
    input logic reset,
    input logic en,
    input logic[15:0] in,
    output logic[15:0] out
    );

always@(posedge clk, posedge reset)
    if (reset) out <= 16'b0;
    else if (en) out <= in;
endmodule
