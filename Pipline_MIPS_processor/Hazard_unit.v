`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/14/2020 04:26:25 PM
// Design Name: 
// Module Name: Hazard_unit
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


module Hazard_unit(
input jump,
input [4:0] rsD,rtD,rsE, rtE,
input [4:0] rtdM,rtdW,rtdE,
input RFWEE,RFWEM,RFWEW, MtoRFSelE,BranchD, MtoRFSelM,


output reg [1:0] ForwardAE, ForwardBE,
output reg ForwardAD, ForwardBD,
output reg flush,
output reg stall =1'b0

    );
    
    reg BRstall, LWstall, jumpstall;
   
   
// assign ForwardAD =  ((rsD!=0) && RFWEM && (rsD == rtdM)) ;
//assign ForwardBD =   ((rtD!=0) && RFWEM && (rtD == rtdM)); 
   
    always@* begin
    
    
    //forward logic 
    if ((rsE!=0) && RFWEM && (rsE == rtdM)) 
    ForwardAE = 2'b10;
    else if((rsE!=0) && RFWEW && (rsE == rtdW))
    ForwardAE = 2'b01;
    else ForwardAE =2'b00;
    
    if ((rtE!=0) && RFWEM && (rtE == rtdM)) 
    ForwardBE =2'b10;
    else if((rtE!=0) && RFWEW && (rtE == rtdW))
    ForwardBE = 2'b01;
    else ForwardBE =2'b00;
    
    
    //forward logic branch equality comparator caseII
    


    
    //LWstall 
    
   if ( MtoRFSelE && ((rtE ==rsD)||(rtE ==rtD)))
     LWstall =1'b1;
     else
     LWstall =1'b0;
     
    
    //case III BRanch stall
    
    
    if(    (((rsD ==rtdE)||(rtD ==rtdE)) && BranchD && RFWEE)||(((rsD ==rtdE)||(rtD ==rtdE)) && BranchD && MtoRFSelM))
    BRstall = 1'b1;
    else
    BRstall =1'b0;  //so enable can work and not be x
    
    
    stall <= LWstall || BRstall; 
    
    flush  <= stall;
    
    
    end
    
    
    
        always @(rsD or RFWEM or rtdM or rtD) begin
        
   
        
    if ((rsD!=0) && RFWEM && (rsD == rtdM)) 
    ForwardAD = 1'b1;
    else   ForwardAD = 1'b0;


    if((rtD!=0) && RFWEM && (rtD == rtdM))
    ForwardBD = 1'b1;
    else ForwardBD = 1'b0;
    end
 
    
//        always @(posedge CLK) begin
//       jumpstall <= jump;
//    end
 
    
    
    
    
    
    
endmodule
