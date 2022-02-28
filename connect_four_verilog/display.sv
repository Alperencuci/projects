module display(red, green, HEX0, reset, clock);
	input logic	red,green, reset, clock;
	output logic [6:0] HEX0;//,HEX1;
	
	seg7 sr1(.red, .green,.leds(HEX0), .reset, .clock);
	//seg7 sr2(.bcd(SW[7:4]),.leds(HEX1));

endmodule
	 
module seg7 (red, green, leds, reset, clock); 
 input logic reset, clock, red, green;
 output logic  [6:0] leds; 
  
 
 enum logic [6:0] { no_win = 7'b1000000, red_win = 7'b1111001, green_win = 7'b0100100 } ps, ns;  
  
 // Next State logic  
 always_comb begin  
  case (ps)  
   no_win:   
			  if (red) ns = red_win;
			  else if(green) ns = green_win;
    		  else ns = no_win;
			  
   red_win:  
			  ns = red_win; 
		
	green_win:
			ns = green_win;
  endcase  
 end  
   
 // Output logic - could also be another always_comb block. 
 assign leds = (ps);
 
 
 // DFFs  
 always_ff @(posedge clock) begin  
  if (reset)
	ps <= no_win;

  else  
   ps <= ns;  
 end  
endmodule 	
	

/*module display_testbench();
 logic  [6:0] HEX0, HEX1, HEX2, HEX3, HEX4, HEX5;    
 logic  [9:0] LEDR;    
 logic  [3:0] KEY;   
 logic  [9:0] SW;   

 display dut (.HEX0, .HEX1, .HEX2, .HEX3, .HEX4, .HEX5, .KEY, .LEDR, 
.SW);  
endmodule*/
