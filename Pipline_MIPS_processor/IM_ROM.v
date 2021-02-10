`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/01/2020 07:53:54 AM
// Design Name: 
// Module Name: IM_ROM
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

//still needs testing
 module IM_ROM #(parameter DWL=32, AWL=32)(
//input CLK,EN,
input [AWL-1:0] addr,   
output reg [DWL-1:0] instruct

    );
    
//    reg [DWL-1:0] memory [2**(AWL)-1:0];

   reg [DWL-1:0] memory [AWL-1:0];  //limited space
   
    initial begin
    $readmemb("C:/Users/Jackie/Documents/FPGA_Projects/Test_Pro_componets/Test_Pro_componets.srcs/sources_1/imports/Test_Pro_componets/test",memory);

//memory[0] = 32'b001000_00000_10000_00000_00000_000000;  
//memory[1] = 32'b001000_00000_10001_00000_00000_000101;
//memory[2] = 32'b000000_10000_10001_01011_00000_100000;
//memory[4] = 32'b100011_10000_01000_00000_00000_001111;
//memory[5] = 32'b000000_01000_01011_01001_00000_100000;
//memory[6]=  32'b101011_10000_01011_00000_00000_011001;
//memory[7] = 32'b000000_10000_10001_01000_00000_100000; 

//000100_10000_10001_00000_00000_000011

//000010_00000_00000_00000_00000_000011 

//000000_00000_00000_00000_00000_000000


    end
    
    always @(addr) begin
//    if (EN)
    instruct <= memory[addr];

    end
    
//    case (addr)  
//    4'b0000: intruct <= 4'b0000;
//    4'b0000: intruct <= 4'b0000;
//    endcase
    
    
    
endmodule
