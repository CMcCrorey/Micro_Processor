`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/19/2020 07:05:03 AM
// Design Name: 
// Module Name: Mux
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


module Mux #(parameter WL=32)(
  
    input [WL-1:0] a,
    input [WL-1:0] b,
    input m_sel,
    output [WL-1:0] m_out
    );
    
assign m_out = m_sel ? b : a; 


endmodule
