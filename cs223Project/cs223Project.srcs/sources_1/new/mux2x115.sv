`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/27/2019 11:17:19 PM
// Design Name: 
// Module Name: mux2x115
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


module mux2x115(input [15:0] i1, i0,
        input s0,
        output reg [15:0] out
        );
        
always@(s0, i1, i0)
    begin
        if(s0==0)
            out<=i0;
        else if(s0==1)
            out<=i1;
        else
            out <= i1;
    end
endmodule