`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/18/2022 06:09:13 PM
// Design Name: 
// Module Name: ALUSort
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


module ALUSort(
input logic clk,
input logic sortEnable,
input logic [3:0] unsortedArr [7:0],
input logic [3:0] count,
output logic [3:0] sortedArray[7:0]);

      logic [3:0] tempArray [7:0];
      
      
      integer k;
      always @(posedge clk)
          begin
          for(k=0;k<=count-1;k=k+1)
              tempArray[k]<=unsortedArr[7-k];
              
              
              
//              tempArray[0] <= unsortedArr[7];
//              tempArray[1] <= unsortedArr[6];
//              tempArray[2] <= unsortedArr[5];
//              tempArray[3] <= unsortedArr[4];
//              tempArray[4] <= unsortedArr[3];

          end
          
    integer i, j, p;

    
    reg [3:0] temp;
    
    reg [3:0] array [7:0];
    
        always @*
            begin
            for(p=0;p<=count-1;p=p+1)
                 begin array[p]=tempArray[p]; 
                 end
                 
//              array[0] = tempArray[0];
//              array[1] = tempArray[1];
//              array[2] = tempArray[2];
//              array[3] = tempArray[3];
//              array[4] = tempArray[4];

              for (i = count; i > 0; i = i - 1) 
              begin
                  for (j = 0 ; j < i-1; j = j + 1) 
                  begin
                          if (array[j] < array[j + 1])
                          begin
                            temp = array[j];
                            array[j] = array[j + 1];
                            array[j + 1] = temp;
                          end 
                 end
             end 
        end
      
    integer w;
    always @(posedge clk)
        begin
        if(sortEnable)begin
        for(w=0;w<=count-1;w=w+1)
               sortedArray[w]<=array[w];
               
//          sortedArray[0] <= array[0];
//          sortedArray[1] <= array[1];
//          sortedArray[2] <= array[2];
//          sortedArray[3] <= array[3];
//          sortedArray[4] <= array[4];

         end
  end


endmodule
