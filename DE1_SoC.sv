// Top-level module that defines the I/Os for the DE-1 SoC board
module DE1_SoC (HEX0, HEX1, HEX2, HEX3, HEX4, HEX5, KEY, SW, LEDR, GPIO_1, CLOCK_50);
    output logic [6:0]  HEX0, HEX1, HEX2, HEX3, HEX4, HEX5;
	 output logic [9:0]  LEDR;
    input  logic [3:0]  KEY;
    input  logic [9:0]  SW;
    output logic [35:0] GPIO_1;
    input logic CLOCK_50;

	 // Turn off HEX displays
    //assign HEX0 = '1;
    assign HEX1 = '1;
    assign HEX2 = '1;
    assign HEX3 = '1;
    assign HEX4 = '1;
    assign HEX5 = '1;
	 
	 
	 /* Set up system base clock to 1526 Hz (50 MHz / 2**(14+1))
	    ===========================================================*/
	 logic [31:0] clk;
	 logic clkSelect,clkSelect2;
	 
	 clock_divider divider (.clock(CLOCK_50), .divided_clocks(clk));
	 
	 assign clkSelect = clk[12]; // 1526 Hz clock signal	 
	 assign clkSelect2 = clk[20];
	 /* If you notice flickering, set SYSTEM_CLOCK faster.
	    However, this may reduce the brightness of the LED board. */
	
	 
	 /* Set up LED board driver
	    ================================================================== */
	 logic [15:0][15:0]RedPixels; // 16 x 16 array representing red LEDs
    logic [15:0][15:0]GrnPixels; // 16 x 16 array representing green LEDs
	 logic RST;                   // reset - toggle this on startup
	 
	 //assign RST = ~KEY[2];
	 
	 /* Standard LED Driver instantiation - set once and 'forget it'. 
	    See LEDDriver.sv for more info. Do not modify unless you know what you are doing! */
	 LEDDriver Driver (.CLK(clkSelect), .RST, .EnableCount(1'b1), .RedPixels, .GrnPixels, .GPIO_1);
	 
	 logic RK, LK, key;
	 
	 /*double_DFF dff1(.key(~KEY[0]),.reset(~KEY[2]),.clock(clock),.out(RK));
	 double_DFF dff2(.key(~KEY[1]),.reset(~KEY[2]),.clock(clock),.out(key));
	 double_DFF dff3(.key(~KEY[3]),.reset(~KEY[2]),.clock(clock),.out(LK));
	 */
	 
logic d1, q1, q2, d3, q3, q4, d5, q5, q6, reset;

assign reset = ~KEY[2]; 

assign d1 = ~KEY[0];

assign d3 = ~KEY[3];

assign d5 = ~KEY[1];

 // 2x2 DFFs  
 always_ff @(posedge clkSelect2) begin 
	if (reset) 
		q1 <= 0;	
	else
		q1 <= d1;
 end  

 always_ff @(posedge clkSelect2) begin 
	if (reset)
		q2 <= 0;
	else
		q2 <= q1;
 end 
 
 always_ff @(posedge clkSelect2) begin 
	if (reset)
		q3 <= 0;	
	else
		q3 <= d3;
 end 
 
 always_ff @(posedge clkSelect2) begin 
	if (reset)
		q4 <= 0;	
	else
		q4 <= q3;
 end 

 always_ff @(posedge clkSelect2) begin 
	if (reset)
		q5 <= 0;	
	else
		q5 <= d5;
 end 
 
 always_ff @(posedge clkSelect2) begin 
	if (reset)
		q6 <= 0;	
	else
		q6 <= q5;
 end 
 
 
 logic left_key,right_key, enter;
// 
assign right_key = ((q1) & (~q2));
assign left_key  = ((q3) & (~q4));
assign enter     = ((q5) & (~q6));
	 
	 
	 
	 
	 
	 
	 /* LED board test submodule - paints the board with a static pattern.
	    Replace with your own code driving RedPixels and GrnPixels.
		 
	 	 KEY0      : Reset
		 =================================================================== */
	 LED_test test (.reset, .RedPixels, .GrnPixels, .RK(right_key), .LK(left_key), .key(enter), .CLK(clkSelect2), .HEX0);
	 
endmodule
