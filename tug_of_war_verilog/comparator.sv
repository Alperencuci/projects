module comparator(n1, n2, out);
	input logic	[9:0] n1,n2;
	output logic out; 

	assign out = (n1 > n2);

endmodule 	

module comparator_testbench();  
	logic [9:0] n1,n2;
	logic out;
 comparator dut (n1,n2,out);  
  
 // Test the design. 
 initial begin   
	n1 = 0001001001; #10;
	n2 = 0000011111; #10;
	n1 = 0000000000; #10;
	n2 = 0000000001; #10;
	n1 = 1000011111; #10;
 end
endmodule 
