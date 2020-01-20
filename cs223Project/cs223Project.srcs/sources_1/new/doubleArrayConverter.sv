`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/24/2019 04:26:32 PM
// Design Name: 
// Module Name: doubleArrayConverter
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


module doubleArrayConverter(
        input logic [0:63] in,
        output logic [7:0][7:0] out
    );
    
    always_comb
    begin
    for (int i = 0; i < 8; i++)
    begin
        for (int j = 0; j < 8; j++)
        begin
            out [i][j] = in[i*8 + j]; 
        end
    end
    end
endmodule
