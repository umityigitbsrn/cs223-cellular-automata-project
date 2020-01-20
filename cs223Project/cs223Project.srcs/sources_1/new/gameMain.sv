`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/26/2019 08:54:39 PM
// Design Name: 
// Module Name: gameMain
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


module gameMain(
        input logic clk,
        input logic reset,
        input logic start,
        input logic [1:0] modeSelect,
        input logic [1:0] select,
        input logic [3:0] in,
        input logic b1,
        input logic b2,
        input logic b3,
        input logic b4,
        input logic restart,
        output logic[7:0] rowsOut,
        output logic shcp, stcp, mr, oe, ds,
        output logic [15:0] led,
        output [6:0]seg, logic dp,
        output [3:0] an
    );
    
wire [0:63] convert;
wire [15:0] score, out;
wire load, clear, select1, clkDiv;
wire modeB, modeC, resetB, resetC;
gameController cont(clk, reset, start, modeB, modeC, resetB, resetC, load, clear, select1);
gameData data(clk, modeSelect, select, in, b1, b2, b3, b4, restart, modeB, modeC, resetB, resetC, load, clear, led, convert, score, clkDiv);
wire [7:0][7:0] converted;    
doubleArrayConverter arrConv(convert, converted);
converter conv(clk, converted, rowsOut, shcp, stcp, mr, oe, ds);
mux2x115 mux(led, score, select1, out);
SevSeg_4digit sevseg(clkDiv, clk, out[3:0], out[7:4], out[11:8], out[15:12], seg, dp, an);
endmodule
