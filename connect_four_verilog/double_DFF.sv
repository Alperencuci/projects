module double_DFF(key, reset, clock, out);
    input logic key, reset, clock;
	 output logic out;

	 
	 logic d1,q1,q2;
	 
// 2x2 DFFs  
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
		q2 <= q1;
 end 
endmodule


module double_DFF_testbench();
	
endmodule
