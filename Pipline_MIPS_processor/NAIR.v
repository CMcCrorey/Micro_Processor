`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/29/2020 12:46:15 PM
// Design Name: 
// Module Name: NAIR
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


module NAIR #(parameter WL =32) (
    input CLK,
    input [WL-1:0] a,
    output reg [WL-1:0] out
    );
  
//   reg [WL-1:0] a_reg;
     
    always @(posedge CLK) begin
   
     out <= a;
//    a_reg <= a;
//     out<= a_reg;
    
    end
endmodule
