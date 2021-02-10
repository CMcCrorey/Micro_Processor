`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/02/2020 10:50:54 AM
// Design Name: 
// Module Name: Control_unit_multi
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


module Control_unit_multi(
    input CLK, RST,
    input [5:0] Op,
    input [5:0] func,
    
    output reg MtoRFsel,
    output reg RFDSel,
    output reg IDSel,
    output reg [1:0] PCSel,   //dont need this for now
    output reg ALU_In_sel,
    output reg[1:0] ALU_In2_sel,
    
    output reg IRWE,  
    output reg DMWE, 
    output reg RFWE, 
    output reg PC_write,
    output reg branch,
    output reg jump,
    
    output reg [1:0] ALUOp,
    output reg [3:0] ALU_sel 
    );
    
  
  reg [3:0] state;
  reg [3:0] nextState; 
    
  always @(posedge CLK) begin
    
     if (RST) 
    nextState<=0;

    state <= nextState;  
end





always @(state) begin  //includes all for now
case(state)
3'b000: begin 

MtoRFsel   <= 1'bx;
RFDSel    <= 1'bx;
IDSel    <= 1'b0; 
PCSel     <= 1'b0;
ALU_In_sel <= 1'b0;
ALU_In2_sel  <= 2'b01;   //to increment PC +1
            
IRWE      <= 1'b1;  //fetch new instr
DMWE      <= 1'b0;
RFWE      <= 1'b0;
PC_write  <= 1'b1;   //write new value to PC
branch    <= 1'b0;
jump      <= 1'b0;

ALUOp <=    2'b00;

nextState <= 3'b001;
end



3'b001: begin



 


MtoRFsel   <= 1'bx;
RFDSel    <= 1'bx;
IDSel    <= 1'bx; 
PCSel     <= 1'bx;
ALU_In_sel <= 1'bx;
ALU_In2_sel  <= 2'bxx;   
            
IRWE      <= 1'b0;  
DMWE      <= 1'b0;
RFWE      <= 1'b0;
PC_write  <= 1'b0;  //so PC not updated
branch    <= 1'b0;
jump      <= 1'b0;

ALUOp <=    2'bxx;

nextState <= 3'b010;

end

3'b010: begin


    case(Op) 
    //R
    6'b000000: begin 
            MtoRFsel   <= 1'bx;
            RFDSel    <= 1'bx;
            IDSel    <= 1'bx;   
            PCSel     <= 1'bx;
            ALU_In_sel <= 1'b1;             
            ALU_In2_sel  <= 2'b00;         
            
            IRWE      <= 1'b0;  
            DMWE      <= 1'b0;
            RFWE      <= 1'b0;  
            branch    <= 1'b0;
            jump      <= 1'b0;

            ALUOp <=    2'b10;                 
                  
          nextState <= 3'b111; 
                     
               end
   //LW op            
      6'b100011: begin  
            MtoRFsel   <= 1'bx;
            RFDSel    <= 1'bx;
            IDSel    <= 1'bx;   
            PCSel     <= 1'bx;
            ALU_In_sel <= 1'b1;             
            ALU_In2_sel  <= 2'b10;         
            
            IRWE      <= 1'b0;  
            DMWE      <= 1'b0;
            RFWE      <= 1'b0;  
            branch    <= 1'b0;
            jump      <= 1'b0;

            ALUOp <=    2'b00;                 
                  
          nextState <= 3'b011; 
               end
    //sw op           
       6'b101011: begin 
                      
            MtoRFsel   <= 1'bx;
            RFDSel    <= 1'bx;
            IDSel    <= 1'bx;   
            PCSel     <= 1'bx;
            ALU_In_sel <= 1'b1;             
            ALU_In2_sel  <= 2'b10;         
            
            IRWE      <= 1'b0;  
            DMWE      <= 1'b0;
            RFWE      <= 1'b0;  
            branch    <= 1'b0;
            jump      <= 1'b0;

            ALUOp <=    2'b00;     
                     
                      nextState <= 3'b101; 
               end
     //beq          
     6'b000100: begin
            MtoRFsel   <= 1'bx;
            RFDSel    <= 1'bx;
            IDSel    <= 1'bx;   
            PCSel     <= 1'bx;
            ALU_In_sel <= 1'b0;             
            ALU_In2_sel  <= 2'b10;         
            
            IRWE      <= 1'b0;  
            DMWE      <= 1'b0;
            RFWE      <= 1'b0;  
            branch    <= 1'b0;
            jump      <= 1'b0;

            ALUOp <=    2'b00;     
                     
                      nextState <= 4'b1000; 
                     
               end
     // j          
        6'b000010: begin 
            MtoRFsel   <= 1'bx;
            RFDSel    <= 1'bx;
            IDSel    <= 1'bx;   
            PCSel     <= 1'bx;
            ALU_In_sel <= 1'b0;             
            ALU_In2_sel  <= 2'b10;         
            
            IRWE      <= 1'b0;  
            DMWE      <= 1'b0;
            RFWE      <= 1'b0;  
            branch    <= 1'b0;
            jump      <= 1'b0;

            ALUOp <=    2'b00;     
                     
            nextState <= 4'b1001; 
                     
               end
               
          6'b001000:  begin 
            MtoRFsel   <= 1'bx;
            RFDSel    <= 1'bx;
            IDSel    <= 1'bx;   
            PCSel     <= 1'bx;
            ALU_In_sel <= 1'b0;             
            ALU_In2_sel  <= 2'b10;         
            
            IRWE      <= 1'b0;  
            DMWE      <= 1'b0;
            RFWE      <= 1'b0;  
            branch    <= 1'b0;
            jump      <= 1'b0;

            ALUOp <=    2'b00;     
                     
            nextState <= 4'b1010; 
            
              end
                 
    endcase
    end
  
 
    
3'b011: begin
  
MtoRFsel   <= 1'bx;
RFDSel    <= 1'bx;
IDSel    <= 1'b1;     //
PCSel     <= 1'bx;
ALU_In_sel <= 1'bx;
ALU_In2_sel  <= 2'bxx;  
            
IRWE      <= 1'b0;  
DMWE      <= 1'b0;
RFWE      <= 1'b0;
PC_write  <= 1'b0;   
branch    <= 1'b0;
jump      <= 1'b0;

ALUOp <=    2'b00;

nextState <= 3'b100;
  
  end
  
3'b100: begin

MtoRFsel   <= 1'b1;      //
RFDSel    <= 1'b0;      //
IDSel    <= 1'bx;   
PCSel     <= 1'bx;
ALU_In_sel <= 1'bx;
ALU_In2_sel  <= 2'bxx;  
            
IRWE      <= 1'b0;  
DMWE      <= 1'b0;
RFWE      <= 1'b1;    //writing  to RF since lw
PC_write  <= 1'b0;   
branch    <= 1'b0;
jump      <= 1'b0;

ALUOp <=    2'b00;

nextState <= 3'b000;  //back to fetech
  
    end
    
 3'b101: begin

MtoRFsel   <= 1'bx;      
RFDSel    <= 1'bx;      
IDSel    <= 1'b1;   
PCSel     <= 1'bx;
ALU_In_sel <= 1'bx;
ALU_In2_sel  <= 2'bxx;  
            
IRWE      <= 1'b0;  
DMWE      <= 1'b1;          //sw write to mem
RFWE      <= 1'b0;   
PC_write  <= 1'b0;   
branch    <= 1'b0;
jump      <= 1'b0;

ALUOp <=    2'b00;

nextState <= 3'b000;  //back to fetech   
    
 end 
 
 
 
  3'b111: begin

MtoRFsel   <= 1'b0;      
RFDSel    <= 1'b1;      
IDSel    <= 1'bx;   
PCSel     <= 1'bx;
ALU_In_sel <= 1'bx;
ALU_In2_sel  <= 2'bxx;  
            
IRWE      <= 1'b0;  
DMWE      <= 1'b0;         
RFWE      <= 1'b1;   
PC_write  <= 1'b0;   
branch    <= 1'b0;
jump      <= 1'b0;

ALUOp <=    2'b00;
 
nextState <= 3'b000;  
 end
 
 
 
 
 4'b1000: begin

MtoRFsel   <= 1'bx;      
RFDSel    <= 1'bx;      
IDSel    <= 1'bx;   
PCSel     <= 2'b01;
ALU_In_sel <= 1'b1;
ALU_In2_sel  <= 2'b00;  
            
IRWE      <= 1'b0;  
DMWE      <= 1'b0;         
RFWE      <= 1'b0;   
PC_write  <= 1'b0;   
branch    <= 1'b1;
jump      <= 1'b0;

ALUOp <=    2'b01;
 
nextState <= 3'b000;  
 end
 
  4'b1001: begin

MtoRFsel   <= 1'bx;      
RFDSel    <= 1'bx;      
IDSel    <= 1'bx;   
PCSel     <= 2'b10;
ALU_In_sel <= 1'bx;
ALU_In2_sel  <= 2'bxx;  
            
IRWE      <= 1'b0;  
DMWE      <= 1'b0;         
RFWE      <= 1'b0;   
PC_write  <= 1'b1;   
branch    <= 1'b0;
jump      <= 1'b0;

ALUOp <=    2'bxx;
 
nextState <= 4'b0000;  
 end
 
  4'b1010: begin

MtoRFsel   <= 1'bx;      
RFDSel    <= 1'bx;      
IDSel    <= 1'bx;   
PCSel     <= 2'bxx;
ALU_In_sel <= 1'b1;
ALU_In2_sel  <= 2'b10;  
            
IRWE      <= 1'b0;  
DMWE      <= 1'b0;         
RFWE      <= 1'b0;   
PC_write  <= 1'b0;   
branch    <= 1'b0;
jump      <= 1'b0;

ALUOp <=    2'b00;
 
nextState <= 4'b1011;  
 end
 
 
 4'b1011: begin

MtoRFsel   <= 1'b0;      
RFDSel    <= 1'b0;      
IDSel    <= 1'bx;   
PCSel     <= 2'bxx;
ALU_In_sel <= 1'bx;
ALU_In2_sel  <= 2'bxx;  
            
IRWE      <= 1'b0;  
DMWE      <= 1'b0;         
RFWE      <= 1'b1;   
PC_write  <= 1'b0;   
branch    <= 1'b0;
jump      <= 1'b0;

ALUOp <=    2'b00;
 
nextState <= 4'b0000;  
 end
 
 
 
 
 
 
   
endcase

end
    
   

  always @(ALUOp) begin
  
  case(ALUOp) 
    2'b00:
     ALU_sel <= 4'b010; 
    
    2'b01:
     ALU_sel <= 4'b011; 
    
    2'b10:  
    begin
    
        case(func)
        //finish op codes
        6'b100000:  ALU_sel <= 4'b0010;    //add
        6'b100010:  ALU_sel <= 4'b0011;   //sub
        6'b100100:  ALU_sel <= 4'b0000;   //and
        6'b100101:  ALU_sel <= 4'b0001;   //or
        6'b101010:  ALU_sel <= 4'b1010;  //ASR
        6'b000100:   ALU_sel <= 4'b1001; //SLLV
        6'b000000:  ALU_sel <= 4'bb1001; //SLLV nothing NOP
        endcase                
    end
    
   
 endcase
 
    end
    
    
    
    
    
    
endmodule
