`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/21/2020 07:58:07 AM
// Design Name: 
// Module Name: equal
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


module equal(
    input en,
    input  [31:0] a,     //have to double check order with branch code a-b or b-c
    input  [31:0] b,
    output reg zero
    );
    
    reg [31:0] value,a_reg,b_reg;
    
    always@* begin
// a_reg <= a;
// b_reg <= b;
//    if(en) 
//    value <= b_reg -a_reg;
//    else
   value <= b-a;
   
   
     if (value ==0) 
    zero <= 1'b1;
    else
    zero <=1'b0; 
    
    
    end
endmodule
