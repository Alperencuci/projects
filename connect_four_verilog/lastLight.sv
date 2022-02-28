module lastLight(key, RK, LK, LL, light, clock, reset);
    input logic               key, RK, LK, clock, reset;
	 input logic				[1:0] LL;
    output logic 				[1:0]	light;
	 
	 
	  // Your code goes here!! 
 // State variables
 enum logic [1:0] { green_light_on = 2'b10, light_off = 2'b00, red_light_on = 2'b01 } ps, ns;  
  
 // Next State logic  
 always_comb begin  
  case (ps)  
   light_off:   
			  if (((LL == 2'b01) && RK)) ns = red_light_on;
			  else if (((LL == 2'b10) && RK)) ns = green_light_on;
			  else ns = light_off;
			  
			  
   red_light_on:  
			  if (LK || key) ns = light_off;
			  else ns = red_light_on;  
			  
   green_light_on:  
			  if (LK || key) ns = light_off;
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


module lastLight_testbench();
	
endmodule
