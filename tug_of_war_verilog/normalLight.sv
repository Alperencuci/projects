module normalLight (Clock, Reset, L, R, NL, NR, out); 
 input logic Clock, Reset; 
 
 // L is true when left key is pressed, R is true when the right key 
 // is pressed, NL is true when the light on the left is on, and NR 
 // is true when the light on the right is on.  
 input logic L, R, NL, NR; 
 
 // when lightOn is true, the center light should be on. 
 output logic[2:0] out; 
 
 // Your code goes here!! 
 // State variables
 enum logic[2:0] { none = 3'b000, right = 3'b001, middle = 3'b010, left = 3'b100 } ps, ns;  
  
 // Next State logic  
 always_comb begin  
  case (ps)  
   none:   
			  if (NL&R&~L) ns = left;
			  else if (NR&L&~R) ns = right;
			  else ns = none;
			  
			  
   right:  
			  if (L&~R) ns = middle;
			  else if (R&~L) ns = none;
			  else ns = right;  
			  
			  
   left:   
			  if (L&~R) ns = none;
			  else if (R&~L) ns = middle;
			  else ns = left; 
			  
			  
	middle: 
			  if (L&~R) ns = left;
			  else if (R&~L) ns = right;
			  else ns = middle;
			  
  endcase  
 end  
   
 // Output logic - could also be another always_comb block. 
 assign out = (ps);
 
 
 // DFFs  
 always_ff @(posedge Clock) begin  
  if (Reset)
	ps <= none; 

  else  
   ps <= ns;  
 end  
endmodule


module normalLight_testbench();  
  /*logic         CLOCK_50;   
  logic  [6:0]  HEX0, HEX1, HEX2, HEX3, HEX4, HEX5;    
  logic  [9:0]  LEDR;     
  logic  [3:0]  KEY; 
  logic  [9:0]  SW; */ 
  logic Clock, Reset;  
  logic L, R, NL, NR; 
  
 normalLight dut (Clock, Reset, L, R, NL, NR, out);  
   
 // Set up a simulated clock.   
 parameter CLOCK_PERIOD=100;  
 initial begin   
  Clock <= 0;  
  forever #(CLOCK_PERIOD/2) Clock <= ~Clock; // Forever toggle the clock 
 end  
   
 // Test the design. 
 initial begin   
				  repeat(1) @(posedge Clock);  
  Reset <= 1; repeat(1) @(posedge Clock); // Always reset FSMs at start  
  Reset <= 0; repeat(1) @(posedge Clock); 
  NL	  <= 1; repeat(4) @(posedge Clock); // Test case 1: input is 0  
  L     <= 1; repeat(1) @(posedge Clock); // Test case 2: input 1 for 1 cycle 
  L     <= 0; repeat(1) @(posedge Clock);  
  R     <= 1; repeat(4) @(posedge Clock); // Test case 3: input 1 for >2 cycles 
  R     <= 0; repeat(2) @(posedge Clock); 
  $stop; // End the simulation.  
 end
endmodule  