`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/14/2020 04:20:03 PM
// Design Name: 
// Module Name: CU_pipe
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


module CU_pipe(

 input [5:0] Op,
    input [5:0] func,
    output reg RFWE,
    output reg RFDSel,
    output reg ALU_In_sel,
    output reg branch,
    output reg DMWE,
    output reg MtoRFsel,
     
    output reg jump =1'b0,
    
    output reg [3:0] ALU_Op_sel     
    );
    
    
    reg [1:0] ALUOp;
    always @(Op) begin
    
    case(Op) 
    6'b000000: begin RFWE <=1'b1;
                     RFDSel <=1'b1; 
                     ALU_In_sel <=0;
                     branch <= 0;
                     DMWE <= 0;
                     MtoRFsel <= 0;
                     ALUOp <=2'b10;
                     jump <= 1'b0;
                     
               end
               
      6'b100011: begin RFWE <=1;
                     RFDSel <=0; 
                     ALU_In_sel <=1;
                     branch <= 0;
                     DMWE <= 0;
                     MtoRFsel <= 1;
                     ALUOp <=2'b00;
                      jump <= 1'b0;
                     
               end
               
       6'b101011: begin RFWE <=0;
                     RFDSel <=1'bx; 
                     ALU_In_sel <=1;
                     branch <= 0;
                     DMWE <= 1;
                     MtoRFsel <= 1'bx;
                     ALUOp <=2'b00;
                      jump <= 1'b0;
                     
               end
               
     6'b000100: begin RFWE <=0;
                     RFDSel <=1'bx; 
                     ALU_In_sel <=0;
                     branch <= 1;
                     DMWE <= 0;
                     MtoRFsel <= 1'bx;
                     ALUOp <=2'b01;
                      jump <= 1'b0;
                     
               end
               
        6'b001000: begin RFWE <=1'b1;
                     RFDSel <=1'b0; 
                     ALU_In_sel <=1'b1;
                     branch <= 1'b0;
                     DMWE <= 1'b0;
                     MtoRFsel <= 1'b0;
                     ALUOp <=2'b00;
                     jump <= 1'b0;
                     
               end
               
          6'b000010: begin RFWE <=1'b0;
                     RFDSel <=1'bx; 
                     ALU_In_sel <=1'bx;
                     branch <= 1'bx;
                     DMWE <= 1'bx;
                     MtoRFsel <= 1'bx;
                     ALUOp <=2'bxx;
                     jump <= 1'b1;   
               end
               
             
               
             
               
               
    
    
    endcase
    
    end
    

  always @(ALUOp) begin
  
  case(ALUOp) 
    3'b000:
     ALU_Op_sel <= 4'b010; 
    
    3'b001:
     ALU_Op_sel <= 4'b011; 
    
    3'b010:  
    begin
    
        case(func)
        //finish op codes
        6'b100000:  ALU_Op_sel <= 4'b0010;    //add
        6'b100010:  ALU_Op_sel <= 4'b0011;   //sub
        6'b100100:  ALU_Op_sel <= 4'b0000;   //and
        6'b100101:  ALU_Op_sel <= 4'b0001;   //or
        6'b101010:  ALU_Op_sel <= 4'b1010;  //ASR
        6'b000100:  ALU_Op_sel <= 4'b1001; //SLLV
        6'b000000:  ALU_Op_sel <= 4'bb1001; //SLLV nothing NOP
        endcase                
    end
    
   
 endcase
 
    end
endmodule
