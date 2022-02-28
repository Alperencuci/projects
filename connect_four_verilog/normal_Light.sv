module normal_Light(up, down, light, clock, reset);
    input logic             clock, reset;
	 input logic 			[1:0] up, down;
    output logic 			 [1:0]light;
	 
// module for a regular light (not in the first, second or last row) 

	 
	 
 // State variables
 enum logic [1:0] { green_light_on = 2'b10, light_off = 2'b00, red_light_on = 2'b01 } ps, ns;  
  
 // Next State logic  
 always_comb begin  
  case (ps)  
   light_off:   
			  if (up == 2'b10) ns = green_light_on;
			  else if (up == 2'b01) ns = red_light_on;
			  else ns = light_off;
			  
			  
   red_light_on:  
			  if ((down == 2'b00)) ns = light_off;
			  else ns = red_light_on;  
			  
	green_light_on:  
			  if ((down == 2'b00)) ns = light_off;
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


module normal_Light_testbench();
	
endmodule
