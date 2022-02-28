module shift_register(load, data, reset, clock, out);
    input logic load, reset, clock;
	 input logic [15:0] data;
	 output logic out;

	 
	 logic d0,d1,d2,d3,d4,d5,d6,d7,d8,d9,d10,d11,d12,d13,d14,d15,q0=0,q1=0,q2=0,q3=0,q4=0,q5=0,q6=0,q7=0,q8=0,q9=0,q10=0,q11=0,q12=0,q13=0,q14=0,q15 = 0;
	 
	 mux2_1 mux1(.i0(q15), .i1(data[0]), .sel(load), .out(d0));
	 mux2_1 mux2(.i0(q0), .i1(data[1]), .sel(load), .out(d1));
	 mux2_1 mux3(.i0(q1), .i1(data[2]),  .sel(load), .out(d2));
	 mux2_1 mux4(.i0(q2), .i1(data[3]),  .sel(load), .out(d3));
	 mux2_1 mux5(.i0(q3), .i1(data[4]),  .sel(load), .out(d4));
	 mux2_1 mux6(.i0(q4), .i1(data[5]),  .sel(load), .out(d5));
	 mux2_1 mux7(.i0(q5), .i1(data[6]),  .sel(load), .out(d6));
	 mux2_1 mux8(.i0(q6), .i1(data[7]),  .sel(load), .out(d7));
	 mux2_1 mux9(.i0(q7), .i1(data[8]),  .sel(load), .out(d8));
	 mux2_1 mux10(.i0(q8), .i1(data[9]),  .sel(load), .out(d9));
	 mux2_1 mux11(.i0(q9), .i1(data[10]),  .sel(load), .out(d10));
	 mux2_1 mux12(.i0(q10), .i1(data[11]),  .sel(load), .out(d11));
	 mux2_1 mux13(.i0(q11), .i1(data[12]),  .sel(load), .out(d12));
	 mux2_1 mux14(.i0(q12), .i1(data[13]),  .sel(load), .out(d13));
	 mux2_1 mux15(.i0(q13), .i1(data[14]),  .sel(load), .out(d14));
	 mux2_1 mux16(.i0(q14), .i1(data[15]),  .sel(load), .out(d15));
	 
	 
	 
// 16 DFFs  
 always_ff @(posedge clock) begin 
	if (reset) 
		q0 <= 0;	
	else
		q0 <= d0;
 end  

 always_ff @(posedge clock) begin 
	if (reset)
		q1 <= 0;
	else
		q1 <= d1;
 end 
 
 always_ff @(posedge clock) begin 
	if (reset) 
		q2 <= 0;	
	else
		q2 <= d2;
 end  

 always_ff @(posedge clock) begin 
	if (reset)
		q3 <= 0;
	else
		q3 <= d3;
 end 
 
 always_ff @(posedge clock) begin 
	if (reset) 
		q4 <= 0;	
	else
		q4 <= d4;
 end  

 always_ff @(posedge clock) begin 
	if (reset)
		q5 <= 0;
	else
		q5 <= d5;
 end 
 
 always_ff @(posedge clock) begin 
	if (reset) 
		q6 <= 0;	
	else
		q6 <= d6;
 end  

 always_ff @(posedge clock) begin 
	if (reset)
		q7 <= 0;
	else
		q7 <= d7;
 end 
 
 always_ff @(posedge clock) begin 
	if (reset) 
		q8 <= 0;	
	else
		q8 <= d8;
 end  

 always_ff @(posedge clock) begin 
	if (reset)
		q9 <= 0;
	else
		q9 <= d9;
 end 
 
 always_ff @(posedge clock) begin 
	if (reset) 
		q10 <= 0;	
	else
		q10 <= d10;
 end  

 always_ff @(posedge clock) begin 
	if (reset)
		q11 <= 0;
	else
		q11 <= d11;
 end 
 
 always_ff @(posedge clock) begin 
	if (reset) 
		q12 <= 0;	
	else
		q12 <= d12;
 end  

 always_ff @(posedge clock) begin 
	if (reset)
		q13 <= 0;
	else
		q13 <= d13;
 end 
 
 always_ff @(posedge clock) begin 
	if (reset) 
		q14 <= 0;	
	else
		q14 <= d14;
 end  

 always_ff @(posedge clock) begin 
	if (reset)
		q15 <= 0;
	else
		q15 <= d15;
 end 
 
 assign out = q15;
endmodule

module shift_register_testbench();
	 logic load, reset, clock, CLOCK_50;
	 logic [15:0] data;
	 logic out;

	
	  assign clock = CLOCK_50;
	
	shift_register dut (load, data, reset, clock, out);

   
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
 
	
endmodule
