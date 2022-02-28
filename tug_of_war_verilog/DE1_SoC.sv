// Top-level module that defines the I/Os for the DE-1 SoC board   
  
module DE1_SoC (CLOCK_50, HEX0, HEX1, HEX2, HEX3, HEX4, HEX5, KEY, LEDR, SW);   
 input  logic         CLOCK_50; // 50MHz clock.  
 output logic  [6:0]  HEX0, HEX1, HEX2, HEX3, HEX4, HEX5;    
 output logic  [9:0]  LEDR;    
 input  logic  [3:0]  KEY; // True when not pressed, False when pressed  
 input  logic  [9:0]  SW;      
  
  // Default values, turns off the HEX displays  
 //assign HEX0 = 7'b1111111;   
 assign HEX1 = 7'b1111111;   
 assign HEX2 = 7'b1111111;   
 assign HEX3 = 7'b1111111;   
 assign HEX4 = 7'b1111111;   

  
 // Generate clk off of CLOCK_50, whichClock picks rate.
  
 logic reset; 
 logic [31:0] div_clk;  
  
 
 parameter whichClock = 15; // 0.75 Hz clock 
 clock_divider cdiv (.clock(CLOCK_50), .reset(reset), .divided_clocks(div_clk));   
  
 //  Clock  selection;  allows  for  easy  switching  between  simulation  and  board clocks 
 logic clkSelect; 
 // Uncomment ONE of the following two lines depending on intention 
  
//assign clkSelect = CLOCK_50;          // for simulation 
assign clkSelect = div_clk[whichClock]; // for board 
 
// play game 
logic d1,q1,d2,q2,d3,q3,d4,q4, cyber_player, victory_left, victory_right;

assign reset = (SW[9]||(victory_left||victory_right)); 

logic [9:0] random_number;
logic [9:0] temp;
assign temp[8:0] = SW[8:0];
assign temp[9] = 0;
LFSR r (.clk(clkSelect), .reset, .out(random_number));
comparator c (.n1(random_number), .n2(temp), .out(cyber_player));
assign d1 = ~KEY[0];
//assign q1 = d2;
assign d3 = cyber_player;
//assign q3 = d4;


 // 2x2 DFFs  
 always_ff @(posedge clkSelect) begin 
	if (reset) 
		q1 <= 0;	
	else
		q1 <= d1;
 end  

 always_ff @(posedge clkSelect) begin 
	if (reset)
		q2 <= 0;
	else
		q2 <= q1;
 end 
 
 
 //new
 always_ff @(posedge clkSelect) begin 
	if (reset)
		d2 <= 0;
	else
		d2 <= q2;
 end 
 
 always_ff @(posedge clkSelect) begin 
	if (reset)
		q3 <= 0;	
	else
		q3 <= d3;
 end 
 
 always_ff @(posedge clkSelect) begin 
	if (reset)
		q4 <= 0;	
	else
		q4 <= q3;
 end 
 // new
 always_ff @(posedge clkSelect) begin 
	if (reset)
		d4 <= 0;
	else
		d4 <= q4;
 end 

 logic left_key,right_key;
 
 assign right_key = (~d2&q2);
 assign left_key  = (~d4&q4);
 assign victory_left = LEDR[9]&left_key;
 assign victory_right = LEDR[1]&right_key;
logic [2:0] player1; // = 3'b000;
logic [2:0] player2; // = 3'b000;

centerLight mid (.Clock(clkSelect), .Reset(reset), .L(left_key), .R(right_key), .NL(LEDR[7]), .NR(LEDR[3]), .out(LEDR[6:4])); 
normalLight left (.Clock(clkSelect), .Reset(reset), .L(left_key), .R(right_key), .NL(victory1), .NR(LEDR[6]), .out(LEDR[9:7])); 
normalLight right (.Clock(clkSelect), .Reset(reset), .L(left_key), .R(right_key), .NL(LEDR[4]), .NR(victory2), .out(LEDR[3:1])); 

count cnt1(.player(player1), .victory(victory_right), .reset(SW[9]), .Clock(clkSelect));
count cnt2(.player(player2), .victory(victory_left), .reset(SW[9]), .Clock(clkSelect));


winner w1(.counter(player1),.HEX(HEX0));
winner w2(.counter(player2),.HEX(HEX5));

endmodule


module DE1_SoC_testbench();  
  logic         CLOCK_50;   
  logic  [6:0]  HEX0, HEX1, HEX2, HEX3, HEX4, HEX5;    
  logic  [9:0]  LEDR;     
  logic  [3:0]  KEY; 
  logic  [9:0]  SW;  
  logic  [2:0] player1, player2;
  
 DE1_SoC dut (CLOCK_50, HEX0, HEX1, HEX2, HEX3, HEX4, HEX5, KEY, LEDR, SW);  
   
 // Set up a simulated clock.   
 parameter CLOCK_PERIOD=100;  
 initial begin   
  CLOCK_50 <= 0;  
  forever #(CLOCK_PERIOD/2) CLOCK_50 <= ~CLOCK_50; // Forever toggle the clock 
 end  
   
 // Test the design. 
 initial begin   
      repeat(1) @(posedge CLOCK_50);  
  SW[9]  <= 0; repeat(2) @(posedge CLOCK_50); // Always reset FSMs at start  
  SW[9]  <= 1; repeat(5) @(posedge CLOCK_50); 
  SW[9]  <= 0; repeat(3) @(posedge CLOCK_50); 
  player1<= 3'b000; repeat(1) @(posedge CLOCK_50); 
  player2<= 3'b000; repeat(1) @(posedge CLOCK_50); 
  SW[8]  <= 1; repeat(1) @(posedge CLOCK_50); 
  SW[7]  <= 1; repeat(1) @(posedge CLOCK_50); 
  SW[6]  <= 1; repeat(1) @(posedge CLOCK_50); // Test case 1: input is 0  
  SW[5]  <= 0; repeat(1) @(posedge CLOCK_50); // Test case 2: input 1 for 1 cycle 
  SW[4]  <= 1; repeat(1) @(posedge CLOCK_50);  
  SW[3]  <= 0; repeat(1) @(posedge CLOCK_50); // Test case 3: input 1 for >2 cycles 
  SW[2]  <= 1; repeat(1) @(posedge CLOCK_50); 
  SW[1]  <= 0; repeat(1) @(posedge CLOCK_50); 
  SW[0]  <= 1; repeat(1) @(posedge CLOCK_50); 
  KEY[0] <= 1; repeat(200) @(posedge CLOCK_50);
  /*KEY[0] <= 1; repeat(1) @(posedge CLOCK_50); 
  KEY[0] <= 0; repeat(1) @(posedge CLOCK_50);
  KEY[0] <= 1; repeat(1) @(posedge CLOCK_50); 
  KEY[0] <= 0; repeat(1) @(posedge CLOCK_50);
  //KEY[0] <= 1; repeat(1) @(posedge CLOCK_50); 
  //KEY[0] <= 0; repeat(1) @(posedge CLOCK_50);
  KEY[3] <= 1; repeat(15) @(posedge CLOCK_50); 
  //KEY[0] <= 0; repeat(1) @(posedge CLOCK_50);*/
  $stop; // End the simulation.  
 end
endmodule  
 