`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/23/2019 09:28:59 PM
// Design Name: 
// Module Name: sixtyFourRegister
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


module sixtyFourRegister(
    input logic clk,
    input logic reset,
    input logic en,
    input logic[0:63] in,
    output logic[0:63] out
    );

always_ff@(posedge clk, posedge reset)
    if (reset) out <= 64'b0;
    else if (en)
    begin
        out <= in;
    end
endmodule
