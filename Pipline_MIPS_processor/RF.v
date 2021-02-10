`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/25/2020 06:46:33 AM
// Design Name: 
// Module Name: RF
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
    //32bit bus to count through memorys
 //   integer i;
    
//    assign Din = 0;
  
    
//    if(RST==1) begin
    
//    for (i =0; i < (2**AWL-1); i=i+1)
//    memory[i] <= 32'b0; 

module RF #(parameter AWL=5, DWL=32) (
    
    input [DWL-1:0] Din, 
    input  [AWL-1:0] addr1,addr2,addr_WR,
    output   [DWL-1:0]  Dout1, Dout2,
    input CLK, WR
    );
    integer i;
    reg [DWL-1:0]  memory[2**(AWL)-1:0];

// 16-23 S0-s7

 initial begin
 memory[0] = 0;  //$0 base address
 end

     reg [AWL-1:0]  adr1reg, adr2reg;
  always @(posedge CLK or negedge CLK) begin
   
    if (WR) begin
    memory[addr_WR] <= Din; 
    end
    end
    
    //might need to change this consider sync Read and write 
     assign Dout1 =  memory[addr1];
     assign Dout2 =  memory[addr2];
     
     
//         if (WR) begin
//    memory[addr_WR] <= Din;
    
////    adr1reg <= addr1;
////    adr2reg <= addr2;
//    end
//    else
     
//     assign Dout1 =  memory[addr1];
//     assign Dout2 =  memory[addr2];
     
// end
     
endmodule    




