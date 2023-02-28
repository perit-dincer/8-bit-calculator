`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/18/2022 07:20:59 PM
// Design Name: 
// Module Name: cu
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


module sortTestBench();

logic clk;
logic [3:0] sortedArray[7:0];
logic [3:0] unsortedArray[7:0];
logic sortEnable;
logic [3:0] count;


initial begin
    clk = 0;
    forever #1 clk = ~clk;
end

sortMainTester dut(clk,sortEnable,unsortedArray,count,sortedArray);

initial begin
sortEnable=0;
count = 4'b0111;
unsortedArray[7]= 4'b0110;//6

unsortedArray[6]= 4'b0100;//4

unsortedArray[5]= 4'b0010;//2

unsortedArray[4]= 4'b1111;//7

unsortedArray[3]= 4'b0000;//88
unsortedArray[2]= 4'b0001;//88
unsortedArray[1]= 4'b1001;//88

#10;
sortEnable=1;#10000;

end
endmodule
