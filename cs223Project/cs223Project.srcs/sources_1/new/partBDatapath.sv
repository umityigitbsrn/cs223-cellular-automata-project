`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/21/2019 10:02:53 PM
// Design Name: 
// Module Name: partBController
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


module partBDatapath(
        input logic clk,
        input logic reset,
        input logic[1:0] selectMode,
        input logic[3:0] in,
        input logic[1:0] select,
        input logic activeFirst,
        input logic activeSecond,
        input logic activeThird,
        input logic activeFourth,
        output logic[15:0] out,
        output logic [63:0] outAll
    );
    
    wire[15:0] out1, out2, out3, out4;
    partAMain a1(clk, reset, activeFirst, in, select, out1);
    partAMain a2(clk, reset, activeSecond, in, select, out2);
    partAMain a3(clk, reset, activeThird, in, select, out3);
    partAMain a4(clk, reset, activeFourth, in, select, out4);
    mux4x2 mux(out4, out3, out2, out1, selectMode[1], selectMode[0], out);
    sixtyFourRegister2 reg1(clk, reset, 1, out1, out2, out3, out4, outAll);
endmodule
