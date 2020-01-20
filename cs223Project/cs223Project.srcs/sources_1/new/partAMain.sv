`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/21/2019 08:28:24 PM
// Design Name: 
// Module Name: partAMain
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


module partAMain(
    input logic clk,
    input logic reset,
    input logic active,
    input logic[3:0] in,
    input logic[1:0] select,
    output wire [15:0] out
    );
    
    wire clear, load;
    partAController cont(clk, reset, active, clear, load);
    partADatapath data(clk, in, select, clear, load, out);
endmodule
