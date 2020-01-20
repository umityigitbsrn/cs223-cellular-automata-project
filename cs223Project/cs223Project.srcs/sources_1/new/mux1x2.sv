`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/25/2019 01:15:32 AM
// Design Name: 
// Module Name: mux1x2
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


module mux1x2(input [0:63] i1, i0,
        input s0,
        output reg [0:63] out
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
