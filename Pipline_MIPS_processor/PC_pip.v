`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/11/2020 10:24:20 AM
// Design Name: 
// Module Name: PC_pip
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


module PC_pip #(parameter WL=32, WL2=32)(
    input CLK,RST,EN,jump,
    output reg [WL-1:0] PC_out,
    input  [WL-1:0] a 
    );
    
    
    reg [WL-1:0] PC_reg [WL2-1:0];   



    integer i;
   initial begin
    for (i=0; i < 32 ; i =i+1)
    PC_reg[i] = i; 
    end
    

  
    always @(posedge CLK) begin

   if(RST)     // must wait full period
   PC_out = PC_reg[0];

      
   else if(!EN)   //since stall sig is high         
    PC_out = PC_reg[a];
  
    
  
   
    

    end
endmodule
