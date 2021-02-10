`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/01/2020 07:27:44 AM
// Design Name: 
// Module Name: ALU
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

// Parameterable? still needs testing
module ALU #(parameter DWL =32)(
//    input CLK,    // still need to remove
    output reg  zero,
    input [3:0] ALU_sel,
    input signed  [DWL-1:0] Din1,
    input signed [DWL-1:0] Din2,
    output  reg  [DWL-1:0]  Dout //may need to be signed
    );
    
    always @* begin
  
    case(ALU_sel)
    4'b0000:  Dout = Din1 & Din2;
    4'b0001:  Dout = Din1 | Din2;
    4'b0010:  Dout = Din1 + Din2;
    
    4'b0011: begin Dout = Din2 - Din1;
    if (Dout==0)
    zero=1'b1;
    else zero= 1'b0;
    end
    
    4'b0100:  Dout = Din1 ^ Din2;
    4'b0101:  Dout = Din1 ~^ Din2;   
    4'b0110:  Dout = Din1 >>1;
    4'b0111:  Dout = Din1 <<1;
    4'b1000:  Dout =  Din1 >> Din2;   
    4'b1001:  Dout = Din1 << Din2;
    4'b1010:  Dout = Din1 >>> Din2; //sign variable arthmetic shift right
    endcase
    
    end
    
    
    
endmodule
