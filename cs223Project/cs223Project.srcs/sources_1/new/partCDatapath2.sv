`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/27/2019 10:46:03 PM
// Design Name: 
// Module Name: partCDatapath2
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


module partCDatapath2(
        input logic plus,
        input logic reset,
        input logic restart,
        input logic count,
        output logic [15:0] score
    );
wire res;
or (res, reset, restart);
always@(posedge plus, posedge res)
begin
    if (res)
        score = 16'b0000000000000000;    
    else if (~count)
        score = score + 1'b1;
    else
        score = score;
end
endmodule
