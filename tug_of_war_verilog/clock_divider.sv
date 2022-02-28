// divided_clocks[0] = 25MHz, [1] = 12.5Mhz, ... [23] = 3Hz, [24] = 1.5Hz, [25] = 0.75Hz, ...  
module clock_divider (clock, reset, divided_clocks);  
 input  logic          reset, clock;  
 output logic  [31:0]  divided_clocks = 0;  
   
 always_ff @(posedge clock) begin  
  divided_clocks <= divided_clocks + 1;   
 end  
    
endmodule

module clock_divider_testbench();  
  logic         clock;   
  logic  [6:0]  HEX0, HEX1, HEX2, HEX3, HEX4, HEX5;    
  logic  [9:0]  LEDR;     
  logic  [3:0]  KEY; 
  logic  [9:0]  SW;  
  
 clock_divider dut (clock, reset, divided_clocks);  
    
 // Set up a simulated clock.   
 parameter CLOCK_PERIOD=100;  
 initial begin   
  clock <= 0;  
  forever #(CLOCK_PERIOD/2) clock <= ~clock; // Forever toggle the clock 
 end  
   
 // Test the design. 
 initial begin   
      repeat(1) @(posedge clock);  
  SW[9] <= 1; repeat(1) @(posedge clock); // Always reset FSMs at start  
  SW[9] <= 0; repeat(1) @(posedge clock); 
  SW[0] <= 0; repeat(4) @(posedge clock); // Test case 1: input is 0  
  SW[0] <= 1; repeat(1) @(posedge clock); // Test case 2: input 1 for 1 cycle 
  SW[0] <= 0; repeat(1) @(posedge clock);  
  SW[0] <= 1; repeat(4) @(posedge clock); // Test case 3: input 1 for >2 cycles 
  SW[0] <= 0; repeat(2) @(posedge clock); 
  $stop; // End the simulation.  
 end  
endmodule
