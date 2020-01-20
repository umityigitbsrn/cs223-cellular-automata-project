`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/26/2019 08:16:04 PM
// Design Name: 
// Module Name: gameController
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


module gameController(
    input wire clk,
    input wire reset,
    input wire start,
    output reg modeB,
    output reg modeC,
    output reg resetB,
    output reg resetC,
    output reg load,
    output reg clear,
    output reg select
    );
    
localparam [1:0]
    initState =2'b00,
    partB = 2'b01,
    partC = 2'b10;
    
reg [1:0] state_reg, state_next;

always@(posedge clk, posedge reset)
begin
    if (reset)
        state_reg <= initState;
    else
        state_reg <= state_next;
end

always@(state_reg, start)
begin  
    state_next = state_reg;
    case(state_reg)
        initState:
        begin
            resetB = 1;
            resetC = 1;
            modeB = 0;
            modeC = 0;
            clear = 1;
            load = 0;
            select = 1;
            state_next = partB;    
        end
        partB:
        begin
            select = 1;
            resetB = 0;
            resetC = 0;
            modeB = 1;
            modeC = 0;
            clear = 1;
            load = 0;
            if (start)
                state_next = partC;
        end
        partC:
        begin
            clear = 0;
            load = 1;
            resetB = 0;
            resetC = 0;
            modeB = 0;
            modeC = 1;
            select = 0;
        end
    endcase
end
endmodule
