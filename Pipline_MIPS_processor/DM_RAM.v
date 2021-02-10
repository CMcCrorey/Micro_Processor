`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/01/2020 07:06:30 AM
// Design Name: 
// Module Name: DM_RAM
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

//stills needs testing
module DM_RAM #(parameter AWL=32, DWL =32)(
    input CLK,WR,
    input [AWL-1:0] addr ,
    input [DWL-1:0] Din,
    output [DWL-1:0] Dout
    );
    
//    reg [DWL-1:0] memory [2**(AWL-1)-1:0]; 
 reg [DWL-1:0] memory [AWL-1:0];    //32 by 32  could easily over flow since address allows up 2**31 locations

    
    initial begin 
//   $readmemb("C:/Users/Jackie/Documents/FPGA_Projects/Test_Pro_componets/test",memory);


  memory[15]= 17;
  memory[16]= 31;
  memory[17]= -5;
  memory[18]= -2;
  memory[19]= 250;
  
  
   end
   
   
    always @(posedge CLK) begin
    if (WR) begin
    memory [addr] <= Din;
    end
      
    end
    assign Dout = memory[addr];  // may need to add Read enable
    
endmodule
