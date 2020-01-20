`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/26/2019 08:34:19 PM
// Design Name: 
// Module Name: gameData
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


module gameData(
        input logic clk,
        input logic [1:0] modeSelect,
        input logic [1:0] select,
        input logic [3:0] in,
        input logic b1,
        input logic b2,
        input logic b3,
        input logic b4,
        input logic restart,
        input logic modeB,
        input logic modeC,
        input logic resetB,
        input logic resetC,
        input logic load, 
        input logic clear,
        output logic [15:0] led,
        output logic [0:63] convert,
        output logic [15:0] score,
        output logic clkDiv //new
    );
    
wire [63:0] outAll, inAll;
partBMain partB(clk, resetB, modeB, modeSelect, select, in, led, inAll);
//sixtyFourRegister(clk, clear, load, inAll, outAll);
partCMain partC(clk, resetC, modeC, inAll, b1, b2, b3, b4, restart, convert, score, clkDiv);
endmodule
