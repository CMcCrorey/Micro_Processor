`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/17/2020 11:43:56 AM
// Design Name: 
// Module Name: Pipe_Mem
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


module Pipe_Mem(

    input CLK,
    input  RFWEE,
    input  DMWEE,
    input  MtoRFselE,
    
    output reg  RFWEM,
    output reg  DMWEM,
    output reg  MtoRFselM,

    input [31:0] ALU_out,
    output reg [31:0] ALU_outM,
    
    input [31:0] DMinE,
    output reg [31:0] DMinM,
    
    input [4:0]  RtDE,
    output reg [4:0]  RtDM
    

    );
    
     always @(posedge CLK) begin
     
    RFWEM <= RFWEE;                
    DMWEM <= DMWEE;        
    MtoRFselM <= MtoRFselE;    
    ALU_outM <= ALU_out;
    DMinM <= DMinE;
    RtDM<= RtDE;
    end 
    
//     always @(negedge CLK) begin
    
//     RFWEM <= RFWEE;                
//    DMWEM <= DMWEE;        
//    MtoRFselM <= MtoRFselE;    
//    ALU_outM <= ALU_out;
//    DMinM <= DMinE;
//    RtDM<= RtDE;
    
    
//    end
    
    
    endmodule
    
    
    
    
    
    
    

