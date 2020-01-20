`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/24/2019 03:20:08 PM
// Design Name: 
// Module Name: twoMode
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


module twoMode(
               input logic en,
               input logic [0:63] in,
               output logic [0:63] out,
               output logic count);
reg [0:63] tmp;    
int arr[64] = {4,3,4,3,1,2,1,2,1,2,1,2,3,4,3,4,4,3,4,3,1,2,1,2,1,2,1,2,3,4,3,4,4,3,4,3,3,4,3,4,
                1,2,1,2,2,1,2,1,4,3,4,3,3,4,3,4,1,2,1,2,2,1,2,1};
                
int north = 0;
int south = 0;
int east = 0;
int west = 0;
int index = 0;
always_comb
begin
    if (en)
    begin
        tmp = in;
        for (int i = 0; i < 64; i++)
        begin
            if(arr[i] == 2)
            begin
                if(i - 8 < 0)
                begin
                    north = i - 8 + 64;
                end
                else
                begin
                    north = i - 8;
                end
                
                if (i + 8 > 63)
                begin
                    south = (i + 8) % 8;
                end
                else
                begin
                    south = i + 8;
                end
                
                if ((i + 1) % 8 == 0)
                begin
                    east = i - 7;
                end
                else
                begin
                    east = i + 1;
                end
                
                if ((i - 1) % 8 == 7)
                begin
                    west = i + 7;
                end
                else
                begin
                    west = i - 1;
                end
                
                if ((tmp[north] == 0 && tmp[south] == 0 && tmp[east] == 0 && tmp[west] == 0) ^
                    (tmp[north] == 0 && tmp[south] == 0 && tmp[east] == 0 && tmp[west] == 1) ^
                    (tmp[north] == 0 && tmp[south] == 1 && tmp[east] == 0 && tmp[west] == 1) ^
                    (tmp[north] == 0 && tmp[south] == 1 && tmp[east] == 1 && tmp[west] == 1) ^
                    (tmp[north] == 1 && tmp[south] == 0 && tmp[east] == 1 && tmp[west] == 0) ^
                    (tmp[north] == 1 && tmp[south] == 1 && tmp[east] == 0 && tmp[west] == 1) ^
                    (tmp[north] == 1 && tmp[south] == 1 && tmp[east] == 1 && tmp[west] == 1))
                begin
                    tmp[i] = 0;
                end    
                else
                begin
                    tmp[i] = 1;
                end
            end
        end
        
        out = tmp;
        count = 1;
    end
    else
    begin
        out = in;
        count = 0;
    end
end
endmodule
//always_comb
//begin
//    if (en)
//    begin
//        tmp = in;
//        for (int i = 0; i < 64; i++)
//        begin
//            if (arr[i] == 2)
//            begin
//                if (i % 8 == 0)
//                begin
//                    if (i == 0)
//                    begin
//                        if ((tmp[56] == 0 && tmp[7] == 0 && tmp[1] == 0 && tmp[8] == 0) ^
//                            (tmp[56] == 0 && tmp[7] == 1 && tmp[1] == 0 && tmp[8] == 0) ^
//                            (tmp[56] == 0 && tmp[7] == 1 && tmp[1] == 0 && tmp[8] == 1) ^
//                            (tmp[56] == 0 && tmp[7] == 1 && tmp[1] == 1 && tmp[8] == 1) ^
//                            (tmp[56] == 1 && tmp[7] == 0 && tmp[1] == 1 && tmp[8] == 0) ^
//                            (tmp[56] == 1 && tmp[7] == 1 && tmp[1] == 0 && tmp[8] == 1) ^
//                            (tmp[56] == 1 && tmp[7] == 1 && tmp[1] == 1 && tmp[8] == 1))
//                        begin
//                            tmp[0] = 0;
//                        end
//                        else
//                            tmp[0] = 1;       
//                    end
//                    else if (i == 56)
//                    begin
//                        if ((tmp[48] == 0 && tmp[63] == 0 && tmp[57] == 0 && tmp[0] == 0) ^
//                            (tmp[48] == 0 && tmp[63] == 1 && tmp[57] == 0 && tmp[0] == 0) ^
//                            (tmp[48] == 0 && tmp[63] == 1 && tmp[57] == 0 && tmp[0] == 1) ^
//                            (tmp[48] == 0 && tmp[63] == 1 && tmp[57] == 1 && tmp[0] == 1) ^
//                            (tmp[48] == 1 && tmp[63] == 0 && tmp[57] == 1 && tmp[0] == 0) ^
//                            (tmp[48] == 1 && tmp[63] == 1 && tmp[57] == 0 && tmp[0] == 1) ^
//                            (tmp[48] == 1 && tmp[63] == 1 && tmp[57] == 1 && tmp[0] == 1))
//                        begin
//                            tmp[56] = 0;
//                        end
//                        else
//                            tmp[56] = 1;
//                    end
//                    else
//                    begin
//                        if ((tmp[i-8] == 0 && tmp[i+7] == 0 && tmp[i+1] == 0 && tmp[i+8] == 0) ^
//                            (tmp[i-8] == 0 && tmp[i+7] == 1 && tmp[i+1] == 0 && tmp[i+8] == 0) ^
//                            (tmp[i-8] == 0 && tmp[i+7] == 1 && tmp[i+1] == 0 && tmp[i+8] == 1) ^
//                            (tmp[i-8] == 0 && tmp[i+7] == 1 && tmp[i+1] == 1 && tmp[i+8] == 1) ^
//                            (tmp[i-8] == 1 && tmp[i+7] == 0 && tmp[i+1] == 1 && tmp[i+8] == 0) ^
//                            (tmp[i-8] == 1 && tmp[i+7] == 1 && tmp[i+1] == 0 && tmp[i+8] == 1) ^
//                            (tmp[i-8] == 1 && tmp[i+7] == 1 && tmp[i+1] == 1 && tmp[i+8] == 1))
//                        begin
//                            tmp[i] = 0;
//                        end
//                        else
//                            tmp[i] = 0;
//                    end   
//                end
//                else if ((i - 7) % 8 == 0)
//                begin
//                    if (i == 7)
//                    begin
//                        if ((tmp[63] == 0 && tmp[6] == 0 && tmp[0] == 0 && tmp[15] == 0) ^
//                            (tmp[63] == 0 && tmp[6] == 1 && tmp[0] == 0 && tmp[15] == 0) ^
//                            (tmp[63] == 0 && tmp[6] == 1 && tmp[0] == 0 && tmp[15] == 1) ^
//                            (tmp[63] == 0 && tmp[6] == 1 && tmp[0] == 1 && tmp[15] == 1) ^
//                            (tmp[63] == 1 && tmp[6] == 0 && tmp[0] == 1 && tmp[15] == 0) ^
//                            (tmp[63] == 1 && tmp[6] == 1 && tmp[0] == 0 && tmp[15] == 1) ^
//                            (tmp[63] == 1 && tmp[6] == 1 && tmp[0] == 1 && tmp[15] == 1))
//                        begin
//                            tmp[0] = 0;
//                        end
//                        else
//                            tmp[0] = 1;    
//                    end
//                    else if (i == 63)
//                    begin
//                        if ((tmp[55] == 0 && tmp[62] == 0 && tmp[56] == 0 && tmp[7] == 0) ^
//                            (tmp[55] == 0 && tmp[62] == 1 && tmp[56] == 0 && tmp[7] == 0) ^
//                            (tmp[55] == 0 && tmp[62] == 1 && tmp[56] == 0 && tmp[7] == 1) ^
//                            (tmp[55] == 0 && tmp[62] == 1 && tmp[56] == 1 && tmp[7] == 1) ^
//                            (tmp[55] == 1 && tmp[62] == 0 && tmp[56] == 1 && tmp[7] == 0) ^
//                            (tmp[55] == 1 && tmp[62] == 1 && tmp[56] == 0 && tmp[7] == 1) ^
//                            (tmp[55] == 1 && tmp[62] == 1 && tmp[56] == 1 && tmp[7] == 1))
//                        begin
//                            tmp[0] = 0;
//                        end
//                        else
//                            tmp[0] = 1;
//                    end
//                    else
//                    begin
//                        if ((tmp[i-8] == 0 && tmp[i-1] == 0 && tmp[i-7] == 0 && tmp[i+8] == 0) ^
//                            (tmp[i-8] == 0 && tmp[i-1] == 1 && tmp[i-7] == 0 && tmp[i+8] == 0) ^
//                            (tmp[i-8] == 0 && tmp[i-1] == 1 && tmp[i-7] == 0 && tmp[i+8] == 1) ^
//                            (tmp[i-8] == 0 && tmp[i-1] == 1 && tmp[i-7] == 1 && tmp[i+8] == 1) ^
//                            (tmp[i-8] == 1 && tmp[i-1] == 0 && tmp[i-7] == 1 && tmp[i+8] == 0) ^
//                            (tmp[i-8] == 1 && tmp[i-1] == 1 && tmp[i-7] == 0 && tmp[i+8] == 1) ^
//                            (tmp[i-8] == 1 && tmp[i-1] == 1 && tmp[i-7] == 1 && tmp[i+8] == 1))
//                        begin
//                            tmp[i] = 0;
//                        end
//                        else
//                            tmp[i] = 1;
//                    end
//                end
//                else
//                begin
//                    if (0 < i && i < 7)
//                    begin
//                        if ((tmp[56 + i] == 0 && tmp[i-1] == 0 && tmp[i+1] == 0 && tmp[i+8] == 0) ^
//                            (tmp[56 + i] == 0 && tmp[i-1] == 1 && tmp[i+1] == 0 && tmp[i+8] == 0) ^
//                            (tmp[56 + i] == 0 && tmp[i-1] == 1 && tmp[i+1] == 0 && tmp[i+8] == 1) ^
//                            (tmp[56 + i] == 0 && tmp[i-1] == 1 && tmp[i+1] == 1 && tmp[i+8] == 1) ^
//                            (tmp[56 + i] == 1 && tmp[i-1] == 0 && tmp[i+1] == 1 && tmp[i+8] == 0) ^
//                            (tmp[56 + i] == 1 && tmp[i-1] == 1 && tmp[i+1] == 0 && tmp[i+8] == 1) ^
//                            (tmp[56 + i] == 1 && tmp[i-1] == 1 && tmp[i+1] == 1 && tmp[i+8] == 1))
//                        begin
//                            tmp[i] = 0;
//                        end
//                        else
//                            tmp[i] = 1;
//                    end
//                    else if (56 < i && i < 63)
//                    begin
//                        if ((tmp[i - 8] == 0 && tmp[i-1] == 0 && tmp[i+1] == 0 && tmp[i-56] == 0) ^
//                            (tmp[i - 8] == 0 && tmp[i-1] == 1 && tmp[i+1] == 0 && tmp[i-56] == 0) ^
//                            (tmp[i - 8] == 0 && tmp[i-1] == 1 && tmp[i+1] == 0 && tmp[i-56] == 1) ^
//                            (tmp[i - 8] == 0 && tmp[i-1] == 1 && tmp[i+1] == 1 && tmp[i-56] == 1) ^
//                            (tmp[i - 8] == 1 && tmp[i-1] == 0 && tmp[i+1] == 1 && tmp[i-56] == 0) ^
//                            (tmp[i - 8] == 1 && tmp[i-1] == 1 && tmp[i+1] == 0 && tmp[i-56] == 1) ^
//                            (tmp[i - 8] == 1 && tmp[i-1] == 1 && tmp[i+1] == 1 && tmp[i-56] == 1))
//                        begin
//                            tmp[i] = 0;
//                        end
//                        else
//                            tmp[i] = 1;
//                    end
//                    else
//                    begin
//                        if ((tmp[i - 8] == 0 && tmp[i-1] == 0 && tmp[i+1] == 0 && tmp[i+8] == 0) ^
//                            (tmp[i - 8] == 0 && tmp[i-1] == 1 && tmp[i+1] == 0 && tmp[i+8] == 0) ^
//                            (tmp[i - 8] == 0 && tmp[i-1] == 1 && tmp[i+1] == 0 && tmp[i+8] == 1) ^
//                            (tmp[i - 8] == 0 && tmp[i-1] == 1 && tmp[i+1] == 1 && tmp[i+8] == 1) ^
//                            (tmp[i - 8] == 1 && tmp[i-1] == 0 && tmp[i+1] == 1 && tmp[i+8] == 0) ^
//                            (tmp[i - 8] == 1 && tmp[i-1] == 1 && tmp[i+1] == 0 && tmp[i+8] == 1) ^
//                            (tmp[i - 8] == 1 && tmp[i-1] == 1 && tmp[i+1] == 1 && tmp[i+8] == 1))
//                        begin
//                            tmp[i] = 0;
//                        end
//                        else
//                            tmp[i] = 1;
//                    end
//            end
//      end
//      end
//            out = tmp;
//            count = 1;
//      end
//    else
//    begin
//        out = in;
//        count = 0;
//    end
//end
