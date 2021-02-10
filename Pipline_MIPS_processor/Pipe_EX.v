`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/17/2020 11:42:39 AM
// Design Name: 
// Module Name: Pipe_EX
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


module Pipe_EX( 

    input CLK,CLR,
    input  RFWE,
    input  RFDSel,
    input  DMWE,
    input  MtoRFsel,
    input  [3:0] ALU_Op_sel,
    input   ALU_sel,  
    
    output reg  RFWEE,
    output reg  RFDSelE,
    output reg  DMWEE,
    output reg  MtoRFsel_E,
    output reg  [3:0] ALUOp_E,
    output reg   ALU_sel_E,
    
    input [4:0]  RsD,RtD,RdD,
    output reg [4:0]  RsE,RtE,RdE,
    
    input [31:0] SIMM ,
    output reg [31:0] SIMM_out, 
    
    input [31:0]  RFD1,RFD2 ,
    output reg [31:0] RFD1_out,RFD2_out 
     
    );
    
    always @(posedge CLK) begin
    
    if(CLR) begin
     RFWEE <= 1'b0;       
    RFDSelE <= 1'bx;            
    DMWEE <= 1'b0;        
    MtoRFsel_E <= 1'bx;    
    ALUOp_E <= 1'bx;
    ALU_sel_E <= 1'bx;
 
    RFD1_out <=1'bx;
    RFD2_out<=1'bx;
    RsE<= 1'bx;
    RtE<= 1'bx;
    RdE<= 1'bx;
    SIMM_out<= 1'bx;        //maybe 0s
    
    
    end
    
    else begin
     
    RFWEE <= RFWE;       
    RFDSelE <= RFDSel;            
    DMWEE <= DMWE;        
    MtoRFsel_E <= MtoRFsel;    
    ALUOp_E <= ALU_Op_sel;
    ALU_sel_E <= ALU_sel;
 
    RFD1_out <=RFD1;
    RFD2_out<=RFD2;
    RsE<= RsD;
    RtE<= RtD;
    RdE<= RdD;
    SIMM_out<= SIMM;
    
    
    end
    
    
    
    end 
    
    
    
    
//    always@(negedge CLK) begin
    
//    RFWEE <= RFWE;       
//    RFDSelE <= RFDSel;            
//    DMWEE <= DMWE;        
//    MtoRFsel_E <= MtoRFsel;    
//    ALUOp_E <= ALU_Op_sel;
//    ALU_sel_E <= ALU_sel;
 
//    RFD1_out <=RFD1;
//    RFD2_out<=RFD2;
//    RsE<= RsD;
//    RtE<= RtD;
//    RdE<= RdD;
//    SIMM_out<= SIMM;
    
    
    
//    end
    
    
    
    
    endmodule
