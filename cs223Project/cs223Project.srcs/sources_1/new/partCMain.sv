`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/25/2019 01:38:37 AM
// Design Name: 
// Module Name: partCMain
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


module partCMain(
        input logic clk,
        input logic reset,
        input logic en,
        input logic [0:63] in,
        input logic b1,
        input logic b2,
        input logic b3,
        input logic b4,
        input logic restart,
        output logic [0:63] convert,
//        output logic[7:0] rowsOut,
//        output logic shcp, stcp, mr, oe, ds,
        output logic [15:0] score,
        //output logic [15:0] led
        output logic endCount
    );
//logic [0:63] convert;
//wire [7:0][7:0] converted;        
//logic [0:63] in = 64'h0000000000000800;    
wire clear, load, one, two, three, four, resSel, count, plus;
wire [1:0] select;
partCController cont(clk, reset, en, b1, b2, b3, b4, restart, count, endCount, clear, load, one, two, three, four, select, resSel, plus);
partCDatapath data(clk, in, clear, load, one, two, three, four, select, resSel, count, endCount, convert);
partCDatapath2 data2(plus, reset, restart, endCount, score);
//doubleArrayConverter arrConv(convert, converted); //new
//converter conv(clk, converted, rowsOut, shcp, stcp, mr, oe, ds); //new
endmodule
