module winner(counter, HEX);
	input logic	[2:0] counter;
	output logic [6:0] HEX; 

 always_comb begin 
  case (counter) 
   //          Light: 6543210 
   3'b000: HEX = 7'b1000000; // 0 
   3'b001: HEX = 7'b1111001; // 1 
   3'b010: HEX = 7'b0100100; // 2 
   3'b011: HEX = 7'b0110000; // 3 
   3'b100: HEX = 7'b0011001; // 4 
   3'b101: HEX = 7'b0010010; // 5 
   3'b110: HEX = 7'b0000010; // 6 
   3'b111: HEX = 7'b1111000; // 7   
   default:HEX = 7'b1111111; 
  endcase 
 end 
 
endmodule 	

/*module victory_testbench();  

 normalLight dut (victory, HEX0);  
   logic victory;
 // Test the design. 
 initial begin   
	victory = 01; #10;
	victory = 10; #10;
 end
endmodule  */