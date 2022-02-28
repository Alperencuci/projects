module second_row_Light(key, up, down, light, clock, reset);
    input logic               key, clock, reset;
	 input logic				[1:0] up, down;
    output logic 				[1:0]	light;
// module for the second row lights	 

 // State variables
 enum logic [1:0] { green_light_on = 2'b10, light_off = 2'b00, red_light_on = 2'b01 } ps, ns;  
  
 // Next State logic  
 always_comb begin  
  case (ps)  

   light_off:   
			  if ((up == 2'b01) & key) ns = red_light_on;
			  else if ((up == 2'b10) & key) ns = green_light_on; 
    		  else ns = light_off;		  
   red_light_on:  
			  if (down == 2'b00) ns = light_off;
			  else ns = red_light_on;  
			  
   green_light_on:  
			  if (down == 2'b00) ns = light_off;
			  else ns = green_light_on;  

  endcase  
 end  
   
 // Output logic - could also be another always_comb block. 
 assign light = (ps);
 
 
 // DFFs  
 always_ff @(posedge clock) begin  
  if (reset)
	ps <= light_off;

  else  
   ps <= ns;  
 end  
 

endmodule


module second_row_Light_testbench();
  logic    key, clock, CLOCK_50, reset;
  logic				[1:0] up, down;
  logic 				[1:0]	light;
  
  assign clock = CLOCK_50;
 second_row_Light dut (key, up, down, light, clock, reset);  
   
 // Set up a simulated clock.   
 parameter CLOCK_PERIOD=100;  
 initial begin   
  CLOCK_50 <= 0;  
  forever #(CLOCK_PERIOD/2) CLOCK_50 <= ~CLOCK_50; // Forever toggle the clock 
 end  
 
 initial begin   
  reset <= 0;     repeat(1) @(posedge CLOCK_50);  
  reset <= 1;     repeat(1) @(posedge CLOCK_50); // Always reset FSMs at start  
  reset <= 0;     repeat(1) @(posedge CLOCK_50); 
  up    <= 2'b00; repeat(1) @(posedge CLOCK_50); 
  down  <= 2'b00; repeat(1) @(posedge CLOCK_50);
  key   <= 1; repeat(1) @(posedge CLOCK_50);
  key   <= 0; repeat(1) @(posedge CLOCK_50);  
  up    <= 2'b01; repeat(1) @(posedge CLOCK_50);
  key   <= 1; repeat(10) @(posedge CLOCK_50); 
  $stop; // End the simulation.  
 end  
 
	
endmodule
