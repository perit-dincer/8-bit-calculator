
`timescale 1ns / 1ps
module main( input logic clk,
           input logic [15:0] swIns,
           logic [4:0] debouncer,
               output logic left,right,up,center,down,
               output logic getInstruct,
           
           output logic [15:0]insLed,
           //output logic [6:0]seg,
           //output logic dp,
           //output logic[3:0] an,
           
             output logic [3:0] dataAddress,
            output logic dataReadEnable,
            output  logic dataWriteEnable,
           
            
            output logic regWriteEnable,
            output logic[3:0] regWriteData,
            output logic[2:0] regWriteAddress,
            output logic[2:0] regAddress1,
           output  logic[2:0] regAddress2,
           output  logic[3:0] regReadData1,
            output logic[3:0] regReadData2,
             output logic ALUAddEnable,
               output logic [11:0] instruct,
              output  logic [11:0] instructionMemoryInstruct,
              output logic isexternal,
              output logic [11:0] memoryInstruct,
              output logic fromDataMemory
             
           );
    
   logic [2:0] smartPtr = 3'b001;
  // logic left, right, center, down, up, branch;
   
   logic instructionMemoryWriteEnable;
                
   debouncer leftButton( clk, debouncer[4], left);

   debouncer rightButton( clk, debouncer[3], right);

   debouncer upButton( clk, debouncer[2], up);

   debouncer centerButton( clk, debouncer[1], center);

   debouncer downButton( clk, debouncer[0], down);
   
//   output logic [3:0] dataAddress;
//   output logic dataReadEnable;
//   output logic [3:0] dataWriteData;
//   output  logic dataWriteEnable;
//  output logic isexternal;
   
//   output logic regWriteEnable;
//   output logic[3:0] regWriteData;
//   output logic[2:0] regWriteAddress;
//   output logic[2:0] regAddress1;
//  output  logic[2:0] regAddress2;
//  output  logic[3:0] regReadData1;
//   output logic[3:0] regReadData2;
   
  // output logic ALUAddEnable;
   logic reset;
//   output logic [11:0] instruct;
//  output  logic [11:0] instructionMemoryInstruct;
   
   logic [11:0] basysInstruct;
   logic [11:0] trashinstruct;
   logic [3:0] trash1,trash2;
   logic noButton;
   //logic isexternal;
   logic[3:0] regWriteDataFromDataMemory;
   logic[3:0] regWriteDataFromALU;
   //logic fromDataMemory;
   
   always_ff @(posedge clk)
       begin
            
           if(up) 
               begin
                   //registerFile rwrite(clk, 1'b0, 1, swIns[15:12],swIns[11:8],4'b0000,4'b0000,trash1,trash2);
               end
        
          
               
            else if(left)//execute next instruction from memory
                       begin
                           isexternal = 0;
                           smartPtr = smartPtr - 1;
                           getInstruct = 1;
                           instructionMemoryWriteEnable = 0;
                           reset = 0;
                           noButton =0;
                           
                       end
             else if (right)//execute next instruction from basys
                            begin 
                                basysInstruct = swIns[11:0];
                                getInstruct = 0;
                                isexternal = 1;
                                instructionMemoryWriteEnable = 0;
                                noButton =0;
                                reset = 0;
                            end
             else if (center)//upload next instruction from basys to memory
                        begin
                           instructionMemoryInstruct = swIns[11:0];//
                           smartPtr = smartPtr + 1;
                           getInstruct = 0;
                           instructionMemoryWriteEnable = 1;
                           noButton =0;
                            reset = 0;
                        end
              else if (down)
                        begin
                            
                            reset = 1;
                            getInstruct = 0;
                            noButton =0;
                        end
               else
               begin
                getInstruct = 0;
                isexternal = 0;
                noButton = 1;
               end
               
      end
               

        
        assign instruct[0] = ((memoryInstruct[0] & ~isexternal) | (basysInstruct[0] & isexternal)) | noButton;
        assign instruct[1] = ((memoryInstruct[1] & ~isexternal) | (basysInstruct[1] & isexternal)) | noButton ;
        assign instruct[2] = ((memoryInstruct[2] & ~isexternal) | (basysInstruct[2] & isexternal)) | noButton; 
        assign instruct[3] = ((memoryInstruct[3] & ~isexternal) | (basysInstruct[3] & isexternal)) | noButton ;
        assign instruct[4] = ((memoryInstruct[4] & ~isexternal) | (basysInstruct[4] & isexternal)) | noButton ;
        assign instruct[5] = ((memoryInstruct[5] & ~isexternal) | (basysInstruct[5] & isexternal)) | noButton ;
        assign instruct[6] = ((memoryInstruct[6] & ~isexternal) | (basysInstruct[6] & isexternal)) | noButton ;
        assign instruct[7] = ((memoryInstruct[7] & ~isexternal) | (basysInstruct[7] & isexternal)) | noButton ;
        assign instruct[8] = ((memoryInstruct[8] & ~isexternal) | (basysInstruct[8] & isexternal)) | noButton ;
        assign instruct[9] = ((memoryInstruct[9] & ~isexternal) | (basysInstruct[9] & isexternal)) | noButton ;
        assign instruct[10] = ((memoryInstruct[10] & ~isexternal) | (basysInstruct[10] & isexternal)) | noButton ;
        assign instruct[11] = ((memoryInstruct[11] & ~isexternal) | (basysInstruct[11] & isexternal)) | noButton ;
        
//        assign instruct[0] = (memoryInstruct[0] & ~isexternal) | (basysInstruct[0] & isexternal);
//        assign instruct[1] = (memoryInstruct[1] & ~isexternal) | (basysInstruct[1] & isexternal);
//        assign instruct[2] = (memoryInstruct[2] & ~isexternal) | (basysInstruct[2] & isexternal);
//        assign instruct[3] = (memoryInstruct[3] & ~isexternal) | (basysInstruct[3] & isexternal);
//        assign instruct[4] = (memoryInstruct[4] & ~isexternal) | (basysInstruct[4] & isexternal);
//        assign instruct[5] = (memoryInstruct[5] & ~isexternal) | (basysInstruct[5] & isexternal);
//        assign instruct[6] = (memoryInstruct[6] & ~isexternal) | (basysInstruct[6] & isexternal);
//        assign instruct[7] = (memoryInstruct[7] & ~isexternal) | (basysInstruct[7] & isexternal);
//        assign instruct[8] = (memoryInstruct[8] & ~isexternal) | (basysInstruct[8] & isexternal);
//        assign instruct[9] = (memoryInstruct[9] & ~isexternal) | (basysInstruct[9] & isexternal);
//        assign instruct[10] = (memoryInstruct[10] & ~isexternal) | (basysInstruct[10] & isexternal);
//        assign instruct[11] = (memoryInstruct[11] & ~isexternal) | (basysInstruct[11] & isexternal);
        
        
        //assign regWriteData = (regWriteDataFromALU &~fromDataMemory) |  (fromDataMemory & regWriteDataFromDataMemory);
        assign regWriteData[0] = (regWriteDataFromALU[0] &~fromDataMemory) |  (fromDataMemory & regWriteDataFromDataMemory[0]);
        assign regWriteData[1] = (regWriteDataFromALU[1] &~fromDataMemory) |  (fromDataMemory & regWriteDataFromDataMemory[1]);
        assign regWriteData[2] = (regWriteDataFromALU[2] &~fromDataMemory) |  (fromDataMemory & regWriteDataFromDataMemory[2]);
        assign regWriteData[3] = (regWriteDataFromALU[3] &~fromDataMemory) |  (fromDataMemory & regWriteDataFromDataMemory[3]);
//        if(fromDataMemory)
//            regWriteData = regWriteDataFromDataMemory;
//        else
//            regWriteData = regWriteDataFromALU;
        //assign regWriteData = regWriteDataFromDataMemory;
        
        controller c1(clk, reset, instruct, dataAddress, dataReadEnable, dataWriteEnable, regWriteEnable, regWriteAddress, regAddress1, regAddress2, ALUAddEnable, fromDataMemory);
        
        instructionMemory im1(clk,reset,getInstruct,isexternal,instructionMemoryWriteEnable,smartPtr,instructionMemoryInstruct,memoryInstruct);
        
        registerFile rf1(clk,reset,regWriteEnable,regWriteAddress,regWriteData,regAddress1,regAddress2,regReadData1,regReadData2);
        
        ALUAddSub alu(ALUAddEnable,regReadData1,regReadData2,regWriteDataFromALU);
        
        dataMemory dm1(clk,reset,dataWriteEnable,dataReadEnable,regReadData1,dataAddress,regWriteDataFromDataMemory);
         
         
        assign insLed = 16'b0000000000000000;
        assign seg = 7'b0000000;
        assign dp = 1'b0;
        assign an= 4'b0000;

endmodule

