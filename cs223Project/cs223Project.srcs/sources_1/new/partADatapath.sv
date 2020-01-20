`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/21/2019 07:36:46 PM
// Design Name: 
// Module Name: partADatapath
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


module partADatapath(
    input logic clk,
    input logic[3:0] in,
    input logic[1:0] select,
    input logic clear,
    input logic load,
    output logic[15:0] out
    );
    
    wire out3, out2, out1, out0;
    wire load0, load1, load2, load3; 
    decoder2x4 dec(select[1], select[0], out3, out2, out1, out0);
    and and0(load0, load, out0);
    and and1(load1, load, out1);
    and and2(load2, load, out2);
    and and3(load3, load, out3);
    
    fourRegister reg0(clk, clear, load0, in, out[3:0]);
    fourRegister reg1(clk, clear, load1, in, out[7:4]);
    fourRegister reg2(clk, clear, load2, in, out[11:8]);
    fourRegister reg3(clk, clear, load3, in, out[15:12]);
endmodule
