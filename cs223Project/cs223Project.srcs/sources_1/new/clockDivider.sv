`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/29/2019 03:15:23 AM
// Design Name: 
// Module Name: clockDivider
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


module clockDivider(
    input logic clk, 
    output logic clkOut
    );
    
integer count = 0;
always_ff@(posedge clk)
begin
    count <= count + 1;
    if (count == 10000000)
    begin
        count <= 0;
        clkOut <= !clkOut;
    end
end
endmodule
