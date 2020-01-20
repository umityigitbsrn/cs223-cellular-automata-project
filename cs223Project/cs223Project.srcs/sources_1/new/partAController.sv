`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/21/2019 07:14:28 PM
// Design Name: 
// Module Name: partAController
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


module partAController(
    input wire clk,
    input wire reset,
    input wire active,
    output reg clear,
    output reg load
    );
    
localparam [1:0]
    initState = 2'b00,
    waitState = 2'b01,
    loadState = 2'b10;

reg[1:0] state_reg, state_next;

always@(posedge clk, posedge reset)
begin
    if (reset)
            state_reg <= initState;
    else
            state_reg <= state_next;    
end

always@(state_reg, active)
begin
    state_next = state_reg;
    case(state_reg)
        initState:
        begin
            clear = 1;
            load = 0;
            state_next = waitState;
        end
        waitState:
        begin
            clear = 0;
            load = 0;
            if(active)
                state_next = loadState;
        end
        loadState:
        begin
            clear = 0;
            load = 1;
            if(~active)
                state_next = waitState;        
        end
    endcase
end
endmodule
