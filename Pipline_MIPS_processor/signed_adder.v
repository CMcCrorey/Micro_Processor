`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/08/2020 07:59:20 PM
// Design Name: 
// Module Name: signed_adder
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


module signed_adder #(parameter  WL =15)(
    input signed [WL-1:0] a,b,

    output signed [WL:0] SUM
    );
    
    assign  SUM = a+b;
    
endmodule
