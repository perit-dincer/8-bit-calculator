`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/16/2022 05:56:07 PM
// Design Name: 
// Module Name: instructionMemory
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

module instructionMemory(
input logic clk,
input logic reset,
input logic getInstruct,
input logic isexternal,
input logic writeEnable,
input logic [2:0] writeAddress,
input logic [11:0] writeData,
output logic [11:0] readData
);  
  logic [11:0] regMem[7:0]; 

        always_ff@(posedge clk, posedge reset) 
              begin
                if(reset)
                    begin
//                     regMem[0]<=12'b010100001000;
//                     regMem[1]<=12'b111111111111;
//                     regMem[2]<=12'b111111111111;
//                     regMem[3]<=12'b001111000011;
//                     regMem[4]<=12'b111111111111;
//                     regMem[5]<=12'b111111111111;
//                     regMem[6]<=12'b000111100011;
//                     regMem[7]<=12'b111111111111;
                       regMem[0]<=12'b010100001000;
                       regMem[1]<=12'b001111000011;
                       regMem[2]<=12'b000111100011;
                       regMem[3]<=12'b011111110000;
                       regMem[4]<=12'b111111111111;
                       regMem[5]<=12'b111111111111;
                       regMem[6]<=12'b000111100011;
                       regMem[7]<=12'b111111111111;
                    end  
                else if(writeEnable)
                    begin
                        regMem[writeAddress] <= writeData;
                    end
                else if(~isexternal & getInstruct)//MAMUN PÝÞY hatasý..
                        begin      
                        readData <= regMem[0];
                        for(int i=0;i<=6;i++) //shifting
                            regMem[i]<=regMem[i+1];
                        regMem[7] <= 12'b111111111111;
                        end
                    
              end 
        
endmodule
//
//
//