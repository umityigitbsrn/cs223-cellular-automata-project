`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/24/2019 03:32:57 PM
// Design Name: 
// Module Name: partCController
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


module partCController(
    input wire clk,
    input wire reset,
    input wire en,
    input wire b1,
    input wire b2,
    input wire b3,
    input wire b4,
    input wire restart,
    input wire count,
    input wire endCount,
    output reg clear,
    output reg load,
    output reg modeOne,
    output reg modeTwo,
    output reg modeThree,
    output reg modeFour,
    output reg [1:0] select,
    output reg selectRes,
    output reg plus
    );
wire bDeb1, bDeb2, bDeb3, bDeb4;
buttonDebouncerMain b1M(clk, b1, bDeb1);
buttonDebouncerMain b2M(clk, b2, bDeb2);
buttonDebouncerMain b3M(clk, b3, bDeb3);
buttonDebouncerMain b4M(clk, b4, bDeb4);
    
localparam [2:0]
    initState = 3'b000,
    loadState = 3'b001,
    convert = 3'b010,
    oneMode = 3'b011,
    twoMode = 3'b100,
    threeMode = 3'b101,
    fourMode = 3'b110,
    endMode = 3'b111;

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

always@(state_reg, b1, b2, b3, b4, en, restart, count, endCount)
begin
    state_next = state_reg;
    case(state_reg)
    initState:
    begin 
        selectRes = 1;
        load = 0;
        clear = 1;
        select = 2'b00;
        modeOne = 0;
        modeTwo = 0;
        modeThree = 0;
        modeFour = 0;
        state_next = loadState;
    end
    loadState:
    begin
        selectRes = 1;
        clear = 0;
        load = 1;
        modeOne = 0;
        modeTwo = 0;
        modeThree = 0;
        modeFour = 0;
        select = 2'b00;
        if (en)
            state_next = convert;
    end
    convert:
    begin
        plus = 0;
        selectRes = 0;
        clear = 0;
        load = 1;
        modeOne = 0;
        modeTwo = 0;
        modeThree = 0;
        modeFour = 0;
        select = 2'b00;        
        if (en && ~restart && ~endCount)
        begin
            if (bDeb1)
            begin
                plus = 1;
                state_next = oneMode;
            end
            else if(bDeb2)
            begin
                plus = 1;
                state_next = twoMode;
            end
            else if(bDeb3)
            begin
                plus = 1;
                state_next = threeMode;
            end
            else if(bDeb4)
            begin
                plus = 1;   
                state_next = fourMode;
            end
        end
        else if (endCount)
        begin
            state_next = endMode;
        end
        else if(restart)
            state_next = initState;    
    end
    oneMode:
    begin
        selectRes = 0;
        clear = 0;
        load = 1;
        modeOne = 1;
        modeTwo = 0;
        modeThree = 0;
        modeFour = 0;
        select = 2'b00;
        if (en && count)
        begin
            state_next = convert;
        end
    end
    twoMode:
    begin
        selectRes = 0;
        clear = 0;
        load = 1;
        modeOne = 0;
        modeTwo = 1;
        modeThree = 0;
        modeFour = 0;
        select = 2'b01;
        if (en && count)
        begin
            state_next = convert;
        end
    end
    threeMode:
    begin
        selectRes = 0;
        clear = 0;
        load = 1;
        modeOne = 0;
        modeTwo = 0;
        modeThree = 1;
        modeFour = 0;
        select = 2'b10;
        if (en && count)
        begin
            state_next = convert;
        end
    end
    fourMode:
    begin
        selectRes = 0;
        clear = 0;
        load = 1;
        modeOne = 0;
        modeTwo = 0;
        modeThree = 0;
        modeFour = 1;
        select = 2'b11;
        if (en && count)
        begin
            state_next = convert;
        end
    end
    endMode:
    begin
       if (restart)
            state_next = initState;    
    end
    endcase
end
    
endmodule
