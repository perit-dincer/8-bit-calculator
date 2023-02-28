

module tb();

logic clk;
logic [15:0] swIns;
logic [15:0]  insLed;
    logic [3:0] dataAddress;
    logic dataReadEnable;
     logic dataWriteEnable;
  
    logic regWriteEnable;
    logic[3:0] regWriteData;
    logic[2:0] regWriteAddress;
    logic[2:0] regAddress1;
    logic[2:0] regAddress2;
    logic[3:0] regReadData1;
    logic[3:0] regReadData2;
    logic isexternal;
    logic [11:0] memoryInstruct;
     logic fromDataMemory;
   logic ALUAddEnable;
    logic [11:0] instruct;
    logic [11:0] instructionMemoryInstruct;
    logic [4:0] debouncer;
    logic getInstruct;
 logic left,right,up,center,down;

initial begin
    clk = 0;
    forever #1 clk = ~clk;
end

main dut(  clk,
           swIns,
           debouncer,
           left,right,up,center,down,
           getInstruct,
           //logic [4:0] debouncer,
           insLed,
           //output logic [6:0]seg,
           //output logic dp,
           //output logic[3:0] an,
           
            dataAddress,
        dataReadEnable,
            dataWriteEnable,
           
            
          regWriteEnable,
            regWriteData,
    regWriteAddress,
           regAddress1,
           regAddress2,
         regReadData1,
             regReadData2,
             ALUAddEnable,
             instruct,
       instructionMemoryInstruct,
       isexternal,
       memoryInstruct,
       fromDataMemory
             );

initial begin
debouncer[0] = 0; #10;
debouncer[1] = 0; #10;
debouncer[2] = 0; #10;
debouncer[3] = 0; #10;
debouncer[4] = 0; #10;
debouncer[0] = 1; #10;
debouncer[0] = 0; #20;
#10;
debouncer[4] = 1;
#20;
debouncer[4] = 0;
#20;
debouncer[4] = 1;
#20;
debouncer[4] = 0;
#20
debouncer[4] = 1;
#20;
debouncer[4] = 0;
#20;
debouncer[4] = 1;
#20;
debouncer[4] = 0;
#20;
debouncer[4] = 1;
#20;
debouncer[4] = 0;
#20
debouncer[4] = 1;
#20;
debouncer[4] = 0;
#20;
end
endmodule



