`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/21/2019 10:02:53 PM
// Design Name: 
// Module Name: partBController
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


module partBController(
        input wire clk,
        input wire reset,
        input wire activeMode,
        input wire [1:0] select,
        output reg activeFirst,
        output reg activeSecond,
        output reg activeThird,
        output reg activeFourth,
        output reg clear
    );
    
localparam [2:0]
    initState = 3'b000,
    firstState = 3'b001,
    secondState = 3'b010,
    thirdState = 3'b011,
    fourthState = 3'b100;
    
reg[2:0] state_reg, state_next;

always@(posedge clk, posedge reset)
begin
    if(reset)
    begin
        state_reg <= initState;
    end
    else
        state_reg <= state_next;
end

always@(state_reg, activeMode, select)
begin
    state_next = state_reg;
    case(state_reg)
        initState:
        begin
            clear = 1;
            activeFirst = 0;
            activeSecond = 0;
            activeThird = 0;
            activeFourth = 0;
            if (activeMode)
                state_next = firstState;
        end
        firstState:
        begin
            clear = 0;
            activeSecond = 0;
            activeThird = 0;
            activeFourth = 0;
            if(activeMode)
            begin
                if(select == 2'b00)
                    state_next = firstState;
                else if(select == 2'b01)
                    state_next = secondState;
                else if(select == 2'b10)
                    state_next = thirdState;
                else if(select == 2'b11)
                    state_next = fourthState;
                
                activeFirst = 1;
            end
            else
                activeFirst = 0;
        end
        secondState:
        begin
            clear = 0;
            activeFirst = 0;
            activeThird = 0;
            activeFourth = 0;
            if(activeMode)
            begin
                if(select == 2'b00)
                    state_next = firstState;
                else if(select == 2'b01)
                    state_next = secondState;
                else if(select == 2'b10)
                    state_next = thirdState;
                else if(select == 2'b11)
                    state_next = fourthState;
                
                activeSecond = 1;
            end
            else
                activeSecond = 0;
        end
        thirdState:
        begin
            clear = 0;
            activeFirst = 0;
            activeSecond = 0;
            activeFourth = 0;
            if(activeMode)
            begin
                if(select == 2'b00)
                    state_next = firstState;
                else if(select == 2'b01)
                    state_next = secondState;
                else if(select == 2'b10)
                    state_next = thirdState;
                else if(select == 2'b11)
                    state_next = fourthState;
                
                activeThird = 1;
            end
            else
                activeThird = 0;
        end
        fourthState:
        begin
            clear = 0;
            activeSecond = 0;
            activeThird = 0;
            activeFirst = 0;
            if(activeMode)
            begin
                if(select == 2'b00)
                    state_next = firstState;
                else if(select == 2'b01)
                    state_next = secondState;
                else if(select == 2'b10)
                    state_next = thirdState;
                else if(select == 2'b11)
                    state_next = fourthState;
                
                activeFourth = 1;
            end
            else
                activeFourth = 0;
        end
    endcase
end
endmodule
