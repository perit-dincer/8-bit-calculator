`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/16/2022 05:39:30 PM
// Design Name: 
// Module Name: ALUAddSub
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


module ALUAddSub(
input logic addEnable,    
input logic [3:0] inp1,
input logic [3:0] inp2,
output logic [3:0] result
); 
        always_comb
        begin
             if(addEnable) 
                result <= (inp1 + inp2);
             else
                result <= (inp1 + (~inp2 + 4'b0001));
                
        end 
endmodule 


