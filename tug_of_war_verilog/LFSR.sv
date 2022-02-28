module LFSR(clk, reset, out);
 input logic clk, reset;
 output logic [9:0] out;

// play game 
logic d1;

 // 10 DFFs  
 always_ff @(posedge clk) begin 
	if (reset) 
		out[0] <= 0;	
	else
		out[0] <= d1;
 end  
 
 always_ff @(posedge clk) begin 
	if (reset) 
		out[1] <= 0;	
	else
		out[1] <= out[0];
 end  

  always_ff @(posedge clk) begin 
	if (reset) 
		out[2] <= 0;	
	else
		out[2] <= out[1];
 end  

 always_ff @(posedge clk) begin 
	if (reset) 
		out[3] <= 0;	
	else
		out[3] <= out[2];
 end  
 
 always_ff @(posedge clk) begin 
	if (reset) 
		out[4] <= 0;	
	else
		out[4] <= out[3];
 end  
 
 always_ff @(posedge clk) begin 
	if (reset) 
		out[5] <= 0;	
	else
		out[5] <= out[4];
 end  
 
 always_ff @(posedge clk) begin 
	if (reset) 
		out[6] <= 0;	
	else
		out[6] <= out[5];
 end  
 
 always_ff @(posedge clk) begin 
	if (reset) 
		out[7] <= 0;	
	else
		out[7] <= out[6];
 end  
 
 always_ff @(posedge clk) begin 
	if (reset) 
		out[8] <= 0;	
	else
		out[8] <= out[7];
 end  
 
 always_ff @(posedge clk) begin 
	if (reset) 
		out[9] <= 0;	
	else
		out[9] <= out[8];
 end  
 
xnor g1 (d1,out[9],out[6]);

endmodule 	

module LFSR_testbench;  
	logic clk, reset;
	logic [9:0] out;
	LFSR dut(.clk, .reset, .out);
	
parameter CLOCK_PERIOD=100;  
 initial begin   
  clk <= 0;  
  forever #(CLOCK_PERIOD/2) clk <= ~clk; // Forever toggle the clock 
 end  

initial begin
				  repeat(1) @(posedge clk);  
  reset <= 1; repeat(1) @(posedge clk); // Always reset FSMs at start  
  reset <= 0; repeat(1) @(posedge clk); 
				  repeat(4) @(posedge clk); // Test case 1: input is 0  
              repeat(1) @(posedge clk); // Test case 2: input 1 for 1 cycle 
              repeat(1) @(posedge clk);  
              repeat(4) @(posedge clk); // Test case 3: input 1 for >2 cycles 
				  repeat(2) @(posedge clk); 
  $stop; // End the simulation.  
 end

endmodule 
