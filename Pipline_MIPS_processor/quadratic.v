`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/08/2020 08:45:02 AM
// Design Name: 
// Module Name: quadratic
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

//problem with last adder
module quadratic #(parameter  WL=15) (
    input signed [WL-1:0] x,
    input CLK,
    output  signed  [WL:0] out //may be too small
    
    );
    
    reg  signed  [WL:0] out_store;
    
     wire signed [WL-1:0] A =-4;
     wire signed [WL-1:0] B = 3;
     wire signed [WL-1:0] C = -3;
 
    
   wire signed [2*WL-1:0] mw1,mw2,mw3;
   wire signed [2*WL-1:0] mw2; 
   wire signed [2*WL-1:0] aw;
   

 
 Signed_mult m1 (.a(x), .b(x),.prod(mw1));
 
 Signed_mult m2(.a(mw1), .b(A),.prod(mw2));
 
  signed_adder a2 (.a(mw2),.b(aw), .SUM(out));
  
  
  
  Signed_mult m3(.a(x), .b(B),.prod(mw3));
 
 
  signed_adder a1 (.a(mw3),.b(C), .SUM(aw));
  
  
 

 
 //awl
 

 
    always @(posedge CLK) begin
     out_store <= out;
    end
      
endmodule

