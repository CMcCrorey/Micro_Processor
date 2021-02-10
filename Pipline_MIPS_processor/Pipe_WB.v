`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/17/2020 11:44:26 AM
// Design Name: 
// Module Name: Pipe_WB
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


module Pipe_WB(
input CLK,
input RFWEM ,MtoRFSelM,
output reg RFWEW ,MtoRFSelW,

input [31:0] mem_read,
output reg [31:0] DMoutW,

input [31:0]  ALU_outM,
output reg [31:0]  ALU_outW,

input [4:0] RtDM,
output reg [4:0] RtDW

    );
    
    always @(posedge CLK) begin
    
    RFWEW <= RFWEM;
    MtoRFSelW <= MtoRFSelM;
    DMoutW <= mem_read;
    ALU_outW <= ALU_outM;
    RtDW <= RtDM; 
    end
   
   
   
   
//    always @(negedge CLK) begin
    
//    RFWEW <= RFWEM;
//    MtoRFSelW <= MtoRFSelM;
//    DMoutW <= mem_read;
//    ALU_outW <= ALU_outM;
//    RtDW <= RtDM; 
//    end
   
   
    
    
    
    
    
endmodule
