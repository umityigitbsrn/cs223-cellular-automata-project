`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/25/2019 01:16:21 AM
// Design Name: 
// Module Name: mux4x264
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


module mux4x264(
        input [0:63] i3, i2, i1, i0,
        input s1, s0,
        output reg [0:63] out
        );
        
always@(s1, s0, i3, i2, i1, i0)
    begin
        if(s1==0 && s0==0)
            out<=i0;
        else if(s1==0 && s0==1)
            out<=i1;
        else if(s1==1 && s0==0)
            out<=i2;
        else if(s1==1 && s0==1)
            out <= i3;
        else
            out <= i3;
    end
endmodule
