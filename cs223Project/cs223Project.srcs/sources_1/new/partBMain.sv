`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/22/2019 03:04:51 AM
// Design Name: 
// Module Name: partBMain
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


module partBMain(
        input logic clk,
        input logic reset,
        input logic active,
        input logic [1:0] modeSelect,
        input logic [1:0] select,
        input logic [3:0] in,
        output logic [15:0] led,
        output logic [63:0] outAll
        );
    
wire out1, out2, out3, out4;
wire clear;
partBController cont(clk, reset, active, modeSelect, out1, out2, out3, out4, clear);
partBDatapath data(clk, reset, modeSelect, in, select, out1, out2, out3, out4, led, outAll);
endmodule
