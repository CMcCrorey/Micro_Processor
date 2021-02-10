`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/22/2020 10:21:43 AM
// Design Name: 
// Module Name: PC
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

//added EN so may not work right with single cycle pro
module PC #(parameter WL=32, WL2=32)(
    input CLK,RST,EN,
    output reg [WL-1:0] PC_out,
    input  [WL-1:0] a 
    );
    
    
//    reg [WL-1:0] a_reg;
    reg [WL-1:0] PC_reg [WL2-1:0];   
//    reg [WL-1:0] a_reg = 5'b00000;


    integer i;
   initial begin
    for (i=0; i < 32 ; i =i+1)
    PC_reg[i] = i; 
    end
    

    
    
    
  
    always @(posedge CLK) begin

   if(RST)     // must wait full period
   PC_out = PC_reg[0];
   
   else if(EN)            //added EN
    PC_out = PC_reg[a];
  
   
    

    end
    

    
    
    
    
endmodule
