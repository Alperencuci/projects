module delay16(signal, reset, clock, out);
    input logic signal, reset, clock;
	 output logic out;

	 
	 logic q0,q1,q2,q3,q4,q5,q6,q7,q8,q9,q10,q11,q12,q13,q14,q15;
	 
	 
// 16 DFFs  
 always_ff @(posedge clock) begin 
	if (reset) 
		q0 <= 0;	
	else
		q0 <= signal;
 end  

 always_ff @(posedge clock) begin 
	if (reset)
		q1 <= 0;
	else
		q1 <= q0;
 end 
 
 always_ff @(posedge clock) begin 
	if (reset) 
		q2 <= 0;	
	else
		q2 <= q1;
 end  

 always_ff @(posedge clock) begin 
	if (reset)
		q3 <= 0;
	else
		q3 <= q2;
 end 
 
 always_ff @(posedge clock) begin 
	if (reset) 
		q4 <= 0;	
	else
		q4 <= q3;
 end  

 always_ff @(posedge clock) begin 
	if (reset)
		q5 <= 0;
	else
		q5 <= q4;
 end 
 
 always_ff @(posedge clock) begin 
	if (reset) 
		q6 <= 0;	
	else
		q6 <= q5;
 end  

 always_ff @(posedge clock) begin 
	if (reset)
		q7 <= 0;
	else
		q7 <= q6;
 end 
 
 always_ff @(posedge clock) begin 
	if (reset) 
		q8 <= 0;	
	else
		q8 <= q7;
 end  

 always_ff @(posedge clock) begin 
	if (reset)
		q9 <= 0;
	else
		q9 <= q8;
 end 
 
 always_ff @(posedge clock) begin 
	if (reset) 
		q10 <= 0;	
	else
		q10 <= q9;
 end  

 always_ff @(posedge clock) begin 
	if (reset)
		q11 <= 0;
	else
		q11 <= q10;
 end 
 
 always_ff @(posedge clock) begin 
	if (reset) 
		q12 <= 0;	
	else
		q12 <= q11;
 end  

 always_ff @(posedge clock) begin 
	if (reset)
		q13 <= 0;
	else
		q13 <= q12;
 end 
 
 always_ff @(posedge clock) begin 
	if (reset) 
		q14 <= 0;	
	else
		q14 <= q13;
 end  

 always_ff @(posedge clock) begin 
	if (reset)
		q15 <= 0;
	else
		q15 <= q14;
 end 
 
 assign out = q15;
endmodule


/*module delay16_testbench();
	 logic load, reset, clock, CLOCK_50;
	 logic [15:0] data;
	 logic out;

	
	  assign clock = CLOCK_50;
	
	delay16 dut (load, data, reset, clock, out);

   
 // Set up a simulated clock.   
 parameter CLOCK_PERIOD=100;  
 initial begin   
  CLOCK_50 <= 0;  
  forever #(CLOCK_PERIOD/2) CLOCK_50 <= ~CLOCK_50; // Forever toggle the clock 
 end  
 assign data = 16'b0011001110000000;
 initial begin   
  reset <= 0;     repeat(1) @(posedge CLOCK_50);  
  reset <= 1;     repeat(1) @(posedge CLOCK_50); // Always reset FSMs at start  
  reset <= 0;     repeat(1) @(posedge CLOCK_50); 
  load  <= 1;     repeat(1) @(posedge CLOCK_50); 
  load  <= 0;     repeat(20) @(posedge CLOCK_50);
  load  <= 1;     repeat(1) @(posedge CLOCK_50); 
  load  <= 0;     repeat(20) @(posedge CLOCK_50);
 
  $stop; // End the simulation.  
 end  
 
	
endmodule*/
