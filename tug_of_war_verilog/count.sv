module count(player, victory, reset, Clock);
 input logic Clock, reset, victory; 
 
 // L is true when left key is pressed, R is true when the right key 
 // is pressed, NL is true when the light on the left is on, and NR 
 // is true when the light on the right is on.  

 
 // when lightOn is true, the center light should be on. 
 output logic[2:0] player; 
 
 // Your code goes here!! 
 // State variables
 enum logic[2:0] { zero = 3'b000, one = 3'b001, two = 3'b010, three = 3'b011, 
						 four = 3'b100, five = 3'b101, six = 3'b110, seven = 3'b111} ps, ns;  
  
 // Next State logic  
 always_comb begin  
  case (ps)  
   zero:   
			  if (victory) ns = one;
			  else ns = zero;
			  
			  
   one:  
			  if (victory) ns = two;
			  else ns = one;  
			  
			  
   two:   
			  if (victory) ns = three;
			  else ns = two;   
			  
			  
	three: 
			  if (victory) ns = four;
			  else ns = three;  
			  
	four: 
			  if (victory) ns = five;
			  else ns = four; 
		  
	five: 
			  if (victory) ns = six;
			  else ns = five; 
			  
	six: 
			  if (victory) ns = seven;
			  else ns = six; 
			  
	seven: 
			  if (victory) ns = zero;
			  else ns = seven; 
			  
  endcase  
 end  
   
 // Output logic - could also be another always_comb block. 
 assign player = (ps);
 
 
 // DFFs  
 always_ff @(posedge Clock) begin  
  if (reset)
	ps <= zero; 

  else  
   ps <= ns;  
 end  
endmodule

