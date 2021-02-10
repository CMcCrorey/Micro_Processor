`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/29/2020 12:33:00 PM
// Design Name: 
// Module Name: Multi_cycle_pro
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

//continue debugging lw
module Multi_cycle_pro(
    input CLK,RST 
    
    );
    
  
// LW,SW,R,BEQ and J should be working test whole file next 

    //************wire sets*******************
    
    wire x= 1'bx;
    
    //common wires
    wire [31:0] PC_wire;
    wire [31:0] Data_wire;
    wire [31:0] Data_wire_R;
    wire [31:0] instruction;
    wire [4:0] RS,RT,RD,Shamt;
    wire [5:0] Op,func;
    wire [15:0] Offset;
    wire [25:0] Jaddr;
    wire [31:0] SIMM;
    
   assign {Op,RS,RT,Offset} =instruction;  //I type lw sw
   assign {Op,RS,RT,RD,Shamt,func} =instruction; //R type
   assign {Op,Jaddr} =instruction;           //jump
   assign  SIMM = $signed(Offset);
   
   
     //Control unit wires
  
   wire id_sel;
   wire ALU_In1_sel;
   wire [2:0]  ALU_In2_sel;
  
   wire MtoRFsel; 
   wire RFDSel;
   wire IDSel;
   wire [1:0] PCSel;   //dont need this for now
   
   
   wire IRWE;  
   wire DMWE; 
   wire RFWE; 
   wire PC_write;
   wire branch;
   wire jump;
   
   wire [1:0] ALUOp;
   wire [3:0] ALU_sel; 
   
     
     
    Control_unit_multi cu(.CLK(CLK),.RST(RST),.Op(Op),.func(func),.MtoRFsel(MtoRFsel),.RFDSel(RFDSel),.IDSel(id_sel),.PCSel(PCSel), .ALU_In_sel(ALU_In1_sel),.ALU_In2_sel(ALU_In2_sel),
    
    .IRWE(IRWE),.DMWE(DMWE),.RFWE(RFWE),.PC_write(PC_write),.branch(branch),.jump(jump),.ALUOp(ALUOp),.ALU_sel(ALU_sel));
     
     
     
     
     
    
     wire [31:0] RF_d1_out_wire;
     wire [31:0] RF_d2_out_wire;
     wire [31:0] RF_d2_out_wire_R;
     
     wire [31:0] ADR;
     
     wire [31:0] ALU_In1_wire;
     wire [31:0] ALU_In2_wire;
     wire [31:0] ALU_out_wire;
     wire [31:0] ALU_out_wire;
     wire [31:0] ALU_out_wire_R;
     wire [31:0] RF_d1_out_wire_R;
     wire [31:0] PC_update_wire;
     wire [31:0] RFWD_wire;
     wire [4:0] RT_RD_sel_wire;
    
    wire [31:0] const_1;
    
    assign const_1 =1;
    
    
    PC pc(.CLK(CLK),.RST(RST),.EN(and2_out),.a(PC_update_wire),.PC_out(PC_wire));
        
    // main mem for instr and memory
    DM_RAM mem(.CLK(CLK),.WR(DMWE), .addr(ADR), .Din(RF_d2_out_wire_R),.Dout(Data_wire));

    
    
    //RF
    RF rf(.CLK(CLK),.WR(RFWE),.addr1(RS),.addr2(RT),.addr_WR(RT_RD_sel_wire),.Din(RFWD_wire),.Dout1(RF_d1_out_wire),.Dout2(RF_d2_out_wire));
    
    //instruction reg NAIR needs fixing maybe
    IR Ir(.CLK(CLK),.EN(IRWE),.a(Data_wire),.out(instruction));
    
    NAIR A(.CLK(CLK),.a(RF_d1_out_wire),.out( RF_d1_out_wire_R));
    NAIR B(.CLK(CLK),.a(RF_d2_out_wire),.out( RF_d2_out_wire_R));
    NAIR DR(.CLK(CLK),.a(Data_wire),.out(Data_wire_R));
    NAIR alu_out_R(.CLK(CLK),.a(ALU_out_wire),.out(ALU_out_wire_R));
    
    wire zero;
    //ALU
    ALU alu(.ALU_sel(ALU_sel),.Din1(ALU_In1_wire),.Din2(ALU_In2_wire),.Dout(ALU_out_wire),.zero(zero));
    
    // Muxs
    Mux_4  mux_4 (.a(RF_d2_out_wire_R),.b(const_1),.c(SIMM),.d(x),.sel(ALU_In2_sel),.out(ALU_In2_wire));   
    
    wire [31:0]  fulljaddr;
    
    assign fulljaddr = {ALU_out_wire_R [31:26],Jaddr};
    
    Mux_4  endm(.a(ALU_out_wire),.b(ALU_out_wire_R),.c(fulljaddr),.d(x),.sel(PCSel),.out(PC_update_wire)); 
     
     
    Mux #(.WL(5)) RT_RD_sel  (.a(RT),.b(RD),.m_sel(RFDSel),.m_out(RT_RD_sel_wire));
   
    Mux alu_in1_sel_mux(.a(PC_wire),.b(RF_d1_out_wire_R),.m_sel(ALU_In1_sel),.m_out(ALU_In1_wire));   
    Mux ID_sel(.a(PC_wire),.b(ALU_out_wire_R),.m_sel(id_sel),.m_out(ADR));
    Mux MtoRFSel(.a(ALU_out_wire_R),.b(Data_wire_R),.m_sel(MtoRFsel),.m_out( RFWD_wire));
    
    
    wire and1_out;
    wire and2_out;
    
    and a1(and1_out, zero,branch);
    or or1(and2_out,and1_out, PC_write);
    
endmodule
