`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/08/2020 08:05:44 PM
// Design Name: 
// Module Name: Signed_mult
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


module Signed_mult #(parameter WL=15)(
    input signed [WL-1:0] a,
    input signed [WL-1:0] b,
    output signed [2*WL-1:0] prod
    );
    
    assign  prod = a*b;
endmodule
