`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/14/2020 04:22:43 PM
// Design Name: 
// Module Name: pipline
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


module pipline(
    input CLK,CLR,
    
    input  RFWE,
    input  RFDSel,
    input  ALU_In_sel,
    input  branch,
    input  DMWE,
    input  MtoRFsel,
    input  [1:0] ALUOp,
    input  jump,
    input  [3:0] ALU_sel,  
    
    output reg  RFWE_out,
    output reg  RFDSel_out,
    output reg  ALU_In_sel_out,
    output reg  branch_out,
    output reg  DMWE_out,
    output reg  MtoRFsel_out,
    output reg  [1:0] ALUOp_out,
    output reg  jump_out,
    output reg  [3:0] ALU_sel_out,
    
    input [31:0]  RFD1,RFD2 ,
    input [4:0]  RsD,RtD,RdD,
    input [31:0] SIMM ,
    
    output reg [31:0] RFD1_out,RFD2_out ,
    output reg [4:0]  RsD_out,RtD_out,RdD_out,
    output reg [31:0] SIMM_out 
     
    );
    
    always @(posedge CLK) begin
    RFWE_out = RFWE;       
    RFDSel_out = RFDSel;      
    ALU_In_sel_out = ALU_In_sel;  
    branch_out = branch;      
    DMWE_out = DMWE;        
    MtoRFsel_out = MtoRFsel;    
    ALUOp_out = ALUOp;
    ALU_sel_out= ALU_sel;
    jump_out = jump;
    
    RFD1_out =RFD1;
    RFD2_out=RFD2;
    RsD_out= RsD;
    RtD_out= RtD;
    RdD_out= RdD;
    SIMM_out= SIMM;
    end 
    
    
    
    always @(negedge CLK) begin
    RFWE_out = RFWE;       
    RFDSel_out = RFDSel;      
    ALU_In_sel_out = ALU_In_sel;  
    branch_out = branch;      
    DMWE_out = DMWE;        
    MtoRFsel_out = MtoRFsel;    
    ALUOp_out = ALUOp;
    ALU_sel_out= ALU_sel;
    jump_out = jump;
    
    
    RFD1_out =RFD1;
    RFD2_out=RFD2;
    RsD_out= RsD;
    RtD_out= RtD;
    RdD_out= RdD;
    SIMM_out= SIMM;
    end 
    
    
    
    endmodule  
    
    
    
    
    
    
    
    
    
    
        