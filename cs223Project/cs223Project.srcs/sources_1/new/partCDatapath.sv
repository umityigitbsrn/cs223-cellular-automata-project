`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/25/2019 01:08:05 AM
// Design Name: 
// Module Name: partCDatapath
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


module partCDatapath(
        input logic clk,
        input logic [0:63] in,
        input logic clear,
        input logic load,
        input logic modeOne,
        input logic modeTwo,
        input logic modeThree,
        input logic modeFour,
        input logic [1:0] select,
        input logic selectRes,
        output logic count,
        output logic endCount,
        output logic [0:63] out
    );
wire [0:63] one, two, three, four, registered, regin;
wire countOne, countTwo, countThree, countFour, orOut, orOut2;
mux1x2 mux3(in, out, selectRes, regin);    
sixtyFourRegister reg2(clk, clear, load, regin, registered);
oneMode mode1(modeOne, registered, one, countOne);
twoMode mode2(modeTwo, registered, two, countTwo);
threeMode mode3(modeThree, registered, three, countThree);
fourMode mode4(modeFour, registered, four, countFour);
or o1(orOut, countOne, countTwo);
or o2(orOut2, countThree, countFour);
or o3(count, orOut, orOut2);
mux4x264 mux2(four, three, two, one, select[1], select[0], out);
assign endCount = check(out, 64'b0);
//always@(posedge clk)
//begin
//    if (out == 64'b0)
//        endCount = 1;
//    else
//        endCount = 0;
//end

function logic check;
input [0:63] outTmp;
input [0:63] zero;

if (outTmp == zero)
    return 1;
else
    return 0;
endfunction
endmodule
