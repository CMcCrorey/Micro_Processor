`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/15/2020 08:36:15 AM
// Design Name: 
// Module Name: pipe_ID
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


module pipe_ID(

    input CLK,EN,CLR,jump,
    input [31:0] PCp1F,
    input [31:0] instruction,
    output reg [31:0] instrD,
    output reg [31:0] PCp1D
    
    );
    
    
    always @( posedge CLK) begin
    
    if (!EN) begin
    instrD <= instruction;
    PCp1D <= PCp1F;
    end
    
    if(CLR) begin     // needs work
    instrD <= 0;
    PCp1D <= PCp1F;
    end
    
    
    if( jump) begin     // needs work
    instrD <= 0;
    PCp1D <= PCp1F;
    end
    
    
    
    
    end
    
//    always @(negedge CLK) begin
//      if (!EN) begin
//    instrD <= instruction;
//    PCp1D <= PCp1F;
//    end
    
//    if(CLR) begin     // needs work
//    instrD <= 0;
//    PCp1D <= PCp1F;
//    end
    
//    end
    
    
    
    
    
endmodule
