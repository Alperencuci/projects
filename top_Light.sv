module top_Light(RL, LL, RK, LK, key,light, clock, reset);
    input logic               RK, LK, key, clock, reset; // RL right light, LL left light, RK right key, LK left
    input logic			 [1:0]	RL, LL;
	 output logic 			 [1:0]	light;
	 
// module for the lights on the first row 

 // State variables
 enum logic [1:0] { green_light_on = 2'b10, light_off = 2'b00, red_light_on = 2'b01 } ps, ns;  
  
 // Next State logic  
 always_comb begin  
  case (ps)  
   light_off:   
			  if ((RL == 2'b01) && (LK)) ns = red_light_on;
			  else if ((RL == 2'b10) && (LK)) ns = green_light_on;
			  else if ((LL == 2'b01) && (RK)) ns = red_light_on;
			  else if ((LL == 2'b10) && (RK)) ns = green_light_on;
			  else ns = light_off;
			  
			  
   red_light_on:  
			  if (~key && ~LK && ~RK) ns = red_light_on;
			  else ns = light_off;  

   green_light_on:  
			  if (~key && ~LK && ~RK) ns = green_light_on;
			  else ns = light_off;  			  
			  
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


module top_Light_testbench();
	
endmodule
