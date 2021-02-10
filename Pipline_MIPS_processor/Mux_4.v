`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/01/2020 04:03:54 PM
// Design Name: 
// Module Name: Mux_4
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


module Mux_4 #(parameter WL=32)(
    input [WL-1:0] a,
    input [WL-1:0] b,
    input [WL-1:0] c,
    input [WL-1:0] d,
    input [1:0] sel,
    output reg [WL-1:0] out
    );
    
    always @(sel) begin
    
   
    
    case(sel) 
    
    2'b00: assign out = a;
    2'b01: assign out = b;
    2'b10: assign out = c;
    2'b11: assign out = d;
    
    
    
    endcase
    
    
    
    end
    
    
    
    
endmodule
