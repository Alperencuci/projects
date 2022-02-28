module winner_detection(data,clock, reset, out);
    input logic          data, clock, reset; // RL right light, LL left light, RK right key, LK left
	 output logic 			out;
	 
	 
	  // Your code goes here!! 
 // State variables
 enum logic [3:0] { zero = 4'b0000, one = 4'b0001 , two = 4'b0011 , three = 4'b0111 , four = 4'b1111 } ps, ns;  
  
 // Next State logic  
 always_comb begin  
  case (ps)  
   zero:  
			  if (data) ns = one;
			  else ns = zero;  

   one:  
			  if (data) ns = two;
			  else ns = zero;  	
	
	two:  
			  if (data) ns = three;
			  else ns = zero; 
	
	three:  
			  if (data) ns = four;
			  else ns = zero; 
			  
	four:  
			  if (data) ns = four;
			  else ns = zero; 
			  
  endcase  
 end  
   
 // Output logic - could also be another always_comb block. 
 assign out = (ps == 4'b1111);
 
 
 // DFFs  
 always_ff @(posedge clock) begin  
  if (reset)
	ps <= zero; 

  else  
   ps <= ns;  
 end  
 

endmodule


module winner_detection_testbench();
	
endmodule
