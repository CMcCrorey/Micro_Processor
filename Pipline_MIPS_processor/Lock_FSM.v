`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/08/2020 06:57:23 AM
// Design Name: 
// Module Name: Lock_FSM
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


module Lock_FSM(
    input a,
    input CLK,
    input RST,
    output reg z
    );
    
    reg [4:0] current_state, next_state;
    
    always @(posedge CLK or a or RST) begin
    if(RST)
    current_state <= 5'b00000;
    else
    current_state <= next_state;
    end
    
    always @(current_state or a) begin
    case (current_state)  
    
    5'b00000: 
    if(a==1)
    next_state <= 5'b00001;
    else
    next_state <= 5'b00000;
    
    5'b00001: 
     if(a==0)
    next_state <= 5'b00010;
    else
    next_state <= 5'b00000;
    
    5'b00010: 
     if(a==0)
    next_state <= 5'b00100;
    else
    next_state <= 5'b00000;
    
    5'b00100: 
     if(a==1)
    next_state <= 5'b01001;
    else
    next_state <= 5'b00000;
    
    5'b01001: 
    next_state <= 5'b00000;
     
    endcase
    end
    
    
    
    always @(current_state) begin
    
    if (current_state ==5'b01001)
    z=1;
    else z=0;
    end
endmodule
