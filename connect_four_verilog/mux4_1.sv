module mux4_1(i0,i1,i2,i3,sel0,sel1,out);
	input logic i0,i1,i2,i3,sel0,sel1;
	output logic out;
	
	logic t1,t2;
	mux2_1 mux1(.i0(i0), .i1(i1), .sel(sel1), .out(t1));
	mux2_1 mux2(.i0(i2), .i1(i3), .sel(sel1), .out(t2));
	mux2_1 mux3(.i0(t1), .i1(t2), .sel(sel0), .out(out));
    

endmodule


module mux4_1_testbench();
	logic i0, i1, i2, i3, sel0, sel1;             
	logic out;         
	
	mux4_1 dut (.out, .i0, .i1, .i2, .i3, .sel0, .sel1);         
	
	initial begin                        
		sel0=0; sel1=0; i0=0; i1=0; i2=0; i3=0; #10;
		sel0=0; sel1=1; i0=0; i1=0; i2=0; i3=1; #10;
		sel0=1; sel1=0; i0=0; i1=0; i2=1; i3=0; #10;
		sel0=1; sel1=1; i0=0; i1=0; i2=1; i3=1; #10;	
		sel0=0; sel1=0; i0=0; i1=1; i2=0; i3=0; #10;
		sel0=0; sel1=1; i0=0; i1=1; i2=0; i3=1; #10;
		sel0=1; sel1=0; i0=0; i1=1; i2=1; i3=0; #10;
		sel0=1; sel1=1; i0=0; i1=1; i2=1; i3=1; #10;	
		sel0=0; sel1=0; i0=1; i1=0; i2=0; i3=0; #10;
		sel0=0; sel1=1; i0=1; i1=0; i2=0; i3=1; #10;
		sel0=1; sel1=0; i0=1; i1=0; i2=1; i3=0; #10;
		sel0=1; sel1=1; i0=1; i1=0; i2=1; i3=1; #10;	
		sel0=0; sel1=0; i0=1; i1=1; i2=0; i3=0; #10;
		sel0=0; sel1=1; i0=1; i1=1; i2=0; i3=1; #10;
		sel0=1; sel1=0; i0=1; i1=1; i2=1; i3=0; #10;
		sel0=1; sel1=1; i0=1; i1=1; i2=1; i3=1; #10;	
	end   
endmodule
