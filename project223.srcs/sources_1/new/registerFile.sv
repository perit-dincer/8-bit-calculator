//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/14/2022 09:14:16 PM
// Design Name: 
// Module Name: zekiproje
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

`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 23.11.2020 00:11:26
// Design Name: 
// Module Name: light_fsm
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
module registerFile(
input logic clk, 
input logic reset, 
input logic regWriteEnable,  
input logic [2:0] regWriteAddress,  
input logic [3:0] regWriteData,  
input logic [2:0] regAddress1,  
input logic [2:0] regAddress2,
output logic [3:0] regReadData1,  
output logic [3:0] regReadData2);  
      logic [3:0] regMem[7:0];  

       always_ff@ (posedge clk)
       begin   
        if(reset) 
            begin  
            for(int i=0;i<=7;i++)//this should work
                regMem[i] <= 4'b0000;
                regMem[0]<= 4'b0001;  
                regMem[1]<= 4'b0010;  
                regMem[3]<= 4'b0100;  
            end  
            else  
                 if(regWriteEnable == 1) 
                     regMem[regWriteAddress] = regWriteData;     
       end
           assign regReadData1 = regMem[regAddress1];
           assign regReadData2 = regMem[regAddress2];
           
 endmodule
 
 
 
 