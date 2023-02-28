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


module dataMemory(
input logic clk, 
input logic reset, 
input logic regWriteEnable,input logic regReadEnable,  
input logic [3:0] regWriteData,  
input logic [3:0] regAddress,  
output logic [3:0] regReadData);  

      logic [3:0] regMem[15:0];//BE CAREFUL
      
      always_ff@ (posedge clk, posedge reset)
       begin
      
        if(reset) 
            begin
            for(int i=0;i<=15;i++)//this should work
                regMem[i] <= 4'b0000;
            end
            
        else if(regWriteEnable)
              regMem[regAddress] <= regWriteData;
              
        else if(regReadEnable)
                 regReadData <= regMem[regAddress];
             
       end
           
          // assign regRedData = regMem[regAdress];
 endmodule