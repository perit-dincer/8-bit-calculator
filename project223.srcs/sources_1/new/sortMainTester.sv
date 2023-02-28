`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/18/2022 06:49:30 PM
// Design Name: 
// Module Name: sortMainTester
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


module sortMainTester(input logic clk,
input logic sortEnable,
input logic [3:0] unSortedArray[7:0],
input logic [3:0] count,
output logic [3:0] sortedArray[7:0]);


ALUSort s( clk,sortEnable,unSortedArray,count,sortedArray);

endmodule
