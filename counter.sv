module counter(key, out, clock, reset);
    input logic               key, clock, reset;
    output logic 			 [1:0] out;
	 
 // State variables
 enum logic { green = 1'b1, red = 1'b0 } ps, ns;  
  
 // Next State logic  
 always_comb begin  
  case (ps)  	  
   red:  
			  if (key) ns = green;
			  else ns = red;  
			  
	green:  
			  if (key) ns = red;
			  else ns = green;  
			  
  endcase  
 end  
   
 // Output logic - could also be another always_comb block. 

  always_comb begin  
	if ((ps == red) && (key)) out = 2'b01;
	else if ((ps == green) && (key)) out = 2'b10;
	else out = 2'b00;
 end  
   
 
 // DFFs  
 always_ff @(posedge clock) begin  
  if (reset)
	ps <= red; 

  else  
   ps <= ns;  
 end  
 

endmodule


module counter_testbench();
	
endmodule
