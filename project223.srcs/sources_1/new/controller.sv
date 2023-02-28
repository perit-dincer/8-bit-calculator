`timescale 1ns / 1ps


module controller(
input logic clk, 
input logic reset, 
input logic [11:0] inp,
output logic [3:0] dataAddress,
output logic dataReadEnable,
output logic dataWriteEnable,
output logic regWriteEnable,
output logic[2:0] regWriteAddress,
output logic[2:0] regAddress1,
output logic[2:0] regAddress2,
output logic ALUAddEnable,
output logic fromDataMemory
);  
        logic [2:0] r;
        logic [3:0] d;
        logic [2:0] oneClockfThree;
          logic [2:0] fThree;
          logic [3:0] dataFromMem;
          logic [3:0] r2;
          logic [2:0] r1;
          logic [2:0] w;
          logic [3:0] trash,trash2;
        assign fThree[2] = inp[11];
        assign fThree[1] = inp[10];
        assign fThree[0] = inp[9];
        logic waitState;

      always_ff@ (posedge clk, posedge reset)
       begin
      
        if(reset) 
        begin
                           dataReadEnable <= 0;
                           dataWriteEnable <= 0;
                           dataAddress <= 4'b0000;

                           regWriteEnable <= 0;
                           regWriteAddress <= 4'b0000;
                           fromDataMemory <=0;

                           regAddress1 <= 4'b0000;
                           regAddress2 <= 4'b0000;
                           ALUAddEnable <= 0;
                           waitState <= 0;
                           
                           oneClockfThree[2] <= 0;
                           oneClockfThree[1] <= 0;
                           oneClockfThree[0] <= 0;
        end
        
        if(waitState)
        begin               
                           oneClockfThree[2] = 1;
                           oneClockfThree[1] = 1;
                           oneClockfThree[0] = 1;
                           waitState <= 0;
        end
        
        else if(((fThree[2])&(fThree[1])&(fThree[0])) | (oneClockfThree[0] & oneClockfThree[1] & oneClockfThree[2]))//fetch state
        begin 
                    dataReadEnable = 0;
                    dataWriteEnable = 0;
                    dataAddress = 4'b0000;

                    regWriteEnable = 0;
                    regWriteAddress = 4'b0000;
                    fromDataMemory =0;
                    regAddress1 = 4'b0000;
                    regAddress2 = 4'b0000;
                    ALUAddEnable = 0;
                    
                    oneClockfThree[2] = 0;
                    oneClockfThree[1] = 0;
                    oneClockfThree[0] = 0;
                    waitState <= 0;
        end
        
            
        else if((~fThree[2])&(~fThree[1])&(~fThree[0]))//load
              begin
   
                r[2] = inp[6];
                r[1] = inp[5];
                r[0] = inp[4];
                
                d[3] = inp[3];
                d[2] = inp[2];
                d[1] = inp[1];
                d[0] = inp[0];
                
                fromDataMemory =1;
                dataReadEnable = 1;
                dataWriteEnable = 0;
                dataAddress= d;
                regWriteEnable = 1;
                regWriteAddress = r;
                
                oneClockfThree[2] = 1;
                oneClockfThree[1] = 1;
                oneClockfThree[0] = 1;
                
                waitState <= 1;
            
            end 
              
        else if(~fThree[2]&~fThree[1]&fThree[0])//store
                  begin

            r[2] = inp[6];
            r[1] = inp[5];
            r[0] = inp[4];
            d[3] = inp[3];
            d[2] = inp[2];
            d[1] = inp[1];
            d[0] = inp[0];
            fromDataMemory =0;
            dataWriteEnable = 1;
            dataReadEnable = 0;
            dataAddress = d;
            regWriteEnable = 0;
            regAddress1 = r;
            
            oneClockfThree[2] = 1;
            oneClockfThree[1] = 1;
            oneClockfThree[0] = 1;
            waitState <= 1;
            
            
            end 
        else if(~fThree[2]&fThree[1]&~fThree[0])//add
            begin
                w[2] = inp[8];
                w[1] = inp[7];
                w[0] = inp[6];
                fromDataMemory =0;
                r1[2] = inp[5];
                r1[1] = inp[4];
                r1[0] = inp[3];
                
                r2[2] = inp[2];
                r2[1] = inp[1];
                r2[0] = inp[0];
                                                        
                regWriteEnable = 1;
                regWriteAddress = w;
                regAddress1 = r1;
                regAddress2 = r2;
                ALUAddEnable = 1;
                
                oneClockfThree[2] = 0;
                oneClockfThree[1] = 0;
                oneClockfThree[0] = 0;
                waitState <= 1;
                
              end
        else if(~fThree[2]&fThree[1]&fThree[0])//subtract
               begin
               //
                                w[2] = inp[8];
                                w[1] = inp[7];
                                w[0] = inp[6];
                                
                                r1[2] = inp[5];
                                r1[1] = inp[4];
                                r1[0] = inp[3];
                                fromDataMemory =0;
                                r2[2] = inp[2];
                                r2[1] = inp[1];
                                r2[0] = inp[0];
                                
                                regWriteEnable = 1;
                                regWriteAddress = w;
                                regAddress1 = r1;
                                regAddress2 = r2;
                                ALUAddEnable = 0;
                                
                                oneClockfThree[2] = 0;
                                oneClockfThree[1] = 0;
                                oneClockfThree[0] = 0;
                                waitState <= 1;

              end       
//bu araya asc desc sort gelcek sonra cozun
            else if(fThree[2]&fThree[1]&~fThree[0])
                  begin
                // seven seg display

                   end    
                               
       end
           
          // assign regRedData = regMem[regAdress];
 endmodule
