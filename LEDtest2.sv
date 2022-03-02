module LED_test2(reset, RedPixels, GrnPixels, RK, LK, key, clock);
    input logic               RK, LK, key, reset, clock;
    output logic [15:0][15:0] RedPixels; // 16x16 array of red LEDs
    output logic [15:0][15:0] GrnPixels; // 16x16 array of green LEDs
	 /*
	 logic [1:0] turn;
	counter(.key, .out(turn), .clock, .reset);
	
	firstLight top1(.key, .RK, .LK, .RL({GrnPixels[00][14],RedPixels[00][14]}), .light({GrnPixels[00][15],RedPixels[00][15]}), .clock, .reset);
	genvar i;
	generate
		for(i=1; i<15; i++) begin : lights
			topLight row1 (.key, .RK, .LK, .RL({GrnPixels[00][14-i],RedPixels[00][14-i]}), .light({GrnPixels[00][15-i], RedPixels[00][15-i]}), .LL({GrnPixels[00][16-i],RedPixels[00][16-i]}));
			end
	endgenerate
	
	lastLight  top16( .key, .RK, .LK, 															.LL({GrnPixels[00][1],RedPixels[00][1]}), .light({GrnPixels[00][0],RedPixels[00][0]}), .clock, .reset);
*/
	endmodule


/*module LED_test2_testbench();

	logic RST;
	//logic [15:0][15:0] RedPixels, GrnPixels;
	
	LED_test dut (.RST, .RedPixels, .GrnPixels);
	
	initial begin
	RST = 1'b1; #10;
	RST = 1'b0; #10;
	end
	
endmodule*/