`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/26/2019 09:10:31 PM
// Design Name: 
// Module Name: sixtyFourRegister2
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


module sixtyFourRegister2(
    input logic clk,
    input logic reset,
    input logic en,
    input logic[15:0] in1,
    input logic[15:0] in2,
    input logic[15:0] in3,
    input logic[15:0] in4,
    output logic[63:0] out
    );
    
 always_ff@(posedge clk, posedge reset)
    if (reset) out <= 64'b0;
    else if (en)
    begin
        out[15:0] <= in1;
        out[31:16] <= in2;
        out[47:32] <= in3;
        out[63:48] <= in4;
    end
endmodule
