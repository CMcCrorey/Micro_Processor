`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/10/2020 03:32:55 PM
// Design Name: 
// Module Name: Pipeline
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
// forward data and branch hazard control not functioning properly , branch gets data but for qual operator but cant compare cause signal doesnt last
// seems to be a sim problem with data forward 

module Pipeline(
    input CLK, RST
    );
    
    wire [31:0] instrD_wire;
    wire [4:0] RS,RT,RD,Shamt;
    wire [5:0] Op,func;
    wire [15:0] Offset;
    wire [25:0] Jaddr;
    wire [31:0] full_Jaddr;
    wire [31:0] const_p1;
    wire signed [31:0] SIMM;
    
   assign {Op,RS,RT,Offset} =instrD_wire;  //I type lw sw
   assign {Op,RS,RT,RD,Shamt,func} =instrD_wire; //R type
   assign {Op,Jaddr} =instrD_wire;
   assign  SIMM = $signed(Offset);
   assign const_p1 = 32'b1; 
   assign  full_Jaddr = {PCP1F_wire[31:26], Jaddr};
  wire x;
  //curret no jump 
 // seems R instructions LW and SW work but hazard unit having issues
 // review hazard logic and test
 
  
   
   //cu wires 
    wire RFWE_wire;
    wire RFDSel_wire;      
    wire ALU_In_sel_wire;  
    wire branch_wire;      
    wire DMWE_wire;        
    wire MtoRFsel_wire;  
    wire jump_wire;   
    wire [3:0] ALU_Op_sel_wire;  
    
    //hazrd wires
    
    wire stall_wire;
    wire flush_wire;
    wire ForwardAD_wire;
    wire ForwardBD_wire;
    wire [1:0] ForwardAE_wire;
    wire [1:0] ForwardBE_wire;
    
    
        
  //fetch
 wire [31:0] instruction_wire; 
 wire [31:0] PC_wire;
 wire [31:0] PCF_wire;
 wire [31:0] PCP1F_wire;
 wire [31:0] PC_in_wire;
 wire jump_wire;
 
  //CU wires DECODE
  wire PCSelD_wire;
  wire [31:0] PCP1D_wire;
  wire [31:0] PCbranchD_wire;
  wire [31:0] RF_d1_out_wire;
  wire [31:0] RF_d2_out_wire;
  wire zero_wire;
  wire [31:0] EqualInA_wire;
  wire [31:0] EqualInB_wire;
  
  //CU wires EX
  
  wire RFWEE_wire;
  wire RFDSelE_wire;      
  wire ALUselE_wire;      
  wire DMWEE_wire;        
  wire MtoRFselE_wire;     
  wire [3:0] ALU_Op_selE_wire;
  
  wire [31:0] RF_d1_outE_wire;
  wire [31:0] RF_d2_outE_wire;
  wire [4:0] RsE,RtE,RdE;
  wire [4:0] RFAE_wire;
  wire signed [31:0] SIMME;
  
  wire [31:0] ALU_in1_wire;
  wire [31:0] ALU_in2_wire;
  wire [31:0] DMDinE_wire;
  wire [31:0] ALU_Out_wire;
  
  
  //CU wires MEM
  
  wire RFWEM_wire;
  wire MtoRFselM_wire;     
  wire ALUselM_wire; 
  wire DMWEM_wire;  
  wire [31:0] DMDinM_wire;
  wire [31:0] ALU_OutM_wire;
  wire [4:0] RFAM_wire;
  wire [31:0] mem_read_wire;
  
  //CU wires WB
   
  wire RFWEW_wire;
  wire MtoRFselW_wire;  
  wire [31:0] DMOutW_wire;
  wire [31:0] ALU_OutW_wire;
  wire [4:0] RFAW_wire;  
    
  wire [31:0] ResultW_wire;  
    
    
    
    
   //Control unit
 CU_pipe cu
 (.Op(Op), 
 .func(func), 
 .RFWE(RFWE_wire), 
 .RFDSel(RFDSel_wire), 
 .ALU_In_sel(ALU_In_sel_wire), 
 .branch(branch_wire),
 .DMWE(DMWE_wire),
 .MtoRFsel(MtoRFsel_wire), 
 .ALU_Op_sel(ALU_Op_sel_wire),
 .jump(jump_wire));
     
     


    
     
   
   //pipline stages
   
   pipe_ID id(.CLK(CLK),.jump(jump_wire), .EN(stall_wire), .CLR(PCSelD_wire), .PCp1F(PCP1F_wire),.instruction(instruction_wire),.instrD(instrD_wire),.PCp1D(PCP1D_wire));


   Pipe_EX exe(.CLK(CLK) , .CLR(flush_wire), .RFWE(RFWE_wire), .RFDSel(RFDSel_wire), .DMWE(DMWE_wire), .MtoRFsel(MtoRFsel_wire), .ALU_Op_sel(ALU_Op_sel_wire), 
   .ALU_sel(ALU_In_sel_wire), .RsD(RS),.RtD(RT), .RdD(RD), .SIMM(SIMM), .RFD1(RF_d1_out_wire), .RFD2(RF_d2_out_wire), .RFWEE(RFWEE_wire), .RFDSelE(RFDSelE_wire),.DMWEE(DMWEE_wire),
   .MtoRFsel_E(MtoRFselE_wire), .ALUOp_E(ALU_Op_selE_wire),.ALU_sel_E(ALUselE_wire), .RsE(RsE),.RtE(RtE), .RdE(RdE), .SIMM_out(SIMME),.RFD1_out(RF_d1_outE_wire), .RFD2_out(RF_d2_outE_wire));

   Pipe_Mem mem(.CLK(CLK), .RFWEE(RFWEE_wire), .DMWEE(DMWEE_wire),.MtoRFselE(MtoRFselE_wire),.ALU_out(ALU_Out_wire), .DMinE(DMDinE_wire), .RtDE(RFAE_wire),
    .RFWEM(RFWEM_wire), .DMWEM(DMWEM_wire), .MtoRFselM(MtoRFselM_wire), .ALU_outM(ALU_OutM_wire),.DMinM(DMDinM_wire), .RtDM(RFAM_wire) );
    

   Pipe_WB wb(.CLK(CLK), .RFWEM(RFWEM_wire), .MtoRFSelM(MtoRFselM_wire), .mem_read(mem_read_wire), .ALU_outM(ALU_OutM_wire), .RtDM(RFAM_wire), 
.RFWEW(RFWEW_wire), .MtoRFSelW(MtoRFselW_wire),  .DMoutW(DMOutW_wire), .ALU_outW(ALU_OutW_wire), .RtDW(RFAW_wire) );

   
   
 //Hazard unit
 Hazard_unit HU(.jump(jump_wire),.rsD(RS) , .rtD(RT), .rsE(RsE), .rtE(RtE), .rtdM(RFAM_wire), .rtdW(RFAW_wire), .rtdE(RFAE_wire), .RFWEE(RFWEE_wire), 
.RFWEM(RFWEM_wire), .RFWEW(RFWEW_wire), .MtoRFSelE(MtoRFselE_wire), .BranchD(branch_wire), .MtoRFSelM(MtoRFselM_wire), .ForwardAE(ForwardAE_wire), .ForwardBE(ForwardBE_wire), 
.ForwardAD(ForwardAD_wire), .ForwardBD(ForwardBD_wire), .flush(flush_wire), .stall(stall_wire));  
    
  //PC
    
  PC_pip pc(.CLK(CLK),.jump(jump_wire),.RST(RST),.EN(stall_wire), .a(PC_in_wire), .PC_out(PCF_wire));
  
    
 IM_ROM IM( .addr(PCF_wire), .instruct(instruction_wire));

  RF rf(.CLK(CLK),.WR(RFWEW_wire),.addr1(RS),.addr2(RT),.addr_WR(RFAW_wire),.Din(ResultW_wire),.Dout1(RF_d1_out_wire),.Dout2(RF_d2_out_wire));
      
 ALU alu(.Din1(ALU_in1_wire), .Din2(ALU_in2_wire), .Dout(ALU_Out_wire),.ALU_sel(ALU_Op_selE_wire), .zero(x));

DM_RAM dm(.CLK(CLK), .WR(DMWEM_wire), .Din(DMDinM_wire), .Dout(mem_read_wire),.addr(ALU_OutM_wire));
  
     

   
   
    
 //adder
 
    
 Adder #(.WL(32))  Pcp1(.a(PCF_wire), .b(const_p1),.out(PCP1F_wire));
 Adder  #(.WL(32)) PCBranch(.a(SIMM),.b(PCP1D_wire),.out(PCbranchD_wire)); 
    


 //MUX 2:1   
  Mux #(.WL(32)) pc_sel(.a(PCP1F_wire),.b(PCbranchD_wire),.m_sel(PCSelD_wire),.m_out(PC_wire));  
  

  
  Mux #(.WL(32)) forwardAD_mux(.a(RF_d1_out_wire),.b(ALU_OutM_wire),.m_sel(ForwardAD_wire),.m_out(EqualInA_wire));  
  Mux #(.WL(32)) forwardBD_mux(.a(RF_d2_out_wire),.b(ALU_OutM_wire),.m_sel(ForwardBD_wire),.m_out(EqualInB_wire)); 
   
  Mux #(.WL(5)) RFDSelE(.a(RtE),.b(RdE),.m_sel(RFDSelE_wire),.m_out(RFAE_wire));  
  Mux #(.WL(32)) ALUInSelE(.a(DMDinE_wire),.b(SIMME),.m_sel(ALUselE_wire),.m_out(ALU_in2_wire));  
  Mux #(.WL(32)) MtoRFSelW(.a(ALU_OutW_wire),.b(DMOutW_wire),.m_sel(MtoRFselW_wire),.m_out(ResultW_wire));  
  
  Mux #(.WL(32)) jump(.a(PC_wire),.b(full_Jaddr),.m_sel(jump_wire),.m_out(PC_in_wire));  
  


    
 //MUX 4:1
  Mux_4  ForwardAE_mux(.a(RF_d1_outE_wire),.b(ResultW_wire),.c(ALU_OutM_wire),.d(x),.sel(ForwardAE_wire),.out(ALU_in1_wire));    
  Mux_4  ForwardBE_mux(.a(RF_d2_outE_wire),.b(ResultW_wire),.c(ALU_OutM_wire),.d(x),.sel(ForwardBE_wire),.out(DMDinE_wire));    
  
 //equalaotor  + logic  
   equal eq( .en(stall_wire),.a(EqualInA_wire), .b(EqualInB_wire), .zero(zero_wire)); 
   and A1(PCSelD_wire,zero_wire,branch_wire); 
    
endmodule
