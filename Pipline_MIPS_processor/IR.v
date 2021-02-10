`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/07/2020 06:31:05 AM
// Design Name: 
// Module Name: IR
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


module IR #(parameter WL =32) (
    input CLK,EN,
    input [WL-1:0] a,
    output reg [WL-1:0] out
    );
  
//   reg [WL-1:0] a_reg;
     
    always @(posedge CLK) begin
   
     
   if(EN) begin
//    a_reg <= a;
     out<= a;
    end
    
//    else
//    assign out = a_reg;  //do I need assign?
    
    end
    
endmodule
