module firstLight(key, RK, LK, RL, light, turn, clock, reset);
    input logic               key, RK, LK, clock, reset;
	 input logic				[1:0] RL, turn;
    output logic 				[1:0]	light;
	 
	 
	  // Your code goes here!! 
 // State variables
 enum logic [1:0] { green_light_on = 2'b10, light_off = 2'b00, red_light_on = 2'b01 } ps, ns;  
  
 // Next State logic  
 always_comb begin  
  case (ps)  
   light_off:   
			  if (((RL == 2'b01) && LK) || (turn == 2'b10)) ns = red_light_on;
			  else if (((RL == 2'b10) && LK) || (turn == 2'b01)) ns = green_light_on;
			  else ns = light_off;
			  
			  
   red_light_on:  
			  if (RK) ns = light_off;
			  else if (turn == 2'b01) ns = green_light_on;
			  else ns = red_light_on;  
			  
   green_light_on:  
			  if (RK) ns = light_off;
			  else if (turn == 2'b10) ns = red_light_on;
			  else ns = green_light_on;  
			  
	default: ns = green_light_on;
  endcase  
 end  
   
 // Output logic - could also be another always_comb block. 
 assign light = (ps);
 
 
 // DFFs  
 always_ff @(posedge clock) begin  
  if (reset)
	ps <= red_light_on; 

  else  
   ps <= ns;  
 end  
 

endmodule


module firstLight_testbench();
  logic    key, RK, LK, clock, CLOCK_50, reset;
  logic				[1:0] RL;
  logic 				[1:0]	light;
  
  assign clock = CLOCK_50;
 firstLight dut (key, RK, LK, RL, light, clock, reset);  
   
 // Set up a simulated clock.   
 parameter CLOCK_PERIOD=100;  
 initial begin   
  CLOCK_50 <= 0;  
  forever #(CLOCK_PERIOD/2) CLOCK_50 <= ~CLOCK_50; // Forever toggle the clock 
 end  
 
 initial begin   
  reset <= 0; repeat(1) @(posedge CLOCK_50);  
  reset <= 1; repeat(1) @(posedge CLOCK_50); // Always reset FSMs at start  
  reset <= 0; repeat(1) @(posedge CLOCK_50); 
  RK    <= 0; repeat(4) @(posedge CLOCK_50); 
  LK    <= 0; repeat(4) @(posedge CLOCK_50);
  key   <= 0; repeat(4) @(posedge CLOCK_50);
  RK    <= 1; repeat(4) @(posedge CLOCK_50);  
  RK    <= 0; repeat(4) @(posedge CLOCK_50);
  LK    <= 1; repeat(4) @(posedge CLOCK_50); 
  $stop; // End the simulation.  
 end  
 
endmodule
