`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/12/2020 12:51:50 PM
// Design Name: 
// Module Name: Data_path_prac
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


//need to do

//add jump op code /data path (only jaddr)
// write the instructions to load into  IM for part e

//info
// PC register initialization works but needs to RSt for complete period
// instead of concatenating for PC jump i will only use the jaddr portion




module Data_path_prac(

input  CLK,RST

    );
    
    // instruction parse wires Op RS, RT offset 32bit
    wire [31:0] instruction;
    wire [4:0] RS,RT,RD,Shamt;
    wire [5:0] Op,func;
    wire [15:0] Offset;
    wire [25:0] Jaddr;
    
    //connection wires main modules  
    wire [31:0] RFD1_out_ALUin;
//    wire [31:0] DM_out_To_RF_Din;
//    wire [31:0] ALU_Dout_DM_addr_mux_m3;  // wire modded
    wire [31:0] RF_Dout2_DM_Din_Mux_m2;   // wire modded
    wire signed [31:0] SIMM;
    wire zero_wire;
    
    //connection wires Control unit
    wire RFWE_wire;
    wire RFDSel_wire;      
    wire ALU_In_sel_wire;  
    wire branch_wire;      
    wire DMWE_wire;        
    wire MtoRFsel_wire;  
    wire jump_wire;  
    wire [1:0] ALUOp_wire; 
    wire [3:0] ALU_sel_wire;  //since 10 alu options
    
    
 
    
   // IM and inst parse 
  IM_ROM IM( .addr(PC_Out_wire), .instruct(instruction));
  
   assign {Op,RS,RT,Offset} =instruction;  //I type lw sw
   assign {Op,RS,RT,RD,Shamt,func} =instruction; //R type
   assign {Op,Jaddr} =instruction;

    //sign extended?
   assign  SIMM = $signed(Offset);
    
  
  //main modules RF ALU DM
   
 RF rf( .Din(Mux_m3_DM_Din_wire),.addr1(RS),.addr2(RT),.addr_WR(mux_addr_WR_wire),.Dout1(RFD1_out_ALUin),.Dout2(RF_Dout2_DM_Din_Mux_m2),.CLK(CLK),.WR(RFWE_wire));
    
 ALU alu(.Din1(RFD1_out_ALUin), .Din2(mux_AlU_in_wire), .Dout(ALU_Dout_DM_addr_Mux_m3),.ALU_sel(ALU_sel_wire), .zero(zero_wire));

DM_RAM dm(.CLK(CLK), .WR(DMWE_wire), .Din(RF_Dout2_DM_Din_Mux_m2), .Dout(DM_out_Mux_m3),.addr(ALU_Dout_DM_addr_Mux_m3));
    
 //Control unit
 Control_unit C(.Op(Op), .func(func), .RFWE(RFWE_wire), .RFDSel(RFDSel_wire), .ALU_In_sel(ALU_In_sel_wire), .branch(branch_wire),.DMWE(DMWE_wire),.MtoRFsel(MtoRFsel_wire), .ALUOp(ALUOp_wire),. ALU_sel(ALU_sel_wire),.jump(jump_wire));
 
 
  
//muxs wires  
wire [4:0] mux_addr_WR_wire;
wire [31:0] mux_AlU_in_wire;
wire [31:0] DM_out_Mux_m3;
wire [31:0] Mux_m3_DM_Din_wire;
wire [31:0] ALU_Dout_DM_addr_Mux_m3;
wire [31:0] jump_wire_to_PC;


Mux #(.WL(32))m0_branch (.a(PC_p1),.b(PC_branch),.m_sel(PC_sel_wire),.m_out(mux_branch_wire)); 

Mux #(.WL(5))m1_rt_rd (.a(RT),.b(RD),.m_sel(RFDSel_wire),.m_out(mux_addr_WR_wire));   

Mux #(.WL(32))m2_alu (.a(RF_Dout2_DM_Din_Mux_m2),.b(SIMM),.m_sel(ALU_In_sel_wire),.m_out(mux_AlU_in_wire));  

Mux #(.WL(32))m3_dm (.a(ALU_Dout_DM_addr_Mux_m3),.b(DM_out_Mux_m3),.m_sel(MtoRFsel_wire),.m_out(Mux_m3_DM_Din_wire));  

Mux #(.WL(32))m3_jump (.a(mux_branch_wire),.b(PC_jump),.m_sel(jump_wire),.m_out(jump_wire_to_PC));

PC pc(.RST(RST),.CLK(CLK), .a(jump_wire_to_PC), .PC_out(PC_Out_wire));
//PC wire 



wire [31:0] mux_branch_wire;
wire [31:0] PC_Out_wire;
wire PC_sel_wire;
 
 


 
 assign const_p1 = 5'b00001;
 Adder #(.WL(32))  Pcp1(.a(PC_Out_wire), .b(const_p1),.out(PC_p1));
 Adder  #(.WL(32)) PCBranch(.a(SIMM),.b(PC_p1),.out(PC_branch));
 
 
// PC wires from adder will truncate LSB  of SIMM

wire [31:0] PC_p1;
wire [31:0] PC_jump;

 assign PC_jump = {PC_p1[31:26], Jaddr};
 
 
wire [31:0] PC_branch;    
wire [31:0] const_p1;


and PCselgate(PC_sel_wire,branch_wire,zero_wire);    
    
endmodule
