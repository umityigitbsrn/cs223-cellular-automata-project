`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/21/2019 07:39:37 PM
// Design Name: 
// Module Name: decoder2x4
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


module decoder2x4(input i1,
            input i0,
            output reg z3,
            output reg z2,
            output reg z1,
            output reg z0);
always @(i1,i0)
begin 
    if(i1==0 && i0==0)
        begin
            z3<=0; z2<=0;
            z1<=0; z0<=1;
        end
        else if(i1==0 && i0==1)
        begin
            z3<=0; z2<=0;
            z1<=1; z0<=0;
        end
        else if(i1==1 && i0==0)
        begin
            z3<=0; z2<=1;
            z1<=0; z0<=0;
        end 
        else if(i1==1 && i0==1)
        begin
            z3<=1; z2<=0;
            z1<=0; z0<=0;
        end
end
endmodule
