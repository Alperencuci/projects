module LED_test(reset, RedPixels, GrnPixels, RK, LK, key, CLK, HEX0);
    input logic               RK, LK, key, reset, CLK;
    output logic [15:0][15:0] RedPixels; // 16x16 array of red LEDs
    output logic [15:0][15:0] GrnPixels; // 16x16 array of green LEDs
	 output logic [6:0] HEX0;
	 logic clock, load;
	 logic [1:0] turn;
	 logic [31:0]clk;
	counter c(.key, .out(turn), .clock(CLK), .reset);
	clock_divider divider2 (.clock(CLK), .divided_clocks(clk));
	assign clock = CLK;
	delay16 d(.signal(key), .reset, .clock, .out(load));
	//assign load = clk[4];
	 //row 1
	 firstLight top1(.key, .RK, .LK, .RL({GrnPixels[00][14],RedPixels[00][14]}), 	.turn,												  .light({GrnPixels[00][15],RedPixels[00][15]}), .clock, .reset);
	 top_Light  top2( .key, .RK, .LK, .RL({GrnPixels[00][13],RedPixels[00][13]}), .LL({GrnPixels[00][15],RedPixels[00][15]}), .light({GrnPixels[00][14],RedPixels[00][14]}), .clock, .reset); 
	 top_Light  top3( .key, .RK, .LK, .RL({GrnPixels[00][12],RedPixels[00][12]}), .LL({GrnPixels[00][14],RedPixels[00][14]}), .light({GrnPixels[00][13],RedPixels[00][13]}), .clock, .reset);
	 top_Light  top4( .key, .RK, .LK, .RL({GrnPixels[00][11],RedPixels[00][11]}), .LL({GrnPixels[00][13],RedPixels[00][13]}), .light({GrnPixels[00][12],RedPixels[00][12]}), .clock, .reset);
	 top_Light  top5( .key, .RK, .LK, .RL({GrnPixels[00][10],RedPixels[00][10]}), .LL({GrnPixels[00][12],RedPixels[00][12]}), .light({GrnPixels[00][11],RedPixels[00][11]}), .clock, .reset);
	 top_Light  top6( .key, .RK, .LK, .RL({GrnPixels[00][9],RedPixels[00][9]}), .LL({GrnPixels[00][11],RedPixels[00][11]}), .light({GrnPixels[00][10],RedPixels[00][10]}), .clock, .reset);
	 top_Light  top7( .key, .RK, .LK, .RL({GrnPixels[00][8],RedPixels[00][8]}), .LL({GrnPixels[00][10],RedPixels[00][10]}), .light({GrnPixels[00][9],RedPixels[00][9]}), .clock, .reset);
	 top_Light  top8( .key, .RK, .LK, .RL({GrnPixels[00][7],RedPixels[00][7]}), .LL({GrnPixels[00][9],RedPixels[00][9]}), .light({GrnPixels[00][8],RedPixels[00][8]}), .clock, .reset);
	 top_Light  top9( .key, .RK, .LK, .RL({GrnPixels[00][6],RedPixels[00][6]}), .LL({GrnPixels[00][8],RedPixels[00][8]}), .light({GrnPixels[00][7],RedPixels[00][7]}), .clock, .reset);
	 top_Light  top10( .key, .RK, .LK, .RL({GrnPixels[00][5],RedPixels[00][5]}), .LL({GrnPixels[00][7],RedPixels[00][7]}), .light({GrnPixels[00][6],RedPixels[00][6]}), .clock, .reset);
	 top_Light  top11( .key, .RK, .LK, .RL({GrnPixels[00][4],RedPixels[00][4]}), .LL({GrnPixels[00][6],RedPixels[00][6]}), .light({GrnPixels[00][5],RedPixels[00][5]}), .clock, .reset);
	 top_Light  top12( .key, .RK, .LK, .RL({GrnPixels[00][3],RedPixels[00][3]}), .LL({GrnPixels[00][5],RedPixels[00][5]}), .light({GrnPixels[00][4],RedPixels[00][4]}), .clock, .reset);
	 top_Light  top13( .key, .RK, .LK, .RL({GrnPixels[00][2],RedPixels[00][2]}), .LL({GrnPixels[00][4],RedPixels[00][4]}), .light({GrnPixels[00][3],RedPixels[00][3]}), .clock, .reset);
	 top_Light  top14( .key, .RK, .LK, .RL({GrnPixels[00][1],RedPixels[00][1]}), .LL({GrnPixels[00][3],RedPixels[00][3]}), .light({GrnPixels[00][2],RedPixels[00][2]}), .clock, .reset);
	 top_Light  top15( .key, .RK, .LK, .RL({GrnPixels[00][0],RedPixels[00][0]}), .LL({GrnPixels[00][2],RedPixels[00][2]}), .light({GrnPixels[00][1],RedPixels[00][1]}), .clock, .reset);
	 lastLight  top16( .key, .RK, .LK, 															.LL({GrnPixels[00][1],RedPixels[00][1]}), .light({GrnPixels[00][0],RedPixels[00][0]}), .clock, .reset);

	 //row 2
	 
	 second_row_Light second1(.key, .up({GrnPixels[00][15],RedPixels[00][15]}), .down({GrnPixels[02][15],RedPixels[02][15]}), .light({GrnPixels[01][15],RedPixels[01][15]}), .clock, .reset);
	 second_row_Light second2(.key, .up({GrnPixels[00][14],RedPixels[00][14]}), .down({GrnPixels[02][14],RedPixels[02][14]}), .light({GrnPixels[01][14],RedPixels[01][14]}), .clock, .reset);
	 second_row_Light second3(.key, .up({GrnPixels[00][13],RedPixels[00][13]}), .down({GrnPixels[02][13],RedPixels[02][13]}), .light({GrnPixels[01][13],RedPixels[01][13]}), .clock, .reset);
	 second_row_Light second4(.key, .up({GrnPixels[00][12],RedPixels[00][12]}), .down({GrnPixels[02][12],RedPixels[02][12]}), .light({GrnPixels[01][12],RedPixels[01][12]}), .clock, .reset);
	 second_row_Light second5(.key, .up({GrnPixels[00][11],RedPixels[00][11]}), .down({GrnPixels[02][11],RedPixels[02][11]}), .light({GrnPixels[01][11],RedPixels[01][11]}), .clock, .reset);
	 second_row_Light second6(.key, .up({GrnPixels[00][10],RedPixels[00][10]}), .down({GrnPixels[02][10],RedPixels[02][10]}), .light({GrnPixels[01][10],RedPixels[01][10]}), .clock, .reset);
	 second_row_Light second7(.key, .up({GrnPixels[00][9],RedPixels[00][9]}), .down({GrnPixels[02][9],RedPixels[02][9]}), .light({GrnPixels[01][9],RedPixels[01][9]}), .clock, .reset);
	 second_row_Light second8(.key, .up({GrnPixels[00][8],RedPixels[00][8]}), .down({GrnPixels[02][8],RedPixels[02][8]}), .light({GrnPixels[01][8],RedPixels[01][8]}), .clock, .reset);
	 second_row_Light second9(.key, .up({GrnPixels[00][7],RedPixels[00][7]}), .down({GrnPixels[02][7],RedPixels[02][7]}), .light({GrnPixels[01][7],RedPixels[01][7]}), .clock, .reset);
	 second_row_Light second10(.key, .up({GrnPixels[00][6],RedPixels[00][6]}), .down({GrnPixels[02][6],RedPixels[02][6]}), .light({GrnPixels[01][6],RedPixels[01][6]}), .clock, .reset);
	 second_row_Light second11(.key, .up({GrnPixels[00][5],RedPixels[00][5]}), .down({GrnPixels[02][5],RedPixels[02][5]}), .light({GrnPixels[01][5],RedPixels[01][5]}), .clock, .reset);
	 second_row_Light second12(.key, .up({GrnPixels[00][4],RedPixels[00][4]}), .down({GrnPixels[02][4],RedPixels[02][4]}), .light({GrnPixels[01][4],RedPixels[01][4]}), .clock, .reset);
	 second_row_Light second13(.key, .up({GrnPixels[00][3],RedPixels[00][3]}), .down({GrnPixels[02][3],RedPixels[02][3]}), .light({GrnPixels[01][3],RedPixels[01][3]}), .clock, .reset);
	 second_row_Light second14(.key, .up({GrnPixels[00][2],RedPixels[00][2]}), .down({GrnPixels[02][2],RedPixels[02][2]}), .light({GrnPixels[01][2],RedPixels[01][2]}), .clock, .reset);
	 second_row_Light second15(.key, .up({GrnPixels[00][1],RedPixels[00][1]}), .down({GrnPixels[02][1],RedPixels[02][1]}), .light({GrnPixels[01][1],RedPixels[01][1]}), .clock, .reset);
	 second_row_Light second16(.key, .up({GrnPixels[00][0],RedPixels[00][0]}), .down({GrnPixels[02][0],RedPixels[02][0]}), .light({GrnPixels[01][0],RedPixels[01][0]}), .clock, .reset);
	 
	 //row 3
	 
	 normal_Light third01(.up({GrnPixels[01][15],RedPixels[01][15]}), .down({GrnPixels[03][15],RedPixels[03][15]}), .light({GrnPixels[02][15],RedPixels[02][15]}), .clock, .reset);
	 normal_Light third02(.up({GrnPixels[01][14],RedPixels[01][14]}), .down({GrnPixels[03][14],RedPixels[03][14]}), .light({GrnPixels[02][14],RedPixels[02][14]}), .clock, .reset);
	 normal_Light third03(.up({GrnPixels[01][13],RedPixels[01][13]}), .down({GrnPixels[03][13],RedPixels[03][13]}), .light({GrnPixels[02][13],RedPixels[02][13]}), .clock, .reset);
	 normal_Light third04(.up({GrnPixels[01][12],RedPixels[01][12]}), .down({GrnPixels[03][12],RedPixels[03][12]}), .light({GrnPixels[02][12],RedPixels[02][12]}), .clock, .reset);
	 normal_Light third05(.up({GrnPixels[01][11],RedPixels[01][11]}), .down({GrnPixels[03][11],RedPixels[03][11]}), .light({GrnPixels[02][11],RedPixels[02][11]}), .clock, .reset);
	 normal_Light third06(.up({GrnPixels[01][10],RedPixels[01][10]}), .down({GrnPixels[03][10],RedPixels[03][10]}), .light({GrnPixels[02][10],RedPixels[02][10]}), .clock, .reset);
	 normal_Light third07(.up({GrnPixels[01][09],RedPixels[01][09]}), .down({GrnPixels[03][09],RedPixels[03][09]}), .light({GrnPixels[02][09],RedPixels[02][09]}), .clock, .reset);
	 normal_Light third08(.up({GrnPixels[01][08],RedPixels[01][08]}), .down({GrnPixels[03][08],RedPixels[03][08]}), .light({GrnPixels[02][08],RedPixels[02][08]}), .clock, .reset);
	 normal_Light third09(.up({GrnPixels[01][07],RedPixels[01][07]}), .down({GrnPixels[03][07],RedPixels[03][07]}), .light({GrnPixels[02][07],RedPixels[02][07]}), .clock, .reset);
	 normal_Light third10(.up({GrnPixels[01][06],RedPixels[01][06]}), .down({GrnPixels[03][06],RedPixels[03][06]}), .light({GrnPixels[02][06],RedPixels[02][06]}), .clock, .reset);
	 normal_Light third11(.up({GrnPixels[01][05],RedPixels[01][05]}), .down({GrnPixels[03][05],RedPixels[03][05]}), .light({GrnPixels[02][05],RedPixels[02][05]}), .clock, .reset);
	 normal_Light third12(.up({GrnPixels[01][04],RedPixels[01][04]}), .down({GrnPixels[03][04],RedPixels[03][04]}), .light({GrnPixels[02][04],RedPixels[02][04]}), .clock, .reset);
	 normal_Light third13(.up({GrnPixels[01][03],RedPixels[01][03]}), .down({GrnPixels[03][03],RedPixels[03][03]}), .light({GrnPixels[02][03],RedPixels[02][03]}), .clock, .reset);
	 normal_Light third14(.up({GrnPixels[01][02],RedPixels[01][02]}), .down({GrnPixels[03][02],RedPixels[03][02]}), .light({GrnPixels[02][02],RedPixels[02][02]}), .clock, .reset);
	 normal_Light third15(.up({GrnPixels[01][01],RedPixels[01][01]}), .down({GrnPixels[03][01],RedPixels[03][01]}), .light({GrnPixels[02][01],RedPixels[02][01]}), .clock, .reset);
	 normal_Light third16(.up({GrnPixels[01][00],RedPixels[01][00]}), .down({GrnPixels[03][00],RedPixels[03][00]}), .light({GrnPixels[02][00],RedPixels[02][00]}), .clock, .reset);
	 
	 normal_Light fourth01(.up({GrnPixels[02][15],RedPixels[02][15]}), .down({GrnPixels[04][15],RedPixels[04][15]}), .light({GrnPixels[03][15],RedPixels[03][15]}), .clock, .reset);
	 normal_Light fourth02(.up({GrnPixels[02][14],RedPixels[02][14]}), .down({GrnPixels[04][14],RedPixels[04][14]}), .light({GrnPixels[03][14],RedPixels[03][14]}), .clock, .reset);
	 normal_Light fourth03(.up({GrnPixels[02][13],RedPixels[02][13]}), .down({GrnPixels[04][13],RedPixels[04][13]}), .light({GrnPixels[03][13],RedPixels[03][13]}), .clock, .reset);
	 normal_Light fourth04(.up({GrnPixels[02][12],RedPixels[02][12]}), .down({GrnPixels[04][12],RedPixels[04][12]}), .light({GrnPixels[03][12],RedPixels[03][12]}), .clock, .reset);
	 normal_Light fourth05(.up({GrnPixels[02][11],RedPixels[02][11]}), .down({GrnPixels[04][11],RedPixels[04][11]}), .light({GrnPixels[03][11],RedPixels[03][11]}), .clock, .reset);
	 normal_Light fourth06(.up({GrnPixels[02][10],RedPixels[02][10]}), .down({GrnPixels[04][10],RedPixels[04][10]}), .light({GrnPixels[03][10],RedPixels[03][10]}), .clock, .reset);
	 normal_Light fourth07(.up({GrnPixels[02][09],RedPixels[02][09]}), .down({GrnPixels[04][09],RedPixels[04][09]}), .light({GrnPixels[03][09],RedPixels[03][09]}), .clock, .reset);
	 normal_Light fourth08(.up({GrnPixels[02][08],RedPixels[02][08]}), .down({GrnPixels[04][08],RedPixels[04][08]}), .light({GrnPixels[03][08],RedPixels[03][08]}), .clock, .reset);
	 normal_Light fourth09(.up({GrnPixels[02][07],RedPixels[02][07]}), .down({GrnPixels[04][07],RedPixels[04][07]}), .light({GrnPixels[03][07],RedPixels[03][07]}), .clock, .reset);
	 normal_Light fourth10(.up({GrnPixels[02][06],RedPixels[02][06]}), .down({GrnPixels[04][06],RedPixels[04][06]}), .light({GrnPixels[03][06],RedPixels[03][06]}), .clock, .reset);
	 normal_Light fourth11(.up({GrnPixels[02][05],RedPixels[02][05]}), .down({GrnPixels[04][05],RedPixels[04][05]}), .light({GrnPixels[03][05],RedPixels[03][05]}), .clock, .reset);
	 normal_Light fourth12(.up({GrnPixels[02][04],RedPixels[02][04]}), .down({GrnPixels[04][04],RedPixels[04][04]}), .light({GrnPixels[03][04],RedPixels[03][04]}), .clock, .reset);
	 normal_Light fourth13(.up({GrnPixels[02][03],RedPixels[02][03]}), .down({GrnPixels[04][03],RedPixels[04][03]}), .light({GrnPixels[03][03],RedPixels[03][03]}), .clock, .reset);
	 normal_Light fourth14(.up({GrnPixels[02][02],RedPixels[02][02]}), .down({GrnPixels[04][02],RedPixels[04][02]}), .light({GrnPixels[03][02],RedPixels[03][02]}), .clock, .reset);
	 normal_Light fourth15(.up({GrnPixels[02][01],RedPixels[02][01]}), .down({GrnPixels[04][01],RedPixels[04][01]}), .light({GrnPixels[03][01],RedPixels[03][01]}), .clock, .reset);
	 normal_Light fourth16(.up({GrnPixels[02][00],RedPixels[02][00]}), .down({GrnPixels[04][00],RedPixels[04][00]}), .light({GrnPixels[03][00],RedPixels[03][00]}), .clock, .reset);
	 
	 normal_Light fifth01(.up({GrnPixels[03][15],RedPixels[03][15]}), .down({GrnPixels[05][15],RedPixels[05][15]}), .light({GrnPixels[04][15],RedPixels[04][15]}), .clock, .reset);
	 normal_Light fifth02(.up({GrnPixels[03][14],RedPixels[03][14]}), .down({GrnPixels[05][14],RedPixels[05][14]}), .light({GrnPixels[04][14],RedPixels[04][14]}), .clock, .reset);
	 normal_Light fifth03(.up({GrnPixels[03][13],RedPixels[03][13]}), .down({GrnPixels[05][13],RedPixels[05][13]}), .light({GrnPixels[04][13],RedPixels[04][13]}), .clock, .reset);
	 normal_Light fifth04(.up({GrnPixels[03][12],RedPixels[03][12]}), .down({GrnPixels[05][12],RedPixels[05][12]}), .light({GrnPixels[04][12],RedPixels[04][12]}), .clock, .reset);
	 normal_Light fifth05(.up({GrnPixels[03][11],RedPixels[03][11]}), .down({GrnPixels[05][11],RedPixels[05][11]}), .light({GrnPixels[04][11],RedPixels[04][11]}), .clock, .reset);
	 normal_Light fifth06(.up({GrnPixels[03][10],RedPixels[03][10]}), .down({GrnPixels[05][10],RedPixels[05][10]}), .light({GrnPixels[04][10],RedPixels[04][10]}), .clock, .reset);
	 normal_Light fifth07(.up({GrnPixels[03][09],RedPixels[03][09]}), .down({GrnPixels[05][09],RedPixels[05][09]}), .light({GrnPixels[04][09],RedPixels[04][09]}), .clock, .reset);
	 normal_Light fifth08(.up({GrnPixels[03][08],RedPixels[03][08]}), .down({GrnPixels[05][08],RedPixels[05][08]}), .light({GrnPixels[04][08],RedPixels[04][08]}), .clock, .reset);
	 normal_Light fifth09(.up({GrnPixels[03][07],RedPixels[03][07]}), .down({GrnPixels[05][07],RedPixels[05][07]}), .light({GrnPixels[04][07],RedPixels[04][07]}), .clock, .reset);
	 normal_Light fifth10(.up({GrnPixels[03][06],RedPixels[03][06]}), .down({GrnPixels[05][06],RedPixels[05][06]}), .light({GrnPixels[04][06],RedPixels[04][06]}), .clock, .reset);
	 normal_Light fifth11(.up({GrnPixels[03][05],RedPixels[03][05]}), .down({GrnPixels[05][05],RedPixels[05][05]}), .light({GrnPixels[04][05],RedPixels[04][05]}), .clock, .reset);
	 normal_Light fifth12(.up({GrnPixels[03][04],RedPixels[03][04]}), .down({GrnPixels[05][04],RedPixels[05][04]}), .light({GrnPixels[04][04],RedPixels[04][04]}), .clock, .reset);
	 normal_Light fifth13(.up({GrnPixels[03][03],RedPixels[03][03]}), .down({GrnPixels[05][03],RedPixels[05][03]}), .light({GrnPixels[04][03],RedPixels[04][03]}), .clock, .reset);
	 normal_Light fifth14(.up({GrnPixels[03][02],RedPixels[03][02]}), .down({GrnPixels[05][02],RedPixels[05][02]}), .light({GrnPixels[04][02],RedPixels[04][02]}), .clock, .reset);
	 normal_Light fifth15(.up({GrnPixels[03][01],RedPixels[03][01]}), .down({GrnPixels[05][01],RedPixels[05][01]}), .light({GrnPixels[04][01],RedPixels[04][01]}), .clock, .reset);
	 normal_Light fifth16(.up({GrnPixels[03][00],RedPixels[03][00]}), .down({GrnPixels[05][00],RedPixels[05][00]}), .light({GrnPixels[04][00],RedPixels[04][00]}), .clock, .reset);
	 
	 
	 normal_Light sixth01(.up({GrnPixels[04][15],RedPixels[04][15]}), .down({GrnPixels[06][15],RedPixels[06][15]}), .light({GrnPixels[05][15],RedPixels[05][15]}), .clock, .reset);
	 normal_Light sixth02(.up({GrnPixels[04][14],RedPixels[04][14]}), .down({GrnPixels[06][14],RedPixels[06][14]}), .light({GrnPixels[05][14],RedPixels[05][14]}), .clock, .reset);
	 normal_Light sixth03(.up({GrnPixels[04][13],RedPixels[04][13]}), .down({GrnPixels[06][13],RedPixels[06][13]}), .light({GrnPixels[05][13],RedPixels[05][13]}), .clock, .reset);
	 normal_Light sixth04(.up({GrnPixels[04][12],RedPixels[04][12]}), .down({GrnPixels[06][12],RedPixels[06][12]}), .light({GrnPixels[05][12],RedPixels[05][12]}), .clock, .reset);
	 normal_Light sixth05(.up({GrnPixels[04][11],RedPixels[04][11]}), .down({GrnPixels[06][11],RedPixels[06][11]}), .light({GrnPixels[05][11],RedPixels[05][11]}), .clock, .reset);
	 normal_Light sixth06(.up({GrnPixels[04][10],RedPixels[04][10]}), .down({GrnPixels[06][10],RedPixels[06][10]}), .light({GrnPixels[05][10],RedPixels[05][10]}), .clock, .reset);
	 normal_Light sixth07(.up({GrnPixels[04][09],RedPixels[04][09]}), .down({GrnPixels[06][09],RedPixels[06][09]}), .light({GrnPixels[05][09],RedPixels[05][09]}), .clock, .reset);
	 normal_Light sixth08(.up({GrnPixels[04][08],RedPixels[04][08]}), .down({GrnPixels[06][08],RedPixels[06][08]}), .light({GrnPixels[05][08],RedPixels[05][08]}), .clock, .reset);
	 normal_Light sixth09(.up({GrnPixels[04][07],RedPixels[04][07]}), .down({GrnPixels[06][07],RedPixels[06][07]}), .light({GrnPixels[05][07],RedPixels[05][07]}), .clock, .reset);
	 normal_Light sixth10(.up({GrnPixels[04][06],RedPixels[04][06]}), .down({GrnPixels[06][06],RedPixels[06][06]}), .light({GrnPixels[05][06],RedPixels[05][06]}), .clock, .reset);
	 normal_Light sixth11(.up({GrnPixels[04][05],RedPixels[04][05]}), .down({GrnPixels[06][05],RedPixels[06][05]}), .light({GrnPixels[05][05],RedPixels[05][05]}), .clock, .reset);
	 normal_Light sixth12(.up({GrnPixels[04][04],RedPixels[04][04]}), .down({GrnPixels[06][04],RedPixels[06][04]}), .light({GrnPixels[05][04],RedPixels[05][04]}), .clock, .reset);
	 normal_Light sixth13(.up({GrnPixels[04][03],RedPixels[04][03]}), .down({GrnPixels[06][03],RedPixels[06][03]}), .light({GrnPixels[05][03],RedPixels[05][03]}), .clock, .reset);
	 normal_Light sixth14(.up({GrnPixels[04][02],RedPixels[04][02]}), .down({GrnPixels[06][02],RedPixels[06][02]}), .light({GrnPixels[05][02],RedPixels[05][02]}), .clock, .reset);
	 normal_Light sixth15(.up({GrnPixels[04][01],RedPixels[04][01]}), .down({GrnPixels[06][01],RedPixels[06][01]}), .light({GrnPixels[05][01],RedPixels[05][01]}), .clock, .reset);
	 normal_Light sixth16(.up({GrnPixels[04][00],RedPixels[04][00]}), .down({GrnPixels[06][00],RedPixels[06][00]}), .light({GrnPixels[05][00],RedPixels[05][00]}), .clock, .reset);
	 
	 
	 normal_Light seventh01(.up({GrnPixels[05][15],RedPixels[05][15]}), .down({GrnPixels[07][15],RedPixels[07][15]}), .light({GrnPixels[06][15],RedPixels[06][15]}), .clock, .reset);
	 normal_Light seventh02(.up({GrnPixels[05][14],RedPixels[05][14]}), .down({GrnPixels[07][14],RedPixels[07][14]}), .light({GrnPixels[06][14],RedPixels[06][14]}), .clock, .reset);
	 normal_Light seventh03(.up({GrnPixels[05][13],RedPixels[05][13]}), .down({GrnPixels[07][13],RedPixels[07][13]}), .light({GrnPixels[06][13],RedPixels[06][13]}), .clock, .reset);
	 normal_Light seventh04(.up({GrnPixels[05][12],RedPixels[05][12]}), .down({GrnPixels[07][12],RedPixels[07][12]}), .light({GrnPixels[06][12],RedPixels[06][12]}), .clock, .reset);
	 normal_Light seventh05(.up({GrnPixels[05][11],RedPixels[05][11]}), .down({GrnPixels[07][11],RedPixels[07][11]}), .light({GrnPixels[06][11],RedPixels[06][11]}), .clock, .reset);
	 normal_Light seventh06(.up({GrnPixels[05][10],RedPixels[05][10]}), .down({GrnPixels[07][10],RedPixels[07][10]}), .light({GrnPixels[06][10],RedPixels[06][10]}), .clock, .reset);
	 normal_Light seventh07(.up({GrnPixels[05][09],RedPixels[05][09]}), .down({GrnPixels[07][09],RedPixels[07][09]}), .light({GrnPixels[06][09],RedPixels[06][09]}), .clock, .reset);
	 normal_Light seventh08(.up({GrnPixels[05][08],RedPixels[05][08]}), .down({GrnPixels[07][08],RedPixels[07][08]}), .light({GrnPixels[06][08],RedPixels[06][08]}), .clock, .reset);
	 normal_Light seventh09(.up({GrnPixels[05][07],RedPixels[05][07]}), .down({GrnPixels[07][07],RedPixels[07][07]}), .light({GrnPixels[06][07],RedPixels[06][07]}), .clock, .reset);
	 normal_Light seventh10(.up({GrnPixels[05][06],RedPixels[05][06]}), .down({GrnPixels[07][06],RedPixels[07][06]}), .light({GrnPixels[06][06],RedPixels[06][06]}), .clock, .reset);
	 normal_Light seventh11(.up({GrnPixels[05][05],RedPixels[05][05]}), .down({GrnPixels[07][05],RedPixels[07][05]}), .light({GrnPixels[06][05],RedPixels[06][05]}), .clock, .reset);
	 normal_Light seventh12(.up({GrnPixels[05][04],RedPixels[05][04]}), .down({GrnPixels[07][04],RedPixels[07][04]}), .light({GrnPixels[06][04],RedPixels[06][04]}), .clock, .reset);
	 normal_Light seventh13(.up({GrnPixels[05][03],RedPixels[05][03]}), .down({GrnPixels[07][03],RedPixels[07][03]}), .light({GrnPixels[06][03],RedPixels[06][03]}), .clock, .reset);
	 normal_Light seventh14(.up({GrnPixels[05][02],RedPixels[05][02]}), .down({GrnPixels[07][02],RedPixels[07][02]}), .light({GrnPixels[06][02],RedPixels[06][02]}), .clock, .reset);
	 normal_Light seventh15(.up({GrnPixels[05][01],RedPixels[05][01]}), .down({GrnPixels[07][01],RedPixels[07][01]}), .light({GrnPixels[06][01],RedPixels[06][01]}), .clock, .reset);
	 normal_Light seventh16(.up({GrnPixels[05][00],RedPixels[05][00]}), .down({GrnPixels[07][00],RedPixels[07][00]}), .light({GrnPixels[06][00],RedPixels[06][00]}), .clock, .reset);
	 
	
	 normal_Light eighth01(.up({GrnPixels[06][15],RedPixels[06][15]}), .down({GrnPixels[08][15],RedPixels[08][15]}), .light({GrnPixels[07][15],RedPixels[07][15]}), .clock, .reset);
	 normal_Light eighth02(.up({GrnPixels[06][14],RedPixels[06][14]}), .down({GrnPixels[08][14],RedPixels[08][14]}), .light({GrnPixels[07][14],RedPixels[07][14]}), .clock, .reset);
	 normal_Light eighth03(.up({GrnPixels[06][13],RedPixels[06][13]}), .down({GrnPixels[08][13],RedPixels[08][13]}), .light({GrnPixels[07][13],RedPixels[07][13]}), .clock, .reset);
	 normal_Light eighth04(.up({GrnPixels[06][12],RedPixels[06][12]}), .down({GrnPixels[08][12],RedPixels[08][12]}), .light({GrnPixels[07][12],RedPixels[07][12]}), .clock, .reset);
	 normal_Light eighth05(.up({GrnPixels[06][11],RedPixels[06][11]}), .down({GrnPixels[08][11],RedPixels[08][11]}), .light({GrnPixels[07][11],RedPixels[07][11]}), .clock, .reset);
	 normal_Light eighth06(.up({GrnPixels[06][10],RedPixels[06][10]}), .down({GrnPixels[08][10],RedPixels[08][10]}), .light({GrnPixels[07][10],RedPixels[07][10]}), .clock, .reset);
	 normal_Light eighth07(.up({GrnPixels[06][09],RedPixels[06][09]}), .down({GrnPixels[08][09],RedPixels[08][09]}), .light({GrnPixels[07][09],RedPixels[07][09]}), .clock, .reset);
	 normal_Light eighth08(.up({GrnPixels[06][08],RedPixels[06][08]}), .down({GrnPixels[08][08],RedPixels[08][08]}), .light({GrnPixels[07][08],RedPixels[07][08]}), .clock, .reset);
	 normal_Light eighth09(.up({GrnPixels[06][07],RedPixels[06][07]}), .down({GrnPixels[08][07],RedPixels[08][07]}), .light({GrnPixels[07][07],RedPixels[07][07]}), .clock, .reset);
	 normal_Light eighth10(.up({GrnPixels[06][06],RedPixels[06][06]}), .down({GrnPixels[08][06],RedPixels[08][06]}), .light({GrnPixels[07][06],RedPixels[07][06]}), .clock, .reset);
	 normal_Light eighth11(.up({GrnPixels[06][05],RedPixels[06][05]}), .down({GrnPixels[08][05],RedPixels[08][05]}), .light({GrnPixels[07][05],RedPixels[07][05]}), .clock, .reset);
	 normal_Light eighth12(.up({GrnPixels[06][04],RedPixels[06][04]}), .down({GrnPixels[08][04],RedPixels[08][04]}), .light({GrnPixels[07][04],RedPixels[07][04]}), .clock, .reset);
	 normal_Light eighth13(.up({GrnPixels[06][03],RedPixels[06][03]}), .down({GrnPixels[08][03],RedPixels[08][03]}), .light({GrnPixels[07][03],RedPixels[07][03]}), .clock, .reset);
	 normal_Light eighth14(.up({GrnPixels[06][02],RedPixels[06][02]}), .down({GrnPixels[08][02],RedPixels[08][02]}), .light({GrnPixels[07][02],RedPixels[07][02]}), .clock, .reset);
	 normal_Light eighth15(.up({GrnPixels[06][01],RedPixels[06][01]}), .down({GrnPixels[08][01],RedPixels[08][01]}), .light({GrnPixels[07][01],RedPixels[07][01]}), .clock, .reset);
	 normal_Light eighth16(.up({GrnPixels[06][00],RedPixels[06][00]}), .down({GrnPixels[08][00],RedPixels[08][00]}), .light({GrnPixels[07][00],RedPixels[07][00]}), .clock, .reset);
	 
	 
	 normal_Light ninth01(.up({GrnPixels[07][15],RedPixels[07][15]}), .down({GrnPixels[09][15],RedPixels[09][15]}), .light({GrnPixels[08][15],RedPixels[08][15]}), .clock, .reset);
	 normal_Light ninth02(.up({GrnPixels[07][14],RedPixels[07][14]}), .down({GrnPixels[09][14],RedPixels[09][14]}), .light({GrnPixels[08][14],RedPixels[08][14]}), .clock, .reset);
	 normal_Light ninth03(.up({GrnPixels[07][13],RedPixels[07][13]}), .down({GrnPixels[09][13],RedPixels[09][13]}), .light({GrnPixels[08][13],RedPixels[08][13]}), .clock, .reset);
	 normal_Light ninth04(.up({GrnPixels[07][12],RedPixels[07][12]}), .down({GrnPixels[09][12],RedPixels[09][12]}), .light({GrnPixels[08][12],RedPixels[08][12]}), .clock, .reset);
	 normal_Light ninth05(.up({GrnPixels[07][11],RedPixels[07][11]}), .down({GrnPixels[09][11],RedPixels[09][11]}), .light({GrnPixels[08][11],RedPixels[08][11]}), .clock, .reset);
	 normal_Light ninth06(.up({GrnPixels[07][10],RedPixels[07][10]}), .down({GrnPixels[09][10],RedPixels[09][10]}), .light({GrnPixels[08][10],RedPixels[08][10]}), .clock, .reset);
	 normal_Light ninth07(.up({GrnPixels[07][09],RedPixels[07][09]}), .down({GrnPixels[09][09],RedPixels[09][09]}), .light({GrnPixels[08][09],RedPixels[08][09]}), .clock, .reset);
	 normal_Light ninth08(.up({GrnPixels[07][08],RedPixels[07][08]}), .down({GrnPixels[09][08],RedPixels[09][08]}), .light({GrnPixels[08][08],RedPixels[08][08]}), .clock, .reset);
	 normal_Light ninth09(.up({GrnPixels[07][07],RedPixels[07][07]}), .down({GrnPixels[09][07],RedPixels[09][07]}), .light({GrnPixels[08][07],RedPixels[08][07]}), .clock, .reset);
	 normal_Light ninth10(.up({GrnPixels[07][06],RedPixels[07][06]}), .down({GrnPixels[09][06],RedPixels[09][06]}), .light({GrnPixels[08][06],RedPixels[08][06]}), .clock, .reset);
	 normal_Light ninth11(.up({GrnPixels[07][05],RedPixels[07][05]}), .down({GrnPixels[09][05],RedPixels[09][05]}), .light({GrnPixels[08][05],RedPixels[08][05]}), .clock, .reset);
	 normal_Light ninth12(.up({GrnPixels[07][04],RedPixels[07][04]}), .down({GrnPixels[09][04],RedPixels[09][04]}), .light({GrnPixels[08][04],RedPixels[08][04]}), .clock, .reset);
	 normal_Light ninth13(.up({GrnPixels[07][03],RedPixels[07][03]}), .down({GrnPixels[09][03],RedPixels[09][03]}), .light({GrnPixels[08][03],RedPixels[08][03]}), .clock, .reset);
	 normal_Light ninth14(.up({GrnPixels[07][02],RedPixels[07][02]}), .down({GrnPixels[09][02],RedPixels[09][02]}), .light({GrnPixels[08][02],RedPixels[08][02]}), .clock, .reset);
	 normal_Light ninth15(.up({GrnPixels[07][01],RedPixels[07][01]}), .down({GrnPixels[09][01],RedPixels[09][01]}), .light({GrnPixels[08][01],RedPixels[08][01]}), .clock, .reset);
	 normal_Light ninth16(.up({GrnPixels[07][00],RedPixels[07][00]}), .down({GrnPixels[09][00],RedPixels[09][00]}), .light({GrnPixels[08][00],RedPixels[08][00]}), .clock, .reset);
	 
	 
	 normal_Light tenth01(.up({GrnPixels[08][15],RedPixels[08][15]}), .down({GrnPixels[10][15],RedPixels[10][15]}), .light({GrnPixels[09][15],RedPixels[09][15]}), .clock, .reset);
	 normal_Light tenth02(.up({GrnPixels[08][14],RedPixels[08][14]}), .down({GrnPixels[10][14],RedPixels[10][14]}), .light({GrnPixels[09][14],RedPixels[09][14]}), .clock, .reset);
	 normal_Light tenth03(.up({GrnPixels[08][13],RedPixels[08][13]}), .down({GrnPixels[10][13],RedPixels[10][13]}), .light({GrnPixels[09][13],RedPixels[09][13]}), .clock, .reset);
	 normal_Light tenth04(.up({GrnPixels[08][12],RedPixels[08][12]}), .down({GrnPixels[10][12],RedPixels[10][12]}), .light({GrnPixels[09][12],RedPixels[09][12]}), .clock, .reset);
	 normal_Light tenth05(.up({GrnPixels[08][11],RedPixels[08][11]}), .down({GrnPixels[10][11],RedPixels[10][11]}), .light({GrnPixels[09][11],RedPixels[09][11]}), .clock, .reset);
	 normal_Light tenth06(.up({GrnPixels[08][10],RedPixels[08][10]}), .down({GrnPixels[10][10],RedPixels[10][10]}), .light({GrnPixels[09][10],RedPixels[09][10]}), .clock, .reset);
	 normal_Light tenth07(.up({GrnPixels[08][09],RedPixels[08][09]}), .down({GrnPixels[10][09],RedPixels[10][09]}), .light({GrnPixels[09][09],RedPixels[09][09]}), .clock, .reset);
	 normal_Light tenth08(.up({GrnPixels[08][08],RedPixels[08][08]}), .down({GrnPixels[10][08],RedPixels[10][08]}), .light({GrnPixels[09][08],RedPixels[09][08]}), .clock, .reset);
	 normal_Light tenth09(.up({GrnPixels[08][07],RedPixels[08][07]}), .down({GrnPixels[10][07],RedPixels[10][07]}), .light({GrnPixels[09][07],RedPixels[09][07]}), .clock, .reset);
	 normal_Light tenth10(.up({GrnPixels[08][06],RedPixels[08][06]}), .down({GrnPixels[10][06],RedPixels[10][06]}), .light({GrnPixels[09][06],RedPixels[09][06]}), .clock, .reset);
	 normal_Light tenth11(.up({GrnPixels[08][05],RedPixels[08][05]}), .down({GrnPixels[10][05],RedPixels[10][05]}), .light({GrnPixels[09][05],RedPixels[09][05]}), .clock, .reset);
	 normal_Light tenth12(.up({GrnPixels[08][04],RedPixels[08][04]}), .down({GrnPixels[10][04],RedPixels[10][04]}), .light({GrnPixels[09][04],RedPixels[09][04]}), .clock, .reset);
	 normal_Light tenth13(.up({GrnPixels[08][03],RedPixels[08][03]}), .down({GrnPixels[10][03],RedPixels[10][03]}), .light({GrnPixels[09][03],RedPixels[09][03]}), .clock, .reset);
	 normal_Light tenth14(.up({GrnPixels[08][02],RedPixels[08][02]}), .down({GrnPixels[10][02],RedPixels[10][02]}), .light({GrnPixels[09][02],RedPixels[09][02]}), .clock, .reset);
	 normal_Light tenth15(.up({GrnPixels[08][01],RedPixels[08][01]}), .down({GrnPixels[10][01],RedPixels[10][01]}), .light({GrnPixels[09][01],RedPixels[09][01]}), .clock, .reset);
	 normal_Light tenth16(.up({GrnPixels[08][00],RedPixels[08][00]}), .down({GrnPixels[10][00],RedPixels[10][00]}), .light({GrnPixels[09][00],RedPixels[09][00]}), .clock, .reset);
	 
	 
	 normal_Light eleventh01(.up({GrnPixels[09][15],RedPixels[09][15]}), .down({GrnPixels[11][15],RedPixels[11][15]}), .light({GrnPixels[10][15],RedPixels[10][15]}), .clock, .reset);
	 normal_Light eleventh02(.up({GrnPixels[09][14],RedPixels[09][14]}), .down({GrnPixels[11][14],RedPixels[11][14]}), .light({GrnPixels[10][14],RedPixels[10][14]}), .clock, .reset);
	 normal_Light eleventh03(.up({GrnPixels[09][13],RedPixels[09][13]}), .down({GrnPixels[11][13],RedPixels[11][13]}), .light({GrnPixels[10][13],RedPixels[10][13]}), .clock, .reset);
	 normal_Light eleventh04(.up({GrnPixels[09][12],RedPixels[09][12]}), .down({GrnPixels[11][12],RedPixels[11][12]}), .light({GrnPixels[10][12],RedPixels[10][12]}), .clock, .reset);
	 normal_Light eleventh05(.up({GrnPixels[09][11],RedPixels[09][11]}), .down({GrnPixels[11][11],RedPixels[11][11]}), .light({GrnPixels[10][11],RedPixels[10][11]}), .clock, .reset);
	 normal_Light eleventh06(.up({GrnPixels[09][10],RedPixels[09][10]}), .down({GrnPixels[11][10],RedPixels[11][10]}), .light({GrnPixels[10][10],RedPixels[10][10]}), .clock, .reset);
	 normal_Light eleventh07(.up({GrnPixels[09][09],RedPixels[09][09]}), .down({GrnPixels[11][09],RedPixels[11][09]}), .light({GrnPixels[10][09],RedPixels[10][09]}), .clock, .reset);
	 normal_Light eleventh08(.up({GrnPixels[09][08],RedPixels[09][08]}), .down({GrnPixels[11][08],RedPixels[11][08]}), .light({GrnPixels[10][08],RedPixels[10][08]}), .clock, .reset);
	 normal_Light eleventh09(.up({GrnPixels[09][07],RedPixels[09][07]}), .down({GrnPixels[11][07],RedPixels[11][07]}), .light({GrnPixels[10][07],RedPixels[10][07]}), .clock, .reset);
	 normal_Light eleventh10(.up({GrnPixels[09][06],RedPixels[09][06]}), .down({GrnPixels[11][06],RedPixels[11][06]}), .light({GrnPixels[10][06],RedPixels[10][06]}), .clock, .reset);
	 normal_Light eleventh11(.up({GrnPixels[09][05],RedPixels[09][05]}), .down({GrnPixels[11][05],RedPixels[11][05]}), .light({GrnPixels[10][05],RedPixels[10][05]}), .clock, .reset);
	 normal_Light eleventh12(.up({GrnPixels[09][04],RedPixels[09][04]}), .down({GrnPixels[11][04],RedPixels[11][04]}), .light({GrnPixels[10][04],RedPixels[10][04]}), .clock, .reset);
	 normal_Light eleventh13(.up({GrnPixels[09][03],RedPixels[09][03]}), .down({GrnPixels[11][03],RedPixels[11][03]}), .light({GrnPixels[10][03],RedPixels[10][03]}), .clock, .reset);
	 normal_Light eleventh14(.up({GrnPixels[09][02],RedPixels[09][02]}), .down({GrnPixels[11][02],RedPixels[11][02]}), .light({GrnPixels[10][02],RedPixels[10][02]}), .clock, .reset);
	 normal_Light eleventh15(.up({GrnPixels[09][01],RedPixels[09][01]}), .down({GrnPixels[11][01],RedPixels[11][01]}), .light({GrnPixels[10][01],RedPixels[10][01]}), .clock, .reset);
	 normal_Light eleventh16(.up({GrnPixels[09][00],RedPixels[09][00]}), .down({GrnPixels[11][00],RedPixels[11][00]}), .light({GrnPixels[10][00],RedPixels[10][00]}), .clock, .reset);
	
	 normal_Light twelveth01(.up({GrnPixels[10][15],RedPixels[10][15]}), .down({GrnPixels[12][15],RedPixels[12][15]}), .light({GrnPixels[11][15],RedPixels[11][15]}), .clock, .reset);
	 normal_Light twelveth02(.up({GrnPixels[10][14],RedPixels[10][14]}), .down({GrnPixels[12][14],RedPixels[12][14]}), .light({GrnPixels[11][14],RedPixels[11][14]}), .clock, .reset);
	 normal_Light twelveth03(.up({GrnPixels[10][13],RedPixels[10][13]}), .down({GrnPixels[12][13],RedPixels[12][13]}), .light({GrnPixels[11][13],RedPixels[11][13]}), .clock, .reset);
	 normal_Light twelveth04(.up({GrnPixels[10][12],RedPixels[10][12]}), .down({GrnPixels[12][12],RedPixels[12][12]}), .light({GrnPixels[11][12],RedPixels[11][12]}), .clock, .reset);
	 normal_Light twelveth05(.up({GrnPixels[10][11],RedPixels[10][11]}), .down({GrnPixels[12][11],RedPixels[12][11]}), .light({GrnPixels[11][11],RedPixels[11][11]}), .clock, .reset);
	 normal_Light twelveth06(.up({GrnPixels[10][10],RedPixels[10][10]}), .down({GrnPixels[12][10],RedPixels[12][10]}), .light({GrnPixels[11][10],RedPixels[11][10]}), .clock, .reset);
	 normal_Light twelveth07(.up({GrnPixels[10][09],RedPixels[10][09]}), .down({GrnPixels[12][09],RedPixels[12][09]}), .light({GrnPixels[11][09],RedPixels[11][09]}), .clock, .reset);
	 normal_Light twelveth08(.up({GrnPixels[10][08],RedPixels[10][08]}), .down({GrnPixels[12][08],RedPixels[12][08]}), .light({GrnPixels[11][08],RedPixels[11][08]}), .clock, .reset);
	 normal_Light twelveth09(.up({GrnPixels[10][07],RedPixels[10][07]}), .down({GrnPixels[12][07],RedPixels[12][07]}), .light({GrnPixels[11][07],RedPixels[11][07]}), .clock, .reset);
	 normal_Light twelveth10(.up({GrnPixels[10][06],RedPixels[10][06]}), .down({GrnPixels[12][06],RedPixels[12][06]}), .light({GrnPixels[11][06],RedPixels[11][06]}), .clock, .reset);
	 normal_Light twelveth11(.up({GrnPixels[10][05],RedPixels[10][05]}), .down({GrnPixels[12][05],RedPixels[12][05]}), .light({GrnPixels[11][05],RedPixels[11][05]}), .clock, .reset);
	 normal_Light twelveth12(.up({GrnPixels[10][04],RedPixels[10][04]}), .down({GrnPixels[12][04],RedPixels[12][04]}), .light({GrnPixels[11][04],RedPixels[11][04]}), .clock, .reset);
	 normal_Light twelveth13(.up({GrnPixels[10][03],RedPixels[10][03]}), .down({GrnPixels[12][03],RedPixels[12][03]}), .light({GrnPixels[11][03],RedPixels[11][03]}), .clock, .reset);
	 normal_Light twelveth14(.up({GrnPixels[10][02],RedPixels[10][02]}), .down({GrnPixels[12][02],RedPixels[12][02]}), .light({GrnPixels[11][02],RedPixels[11][02]}), .clock, .reset);
	 normal_Light twelveth15(.up({GrnPixels[10][01],RedPixels[10][01]}), .down({GrnPixels[12][01],RedPixels[12][01]}), .light({GrnPixels[11][01],RedPixels[11][01]}), .clock, .reset);
	 normal_Light twelveth16(.up({GrnPixels[10][00],RedPixels[10][00]}), .down({GrnPixels[12][00],RedPixels[12][00]}), .light({GrnPixels[11][00],RedPixels[11][00]}), .clock, .reset);
	 
	 
	 normal_Light thirteenth01(.up({GrnPixels[11][15],RedPixels[11][15]}), .down({GrnPixels[13][15],RedPixels[13][15]}), .light({GrnPixels[12][15],RedPixels[12][15]}), .clock, .reset);
	 normal_Light thirteenth02(.up({GrnPixels[11][14],RedPixels[11][14]}), .down({GrnPixels[13][14],RedPixels[13][14]}), .light({GrnPixels[12][14],RedPixels[12][14]}), .clock, .reset);
	 normal_Light thirteenth03(.up({GrnPixels[11][13],RedPixels[11][13]}), .down({GrnPixels[13][13],RedPixels[13][13]}), .light({GrnPixels[12][13],RedPixels[12][13]}), .clock, .reset);
	 normal_Light thirteenth04(.up({GrnPixels[11][12],RedPixels[11][12]}), .down({GrnPixels[13][12],RedPixels[13][12]}), .light({GrnPixels[12][12],RedPixels[12][12]}), .clock, .reset);
	 normal_Light thirteenth05(.up({GrnPixels[11][11],RedPixels[11][11]}), .down({GrnPixels[13][11],RedPixels[13][11]}), .light({GrnPixels[12][11],RedPixels[12][11]}), .clock, .reset);
	 normal_Light thirteenth06(.up({GrnPixels[11][10],RedPixels[11][10]}), .down({GrnPixels[13][10],RedPixels[13][10]}), .light({GrnPixels[12][10],RedPixels[12][10]}), .clock, .reset);
	 normal_Light thirteenth07(.up({GrnPixels[11][09],RedPixels[11][09]}), .down({GrnPixels[13][09],RedPixels[13][09]}), .light({GrnPixels[12][09],RedPixels[12][09]}), .clock, .reset);
	 normal_Light thirteenth08(.up({GrnPixels[11][08],RedPixels[11][08]}), .down({GrnPixels[13][08],RedPixels[13][08]}), .light({GrnPixels[12][08],RedPixels[12][08]}), .clock, .reset);
	 normal_Light thirteenth09(.up({GrnPixels[11][07],RedPixels[11][07]}), .down({GrnPixels[13][07],RedPixels[13][07]}), .light({GrnPixels[12][07],RedPixels[12][07]}), .clock, .reset);
	 normal_Light thirteenth10(.up({GrnPixels[11][06],RedPixels[11][06]}), .down({GrnPixels[13][06],RedPixels[13][06]}), .light({GrnPixels[12][06],RedPixels[12][06]}), .clock, .reset);
	 normal_Light thirteenth11(.up({GrnPixels[11][05],RedPixels[11][05]}), .down({GrnPixels[13][05],RedPixels[13][05]}), .light({GrnPixels[12][05],RedPixels[12][05]}), .clock, .reset);
	 normal_Light thirteenth12(.up({GrnPixels[11][04],RedPixels[11][04]}), .down({GrnPixels[13][04],RedPixels[13][04]}), .light({GrnPixels[12][04],RedPixels[12][04]}), .clock, .reset);
	 normal_Light thirteenth13(.up({GrnPixels[11][03],RedPixels[11][03]}), .down({GrnPixels[13][03],RedPixels[13][03]}), .light({GrnPixels[12][03],RedPixels[12][03]}), .clock, .reset);
	 normal_Light thirteenth14(.up({GrnPixels[11][02],RedPixels[11][02]}), .down({GrnPixels[13][02],RedPixels[13][02]}), .light({GrnPixels[12][02],RedPixels[12][02]}), .clock, .reset);
	 normal_Light thirteenth15(.up({GrnPixels[11][01],RedPixels[11][01]}), .down({GrnPixels[13][01],RedPixels[13][01]}), .light({GrnPixels[12][01],RedPixels[12][01]}), .clock, .reset);
	 normal_Light thirteenth16(.up({GrnPixels[11][00],RedPixels[11][00]}), .down({GrnPixels[13][00],RedPixels[13][00]}), .light({GrnPixels[12][00],RedPixels[12][00]}), .clock, .reset);
	 
	 
	 normal_Light fourteenth01(.up({GrnPixels[12][15],RedPixels[12][15]}), .down({GrnPixels[14][15],RedPixels[14][15]}), .light({GrnPixels[13][15],RedPixels[13][15]}), .clock, .reset);
	 normal_Light fourteenth02(.up({GrnPixels[12][14],RedPixels[12][14]}), .down({GrnPixels[14][14],RedPixels[14][14]}), .light({GrnPixels[13][14],RedPixels[13][14]}), .clock, .reset);
	 normal_Light fourteenth03(.up({GrnPixels[12][13],RedPixels[12][13]}), .down({GrnPixels[14][13],RedPixels[14][13]}), .light({GrnPixels[13][13],RedPixels[13][13]}), .clock, .reset);
	 normal_Light fourteenth04(.up({GrnPixels[12][12],RedPixels[12][12]}), .down({GrnPixels[14][12],RedPixels[14][12]}), .light({GrnPixels[13][12],RedPixels[13][12]}), .clock, .reset);
	 normal_Light fourteenth05(.up({GrnPixels[12][11],RedPixels[12][11]}), .down({GrnPixels[14][11],RedPixels[14][11]}), .light({GrnPixels[13][11],RedPixels[13][11]}), .clock, .reset);
	 normal_Light fourteenth06(.up({GrnPixels[12][10],RedPixels[12][10]}), .down({GrnPixels[14][10],RedPixels[14][10]}), .light({GrnPixels[13][10],RedPixels[13][10]}), .clock, .reset);
	 normal_Light fourteenth07(.up({GrnPixels[12][09],RedPixels[12][09]}), .down({GrnPixels[14][09],RedPixels[14][09]}), .light({GrnPixels[13][09],RedPixels[13][09]}), .clock, .reset);
	 normal_Light fourteenth08(.up({GrnPixels[12][08],RedPixels[12][08]}), .down({GrnPixels[14][08],RedPixels[14][08]}), .light({GrnPixels[13][08],RedPixels[13][08]}), .clock, .reset);
	 normal_Light fourteenth09(.up({GrnPixels[12][07],RedPixels[12][07]}), .down({GrnPixels[14][07],RedPixels[14][07]}), .light({GrnPixels[13][07],RedPixels[13][07]}), .clock, .reset);
	 normal_Light fourteenth10(.up({GrnPixels[12][06],RedPixels[12][06]}), .down({GrnPixels[14][06],RedPixels[14][06]}), .light({GrnPixels[13][06],RedPixels[13][06]}), .clock, .reset);
	 normal_Light fourteenth11(.up({GrnPixels[12][05],RedPixels[12][05]}), .down({GrnPixels[14][05],RedPixels[14][05]}), .light({GrnPixels[13][05],RedPixels[13][05]}), .clock, .reset);
	 normal_Light fourteenth12(.up({GrnPixels[12][04],RedPixels[12][04]}), .down({GrnPixels[14][04],RedPixels[14][04]}), .light({GrnPixels[13][04],RedPixels[13][04]}), .clock, .reset);
	 normal_Light fourteenth13(.up({GrnPixels[12][03],RedPixels[12][03]}), .down({GrnPixels[14][03],RedPixels[14][03]}), .light({GrnPixels[13][03],RedPixels[13][03]}), .clock, .reset);
	 normal_Light fourteenth14(.up({GrnPixels[12][02],RedPixels[12][02]}), .down({GrnPixels[14][02],RedPixels[14][02]}), .light({GrnPixels[13][02],RedPixels[13][02]}), .clock, .reset);
	 normal_Light fourteenth15(.up({GrnPixels[12][01],RedPixels[12][01]}), .down({GrnPixels[14][01],RedPixels[14][01]}), .light({GrnPixels[13][01],RedPixels[13][01]}), .clock, .reset);
	 normal_Light fourteenth16(.up({GrnPixels[12][00],RedPixels[12][00]}), .down({GrnPixels[14][00],RedPixels[14][00]}), .light({GrnPixels[13][00],RedPixels[13][00]}), .clock, .reset);
	
	
	 normal_Light fifteenth01(.up({GrnPixels[13][15],RedPixels[13][15]}), .down({GrnPixels[15][15],RedPixels[15][15]}), .light({GrnPixels[14][15],RedPixels[14][15]}), .clock, .reset);
	 normal_Light fifteenth02(.up({GrnPixels[13][14],RedPixels[13][14]}), .down({GrnPixels[15][14],RedPixels[15][14]}), .light({GrnPixels[14][14],RedPixels[14][14]}), .clock, .reset);
	 normal_Light fifteenth03(.up({GrnPixels[13][13],RedPixels[13][13]}), .down({GrnPixels[15][13],RedPixels[15][13]}), .light({GrnPixels[14][13],RedPixels[14][13]}), .clock, .reset);
	 normal_Light fifteenth04(.up({GrnPixels[13][12],RedPixels[13][12]}), .down({GrnPixels[15][12],RedPixels[15][12]}), .light({GrnPixels[14][12],RedPixels[14][12]}), .clock, .reset);
	 normal_Light fifteenth05(.up({GrnPixels[13][11],RedPixels[13][11]}), .down({GrnPixels[15][11],RedPixels[15][11]}), .light({GrnPixels[14][11],RedPixels[14][11]}), .clock, .reset);
	 normal_Light fifteenth06(.up({GrnPixels[13][10],RedPixels[13][10]}), .down({GrnPixels[15][10],RedPixels[15][10]}), .light({GrnPixels[14][10],RedPixels[14][10]}), .clock, .reset);
	 normal_Light fifteenth07(.up({GrnPixels[13][09],RedPixels[13][09]}), .down({GrnPixels[15][09],RedPixels[15][09]}), .light({GrnPixels[14][09],RedPixels[14][09]}), .clock, .reset);
	 normal_Light fifteenth08(.up({GrnPixels[13][08],RedPixels[13][08]}), .down({GrnPixels[15][08],RedPixels[15][08]}), .light({GrnPixels[14][08],RedPixels[14][08]}), .clock, .reset);
	 normal_Light fifteenth09(.up({GrnPixels[13][07],RedPixels[13][07]}), .down({GrnPixels[15][07],RedPixels[15][07]}), .light({GrnPixels[14][07],RedPixels[14][07]}), .clock, .reset);
	 normal_Light fifteenth10(.up({GrnPixels[13][06],RedPixels[13][06]}), .down({GrnPixels[15][06],RedPixels[15][06]}), .light({GrnPixels[14][06],RedPixels[14][06]}), .clock, .reset);
	 normal_Light fifteenth11(.up({GrnPixels[13][05],RedPixels[13][05]}), .down({GrnPixels[15][05],RedPixels[15][05]}), .light({GrnPixels[14][05],RedPixels[14][05]}), .clock, .reset);
	 normal_Light fifteenth12(.up({GrnPixels[13][04],RedPixels[13][04]}), .down({GrnPixels[15][04],RedPixels[15][04]}), .light({GrnPixels[14][04],RedPixels[14][04]}), .clock, .reset);
	 normal_Light fifteenth13(.up({GrnPixels[13][03],RedPixels[13][03]}), .down({GrnPixels[15][03],RedPixels[15][03]}), .light({GrnPixels[14][03],RedPixels[14][03]}), .clock, .reset);
	 normal_Light fifteenth14(.up({GrnPixels[13][02],RedPixels[13][02]}), .down({GrnPixels[15][02],RedPixels[15][02]}), .light({GrnPixels[14][02],RedPixels[14][02]}), .clock, .reset);
	 normal_Light fifteenth15(.up({GrnPixels[13][01],RedPixels[13][01]}), .down({GrnPixels[15][01],RedPixels[15][01]}), .light({GrnPixels[14][01],RedPixels[14][01]}), .clock, .reset);
	 normal_Light fifteenth16(.up({GrnPixels[13][00],RedPixels[13][00]}), .down({GrnPixels[15][00],RedPixels[15][00]}), .light({GrnPixels[14][00],RedPixels[14][00]}), .clock, .reset);
	
	 bottom_Light sixteenth01(.up({GrnPixels[14][15],RedPixels[14][15]}), .light({GrnPixels[15][15],RedPixels[15][15]}), .clock, .reset);
	 bottom_Light sixteenth02(.up({GrnPixels[14][14],RedPixels[14][14]}), .light({GrnPixels[15][14],RedPixels[15][14]}), .clock, .reset);
	 bottom_Light sixteenth03(.up({GrnPixels[14][13],RedPixels[14][13]}), .light({GrnPixels[15][13],RedPixels[15][13]}), .clock, .reset);
	 bottom_Light sixteenth04(.up({GrnPixels[14][12],RedPixels[14][12]}), .light({GrnPixels[15][12],RedPixels[15][12]}), .clock, .reset);
	 bottom_Light sixteenth05(.up({GrnPixels[14][11],RedPixels[14][11]}), .light({GrnPixels[15][11],RedPixels[15][11]}), .clock, .reset);
	 bottom_Light sixteenth06(.up({GrnPixels[14][10],RedPixels[14][10]}), .light({GrnPixels[15][10],RedPixels[15][10]}), .clock, .reset);
	 bottom_Light sixteenth07(.up({GrnPixels[14][09],RedPixels[14][09]}), .light({GrnPixels[15][09],RedPixels[15][09]}), .clock, .reset);
	 bottom_Light sixteenth08(.up({GrnPixels[14][08],RedPixels[14][08]}), .light({GrnPixels[15][08],RedPixels[15][08]}), .clock, .reset);
	 bottom_Light sixteenth09(.up({GrnPixels[14][07],RedPixels[14][07]}), .light({GrnPixels[15][07],RedPixels[15][07]}), .clock, .reset);
	 bottom_Light sixteenth10(.up({GrnPixels[14][06],RedPixels[14][06]}), .light({GrnPixels[15][06],RedPixels[15][06]}), .clock, .reset);
	 bottom_Light sixteenth11(.up({GrnPixels[14][05],RedPixels[14][05]}), .light({GrnPixels[15][05],RedPixels[15][05]}), .clock, .reset);
	 bottom_Light sixteenth12(.up({GrnPixels[14][04],RedPixels[14][04]}), .light({GrnPixels[15][04],RedPixels[15][04]}), .clock, .reset);
	 bottom_Light sixteenth13(.up({GrnPixels[14][03],RedPixels[14][03]}), .light({GrnPixels[15][03],RedPixels[15][03]}), .clock, .reset);
	 bottom_Light sixteenth14(.up({GrnPixels[14][02],RedPixels[14][02]}), .light({GrnPixels[15][02],RedPixels[15][02]}), .clock, .reset);
	 bottom_Light sixteenth15(.up({GrnPixels[14][01],RedPixels[14][01]}), .light({GrnPixels[15][01],RedPixels[15][01]}), .clock, .reset);
	 bottom_Light sixteenth16(.up({GrnPixels[14][00],RedPixels[14][00]}), .light({GrnPixels[15][00],RedPixels[15][00]}), .clock, .reset);
	 
	
	 logic a0,a1,a2,a3,a4,a5,a6,a7,a8,a9,a10,a11,a12,a13,a14,a15,b0,b1,b2,b3,b4,b5,b6,b7,b8,b9,b10,b11,b12,b13,b14,b15,c0,c1,c2,c3,c4,c5,c6,c7,c8,c9,c10,c11,c12,c13,c14,c15,d0,d1,d2,d3,d4,d5,d6,d7,d8,d9,d10,d11,d12,d13,d14,d15, e0,e1,e2,e3,e4,e5,e6,e7,e8,e9,e10,e11,e12,e13,e14,e15,e16,e17,e18,e19,e20,e21,e22,e23,e24,f1,f2,f3,f4,f5,f6,f7,f8,f9,f10,f11,f12,f13,f14,f15,f16,f17,f18,f19,f20,f21,f22,f23,f24,g1,g2,g3,g4,g5,g6,g7,g8,g9,g10,g11,g12,g13,g14,g15,g16,g17,g18,g19,g20,g21,g22,g23,g24,h1,h2,h3,h4,h5,h6,h7,h8,h9,h10,h11,h12,h13,h14,h15,h16,h17,h18,h19,h20,h21,h22,h23,h24;
	// red row check
	 shift_register redrow0(.load, .data(RedPixels[15]), .reset, .clock, .out(a0));
	 shift_register redrow1(.load, .data(RedPixels[14]), .reset, .clock, .out(a1));
	 shift_register redrow2(.load, .data(RedPixels[13]), .reset, .clock, .out(a2));
	 shift_register redrow3(.load, .data(RedPixels[12]), .reset, .clock, .out(a3));
	 shift_register redrow4(.load, .data(RedPixels[11]), .reset, .clock, .out(a4));
	 shift_register redrow5(.load, .data(RedPixels[10]), .reset, .clock, .out(a5));
	 shift_register redrow6(.load, .data(RedPixels[09]), .reset, .clock, .out(a6));
	 shift_register redrow7(.load, .data(RedPixels[08]), .reset, .clock, .out(a7));
	 shift_register redrow8(.load, .data(RedPixels[07]), .reset, .clock, .out(a8));
	 shift_register redrow9(.load, .data(RedPixels[06]), .reset, .clock, .out(a9));
	 shift_register redrow10(.load, .data(RedPixels[05]), .reset, .clock, .out(a10));
	 shift_register redrow11(.load, .data(RedPixels[04]), .reset, .clock, .out(a11));
	 shift_register redrow12(.load, .data(RedPixels[03]), .reset, .clock, .out(a12));
	 shift_register redrow13(.load, .data(RedPixels[02]), .reset, .clock, .out(a13));
	 shift_register redrow14(.load, .data(RedPixels[01]), .reset, .clock, .out(a14));
	 //shift_register redrow15(.load, .data(RedPixels[00]), .reset, .clock, .out(a15));
	 
	 
	 // green row check
	 shift_register greenrow0(.load, .data(GrnPixels[15]), .reset, .clock, .out(b0));
	 shift_register greenrow1(.load, .data(GrnPixels[14]), .reset, .clock, .out(b1));
	 shift_register greenrow2(.load, .data(GrnPixels[13]), .reset, .clock, .out(b2));
	 shift_register greenrow3(.load, .data(GrnPixels[12]), .reset, .clock, .out(b3));
	 shift_register greenrow4(.load, .data(GrnPixels[11]), .reset, .clock, .out(b4));
	 shift_register greenrow5(.load, .data(GrnPixels[10]), .reset, .clock, .out(b5));
	 shift_register greenrow6(.load, .data(GrnPixels[09]), .reset, .clock, .out(b6));
	 shift_register greenrow7(.load, .data(GrnPixels[08]), .reset, .clock, .out(b7));
	 shift_register greenrow8(.load, .data(GrnPixels[07]), .reset, .clock, .out(b8));
	 shift_register greenrow9(.load, .data(GrnPixels[06]), .reset, .clock, .out(b9));
	 shift_register greenrow10(.load, .data(GrnPixels[05]), .reset, .clock, .out(b10));
	 shift_register greenrow11(.load, .data(GrnPixels[04]), .reset, .clock, .out(b11));
	 shift_register greenrow12(.load, .data(GrnPixels[03]), .reset, .clock, .out(b12));
	 shift_register greenrow13(.load, .data(GrnPixels[02]), .reset, .clock, .out(b13));
	 shift_register greenrow14(.load, .data(GrnPixels[01]), .reset, .clock, .out(b14));
	 //shift_register greenrow15(.load, .data(GrnPixels[00]), .reset, .clock, .out(b15));
	 
	 
	 // red column check
	 shift_register redcol0(.load, .data({1'b00,RedPixels[01][15],RedPixels[02][15],RedPixels[03][15],RedPixels[04][15],RedPixels[05][15],RedPixels[06][15],RedPixels[07][15],RedPixels[08][15],RedPixels[09][15],RedPixels[10][15],RedPixels[11][15],RedPixels[12][15],RedPixels[13][15],RedPixels[14][15],RedPixels[15][15]}), .reset, .clock, .out(c0));
	 shift_register redcol1(.load, .data({1'b00,RedPixels[01][14],RedPixels[02][14],RedPixels[03][14],RedPixels[04][14],RedPixels[05][14],RedPixels[06][14],RedPixels[07][14],RedPixels[08][14],RedPixels[09][14],RedPixels[10][14],RedPixels[11][14],RedPixels[12][14],RedPixels[13][14],RedPixels[14][14],RedPixels[15][14]}), .reset, .clock, .out(c1));
	 shift_register redcol2(.load, .data({1'b00,RedPixels[01][13],RedPixels[02][13],RedPixels[03][13],RedPixels[04][13],RedPixels[05][13],RedPixels[06][13],RedPixels[07][13],RedPixels[08][13],RedPixels[09][13],RedPixels[10][13],RedPixels[11][13],RedPixels[12][13],RedPixels[13][13],RedPixels[14][13],RedPixels[15][13]}), .reset, .clock, .out(c2));
	 shift_register redcol3(.load, .data({1'b00,RedPixels[01][12],RedPixels[02][12],RedPixels[03][12],RedPixels[04][12],RedPixels[05][12],RedPixels[06][12],RedPixels[07][12],RedPixels[08][12],RedPixels[09][12],RedPixels[10][12],RedPixels[11][12],RedPixels[12][12],RedPixels[13][12],RedPixels[14][12],RedPixels[15][12]}), .reset, .clock, .out(c3));
	 shift_register redcol4(.load, .data({1'b00,RedPixels[01][11],RedPixels[02][11],RedPixels[03][11],RedPixels[04][11],RedPixels[05][11],RedPixels[06][11],RedPixels[07][11],RedPixels[08][11],RedPixels[09][11],RedPixels[10][11],RedPixels[11][11],RedPixels[12][11],RedPixels[13][11],RedPixels[14][11],RedPixels[15][11]}), .reset, .clock, .out(c4));
	 shift_register redcol5(.load, .data({1'b00,RedPixels[01][10],RedPixels[02][10],RedPixels[03][10],RedPixels[04][10],RedPixels[05][10],RedPixels[06][10],RedPixels[07][10],RedPixels[08][10],RedPixels[09][10],RedPixels[10][10],RedPixels[11][10],RedPixels[12][10],RedPixels[13][10],RedPixels[14][10],RedPixels[15][10]}), .reset, .clock, .out(c5));
	 shift_register redcol6(.load, .data({1'b00,RedPixels[01][09],RedPixels[02][09],RedPixels[03][09],RedPixels[04][09],RedPixels[05][09],RedPixels[06][09],RedPixels[07][09],RedPixels[08][09],RedPixels[09][09],RedPixels[10][09],RedPixels[11][09],RedPixels[12][09],RedPixels[13][09],RedPixels[14][09],RedPixels[15][09]}), .reset, .clock, .out(c6));
	 shift_register redcol7(.load, .data({1'b00,RedPixels[01][08],RedPixels[02][08],RedPixels[03][08],RedPixels[04][08],RedPixels[05][08],RedPixels[06][08],RedPixels[07][08],RedPixels[08][08],RedPixels[09][08],RedPixels[10][08],RedPixels[11][08],RedPixels[12][08],RedPixels[13][08],RedPixels[14][08],RedPixels[15][08]}), .reset, .clock, .out(c7));
	 shift_register redcol8(.load, .data({1'b00,RedPixels[01][07],RedPixels[02][07],RedPixels[03][07],RedPixels[04][07],RedPixels[05][07],RedPixels[06][07],RedPixels[07][07],RedPixels[08][07],RedPixels[09][07],RedPixels[10][07],RedPixels[11][07],RedPixels[12][07],RedPixels[13][07],RedPixels[14][07],RedPixels[15][07]}), .reset, .clock, .out(c8));
	 shift_register redcol9(.load, .data({1'b00,RedPixels[01][06],RedPixels[02][06],RedPixels[03][06],RedPixels[04][06],RedPixels[05][06],RedPixels[06][06],RedPixels[07][06],RedPixels[08][06],RedPixels[09][06],RedPixels[10][06],RedPixels[11][06],RedPixels[12][06],RedPixels[13][06],RedPixels[14][06],RedPixels[15][06]}), .reset, .clock, .out(c9));
	 shift_register redcol10(.load, .data({1'b00,RedPixels[01][05],RedPixels[02][05],RedPixels[03][05],RedPixels[04][05],RedPixels[05][05],RedPixels[06][05],RedPixels[07][05],RedPixels[08][05],RedPixels[09][05],RedPixels[10][05],RedPixels[11][05],RedPixels[12][05],RedPixels[13][05],RedPixels[14][05],RedPixels[15][05]}), .reset, .clock, .out(c10));
	 shift_register redcol11(.load, .data({1'b00,RedPixels[01][04],RedPixels[02][04],RedPixels[03][04],RedPixels[04][04],RedPixels[05][04],RedPixels[06][04],RedPixels[07][04],RedPixels[08][04],RedPixels[09][04],RedPixels[10][04],RedPixels[11][04],RedPixels[12][04],RedPixels[13][04],RedPixels[14][04],RedPixels[15][04]}), .reset, .clock, .out(c11));
	 shift_register redcol12(.load, .data({1'b00,RedPixels[01][03],RedPixels[02][03],RedPixels[03][03],RedPixels[04][03],RedPixels[05][03],RedPixels[06][03],RedPixels[07][03],RedPixels[08][03],RedPixels[09][03],RedPixels[10][03],RedPixels[11][03],RedPixels[12][03],RedPixels[13][03],RedPixels[14][03],RedPixels[15][03]}), .reset, .clock, .out(c12));
	 shift_register redcol13(.load, .data({1'b00,RedPixels[01][02],RedPixels[02][02],RedPixels[03][02],RedPixels[04][02],RedPixels[05][02],RedPixels[06][02],RedPixels[07][02],RedPixels[08][02],RedPixels[09][02],RedPixels[10][02],RedPixels[11][02],RedPixels[12][02],RedPixels[13][02],RedPixels[14][02],RedPixels[15][02]}), .reset, .clock, .out(c13));
	 shift_register redcol14(.load, .data({1'b00,RedPixels[01][01],RedPixels[02][01],RedPixels[03][01],RedPixels[04][01],RedPixels[05][01],RedPixels[06][01],RedPixels[07][01],RedPixels[08][01],RedPixels[09][01],RedPixels[10][01],RedPixels[11][01],RedPixels[12][01],RedPixels[13][01],RedPixels[14][01],RedPixels[15][01]}), .reset, .clock, .out(c14));
	 shift_register redcol15(.load, .data({1'b00,RedPixels[01][00],RedPixels[02][00],RedPixels[03][00],RedPixels[04][00],RedPixels[05][00],RedPixels[06][00],RedPixels[07][00],RedPixels[08][00],RedPixels[09][00],RedPixels[10][00],RedPixels[11][00],RedPixels[12][00],RedPixels[13][00],RedPixels[14][00],RedPixels[15][00]}), .reset, .clock, .out(c15));
	 
	 //green col check
	 
	 shift_register greencol0(.load, .data({1'b00,GrnPixels[01][15],GrnPixels[02][15],GrnPixels[03][15],GrnPixels[04][15],GrnPixels[05][15],GrnPixels[06][15],GrnPixels[07][15],GrnPixels[08][15],GrnPixels[09][15],GrnPixels[10][15],GrnPixels[11][15],GrnPixels[12][15],GrnPixels[13][15],GrnPixels[14][15],GrnPixels[15][15]}), .reset, .clock, .out(d0));
	 shift_register greencol1(.load, .data({1'b00,GrnPixels[01][14],GrnPixels[02][14],GrnPixels[03][14],GrnPixels[04][14],GrnPixels[05][14],GrnPixels[06][14],GrnPixels[07][14],GrnPixels[08][14],GrnPixels[09][14],GrnPixels[10][14],GrnPixels[11][14],GrnPixels[12][14],GrnPixels[13][14],GrnPixels[14][14],GrnPixels[15][14]}), .reset, .clock, .out(d1));
	 shift_register greencol2(.load, .data({1'b00,GrnPixels[01][13],GrnPixels[02][13],GrnPixels[03][13],GrnPixels[04][13],GrnPixels[05][13],GrnPixels[06][13],GrnPixels[07][13],GrnPixels[08][13],GrnPixels[09][13],GrnPixels[10][13],GrnPixels[11][13],GrnPixels[12][13],GrnPixels[13][13],GrnPixels[14][13],GrnPixels[15][13]}), .reset, .clock, .out(d2));
	 shift_register greencol3(.load, .data({1'b00,GrnPixels[01][12],GrnPixels[02][12],GrnPixels[03][12],GrnPixels[04][12],GrnPixels[05][12],GrnPixels[06][12],GrnPixels[07][12],GrnPixels[08][12],GrnPixels[09][12],GrnPixels[10][12],GrnPixels[11][12],GrnPixels[12][12],GrnPixels[13][12],GrnPixels[14][12],GrnPixels[15][12]}), .reset, .clock, .out(d3));
	 shift_register greencol4(.load, .data({1'b00,GrnPixels[01][11],GrnPixels[02][11],GrnPixels[03][11],GrnPixels[04][11],GrnPixels[05][11],GrnPixels[06][11],GrnPixels[07][11],GrnPixels[08][11],GrnPixels[09][11],GrnPixels[10][11],GrnPixels[11][11],GrnPixels[12][11],GrnPixels[13][11],GrnPixels[14][11],GrnPixels[15][11]}), .reset, .clock, .out(d4));
	 shift_register greencol5(.load, .data({1'b00,GrnPixels[01][10],GrnPixels[02][10],GrnPixels[03][10],GrnPixels[04][10],GrnPixels[05][10],GrnPixels[06][10],GrnPixels[07][10],GrnPixels[08][10],GrnPixels[09][10],GrnPixels[10][10],GrnPixels[11][10],GrnPixels[12][10],GrnPixels[13][10],GrnPixels[14][10],GrnPixels[15][10]}), .reset, .clock, .out(d5));
	 shift_register greencol6(.load, .data({1'b00,GrnPixels[01][09],GrnPixels[02][09],GrnPixels[03][09],GrnPixels[04][09],GrnPixels[05][09],GrnPixels[06][09],GrnPixels[07][09],GrnPixels[08][09],GrnPixels[09][09],GrnPixels[10][09],GrnPixels[11][09],GrnPixels[12][09],GrnPixels[13][09],GrnPixels[14][09],GrnPixels[15][09]}), .reset, .clock, .out(d6));
	 shift_register greencol7(.load, .data({1'b00,GrnPixels[01][08],GrnPixels[02][08],GrnPixels[03][08],GrnPixels[04][08],GrnPixels[05][08],GrnPixels[06][08],GrnPixels[07][08],GrnPixels[08][08],GrnPixels[09][08],GrnPixels[10][08],GrnPixels[11][08],GrnPixels[12][08],GrnPixels[13][08],GrnPixels[14][08],GrnPixels[15][08]}), .reset, .clock, .out(d7));
	 shift_register greencol8(.load, .data({1'b00,GrnPixels[01][07],GrnPixels[02][07],GrnPixels[03][07],GrnPixels[04][07],GrnPixels[05][07],GrnPixels[06][07],GrnPixels[07][07],GrnPixels[08][07],GrnPixels[09][07],GrnPixels[10][07],GrnPixels[11][07],GrnPixels[12][07],GrnPixels[13][07],GrnPixels[14][07],GrnPixels[15][07]}), .reset, .clock, .out(d8));
	 shift_register greencol9(.load, .data({1'b00,GrnPixels[01][06],GrnPixels[02][06],GrnPixels[03][06],GrnPixels[04][06],GrnPixels[05][06],GrnPixels[06][06],GrnPixels[07][06],GrnPixels[08][06],GrnPixels[09][06],GrnPixels[10][06],GrnPixels[11][06],GrnPixels[12][06],GrnPixels[13][06],GrnPixels[14][06],GrnPixels[15][06]}), .reset, .clock, .out(d9));
	 shift_register greencol10(.load, .data({1'b00,GrnPixels[01][05],GrnPixels[02][05],GrnPixels[03][05],GrnPixels[04][05],GrnPixels[05][05],GrnPixels[06][05],GrnPixels[07][05],GrnPixels[08][05],GrnPixels[09][05],GrnPixels[10][05],GrnPixels[11][05],GrnPixels[12][05],GrnPixels[13][05],GrnPixels[14][05],GrnPixels[15][05]}), .reset, .clock, .out(d10));
	 shift_register greencol11(.load, .data({1'b00,GrnPixels[01][04],GrnPixels[02][04],GrnPixels[03][04],GrnPixels[04][04],GrnPixels[05][04],GrnPixels[06][04],GrnPixels[07][04],GrnPixels[08][04],GrnPixels[09][04],GrnPixels[10][04],GrnPixels[11][04],GrnPixels[12][04],GrnPixels[13][04],GrnPixels[14][04],GrnPixels[15][04]}), .reset, .clock, .out(d11));
	 shift_register greencol12(.load, .data({1'b00,GrnPixels[01][03],GrnPixels[02][03],GrnPixels[03][03],GrnPixels[04][03],GrnPixels[05][03],GrnPixels[06][03],GrnPixels[07][03],GrnPixels[08][03],GrnPixels[09][03],GrnPixels[10][03],GrnPixels[11][03],GrnPixels[12][03],GrnPixels[13][03],GrnPixels[14][03],GrnPixels[15][03]}), .reset, .clock, .out(d12));
	 shift_register greencol13(.load, .data({1'b00,GrnPixels[01][02],GrnPixels[02][02],GrnPixels[03][02],GrnPixels[04][02],GrnPixels[05][02],GrnPixels[06][02],GrnPixels[07][02],GrnPixels[08][02],GrnPixels[09][02],GrnPixels[10][02],GrnPixels[11][02],GrnPixels[12][02],GrnPixels[13][02],GrnPixels[14][02],GrnPixels[15][02]}), .reset, .clock, .out(d13));
	 shift_register greencol14(.load, .data({1'b00,GrnPixels[01][01],GrnPixels[02][01],GrnPixels[03][01],GrnPixels[04][01],GrnPixels[05][01],GrnPixels[06][01],GrnPixels[07][01],GrnPixels[08][01],GrnPixels[09][01],GrnPixels[10][01],GrnPixels[11][01],GrnPixels[12][01],GrnPixels[13][01],GrnPixels[14][01],GrnPixels[15][01]}), .reset, .clock, .out(d14));
	 shift_register greencol15(.load, .data({1'b00,GrnPixels[01][00],GrnPixels[02][00],GrnPixels[03][00],GrnPixels[04][00],GrnPixels[05][00],GrnPixels[06][00],GrnPixels[07][00],GrnPixels[08][00],GrnPixels[09][00],GrnPixels[10][00],GrnPixels[11][00],GrnPixels[12][00],GrnPixels[13][00],GrnPixels[14][00],GrnPixels[15][00]}), .reset, .clock, .out(d15));
	
	 
	 
	 
	 //diagonal deteection 
	 // red diag 1
  //shift_register reddiag0(.load, .data({6'b000000,RedPixels[03][15],RedPixels[02][14],RedPixels[01][13],RedPixels[00][12],6'b000000}), .reset, .clock, .out(e0));
	 shift_register reddiag1(.load, .data({6'b000000,RedPixels[04][15],RedPixels[03][14],RedPixels[02][13],RedPixels[01][12],6'b000000}), .reset, .clock, .out(e1));
	 shift_register reddiag2(.load, .data({6'b000000,RedPixels[05][15],RedPixels[04][14],RedPixels[03][13],RedPixels[02][12],RedPixels[01][11],5'b00000}), .reset, .clock, .out(e2));
	 shift_register reddiag3(.load, .data({6'b000000,RedPixels[06][15],RedPixels[05][14],RedPixels[04][13],RedPixels[03][12],RedPixels[02][11],RedPixels[01][10],4'b0000}), .reset, .clock, .out(e3));
	 shift_register reddiag4(.load, .data({6'b000000,RedPixels[07][15],RedPixels[06][14],RedPixels[05][13],RedPixels[04][12],RedPixels[03][11],RedPixels[02][10],RedPixels[01][09],3'b000}), .reset, .clock, .out(e4));
	 shift_register reddiag5(.load, .data({6'b000000,RedPixels[08][15],RedPixels[07][14],RedPixels[06][13],RedPixels[05][12],RedPixels[04][11],RedPixels[03][10],RedPixels[02][09],RedPixels[01][08],2'b00}), .reset, .clock, .out(e5));
	 shift_register reddiag6(.load, .data({6'b000000,RedPixels[09][15],RedPixels[08][14],RedPixels[07][13],RedPixels[06][12],RedPixels[05][11],RedPixels[04][10],RedPixels[03][09],RedPixels[02][08],RedPixels[01][07],1'b0}), .reset, .clock, .out(e6));
	 shift_register reddiag7(.load, .data({6'b000000,RedPixels[10][15],RedPixels[09][14],RedPixels[08][13],RedPixels[07][12],RedPixels[06][11],RedPixels[05][10],RedPixels[04][09],RedPixels[03][08],RedPixels[02][07],RedPixels[01][06]}), .reset, .clock, .out(e7));
	 shift_register reddiag8(.load, .data({5'b000000,RedPixels[11][15],RedPixels[10][14],RedPixels[09][13],RedPixels[08][12],RedPixels[07][11],RedPixels[06][10],RedPixels[05][09],RedPixels[04][08],RedPixels[03][07],RedPixels[02][06],RedPixels[01][05]}), .reset, .clock, .out(e8));
	 shift_register reddiag9(.load, .data({4'b00000,RedPixels[12][15],RedPixels[11][14],RedPixels[10][13],RedPixels[09][12],RedPixels[08][11],RedPixels[07][10],RedPixels[06][09],RedPixels[05][08],RedPixels[04][07],RedPixels[03][06],RedPixels[02][05],RedPixels[01][04]}), .reset, .clock, .out(e9));
	 shift_register reddiag10(.load, .data({3'b000,RedPixels[13][15],RedPixels[12][14],RedPixels[11][13],RedPixels[10][12],RedPixels[09][11],RedPixels[08][10],RedPixels[07][09],RedPixels[06][08],RedPixels[05][07],RedPixels[04][06],RedPixels[03][05],RedPixels[02][04],RedPixels[01][03]}), .reset, .clock, .out(e10));
	 shift_register reddiag11(.load, .data({2'b00,RedPixels[14][15],RedPixels[13][14],RedPixels[12][13],RedPixels[11][12],RedPixels[10][11],RedPixels[09][10],RedPixels[08][09],RedPixels[07][08],RedPixels[06][07],RedPixels[05][06],RedPixels[04][05],RedPixels[03][04],RedPixels[02][03],RedPixels[01][02]}), .reset, .clock, .out(e11));
	 shift_register reddiag12(.load, .data({1'b00,RedPixels[15][15],RedPixels[14][14],RedPixels[13][13],RedPixels[12][12],RedPixels[11][11],RedPixels[10][10],RedPixels[09][09],RedPixels[08][08],RedPixels[07][07],RedPixels[06][06],RedPixels[05][05],RedPixels[04][04],RedPixels[03][03],RedPixels[02][02],RedPixels[01][01]}), .reset, .clock, .out(e12));
	 
	 
	 
	 
	 shift_register reddiag13(.load, .data({1'b0,RedPixels[15][14],RedPixels[14][13],RedPixels[13][12],RedPixels[12][11],RedPixels[11][10],RedPixels[10][09],RedPixels[09][08],RedPixels[08][07],RedPixels[07][06],RedPixels[06][05],RedPixels[05][04],RedPixels[04][03],RedPixels[03][02],RedPixels[02][01],RedPixels[01][00]}), .reset, .clock, .out(e13));
	 shift_register reddiag14(.load, .data({2'b00,RedPixels[15][13],RedPixels[14][12],RedPixels[13][11],RedPixels[12][10],RedPixels[11][09],RedPixels[10][08],RedPixels[09][07],RedPixels[08][06],RedPixels[07][05],RedPixels[06][04],RedPixels[05][03],RedPixels[04][02],RedPixels[03][01],RedPixels[02][00]}), .reset, .clock, .out(e14));
	 shift_register reddiag15(.load, .data({3'b000,RedPixels[15][12],RedPixels[14][11],RedPixels[13][10],RedPixels[12][09],RedPixels[11][08],RedPixels[10][07],RedPixels[09][06],RedPixels[08][05],RedPixels[07][04],RedPixels[06][03],RedPixels[05][02],RedPixels[04][01],RedPixels[03][00]}), .reset, .clock, .out(e15));
	 shift_register reddiag16(.load, .data({4'b0000,RedPixels[15][11],RedPixels[14][10],RedPixels[13][09],RedPixels[12][08],RedPixels[11][07],RedPixels[10][06],RedPixels[09][05],RedPixels[08][04],RedPixels[07][03],RedPixels[06][02],RedPixels[05][01],RedPixels[04][00]}), .reset, .clock, .out(e16));
	 shift_register reddiag17(.load, .data({5'b00000,RedPixels[15][10],RedPixels[14][09],RedPixels[13][08],RedPixels[12][07],RedPixels[11][06],RedPixels[10][05],RedPixels[09][04],RedPixels[08][03],RedPixels[07][02],RedPixels[06][01],RedPixels[05][00]}), .reset, .clock, .out(e17));
	 shift_register reddiag18(.load, .data({6'b000000,RedPixels[15][09],RedPixels[14][08],RedPixels[13][07],RedPixels[12][06],RedPixels[11][05],RedPixels[10][04],RedPixels[09][03],RedPixels[08][02],RedPixels[07][01],RedPixels[06][00]}), .reset, .clock, .out(e18));
	 shift_register reddiag19(.load, .data({7'b0000000,RedPixels[15][08],RedPixels[14][07],RedPixels[13][06],RedPixels[12][05],RedPixels[11][04],RedPixels[10][03],RedPixels[09][02],RedPixels[08][01],RedPixels[07][00]}), .reset, .clock, .out(e19));
	 shift_register reddiag20(.load, .data({8'b00000000,RedPixels[15][07],RedPixels[14][06],RedPixels[13][05],RedPixels[12][04],RedPixels[11][03],RedPixels[10][02],RedPixels[09][01],RedPixels[08][00]}), .reset, .clock, .out(e20));
	 shift_register reddiag21(.load, .data({9'b000000000,RedPixels[15][06],RedPixels[14][05],RedPixels[13][04],RedPixels[12][03],RedPixels[11][02],RedPixels[10][01],RedPixels[09][00]}), .reset, .clock, .out(e21));
	 shift_register reddiag22(.load, .data({10'b0000000000,RedPixels[15][05],RedPixels[14][04],RedPixels[13][03],RedPixels[12][02],RedPixels[11][01],RedPixels[10][00]}), .reset, .clock, .out(e22));
	 shift_register reddiag23(.load, .data({11'b00000000000,RedPixels[15][04],RedPixels[14][03],RedPixels[13][02],RedPixels[12][01],RedPixels[11][00]}), .reset, .clock, .out(e23));
	 shift_register reddiag24(.load, .data({12'b000000000000,RedPixels[15][03],RedPixels[14][02],RedPixels[13][01],RedPixels[12][00]}), .reset, .clock, .out(e24));
	
	 
	 
	 ///green diag 1
	 	 //shift_register greendiag0(.load, .data({6'b000000,GrnPixels[03][15],GrnPixels[02][14],GrnPixels[01][13],GrnPixels[00][12],6'b000000}), .reset, .clock, .out(f0));
	 shift_register greendiag1(.load, .data({6'b000000,GrnPixels[04][15],GrnPixels[03][14],GrnPixels[02][13],GrnPixels[01][12],6'b000000}), .reset, .clock, .out(f1));
	 shift_register greendiag2(.load, .data({6'b000000,GrnPixels[05][15],GrnPixels[04][14],GrnPixels[03][13],GrnPixels[02][12],GrnPixels[01][11],5'b00000}), .reset, .clock, .out(f2));
	 shift_register greendiag3(.load, .data({6'b000000,GrnPixels[06][15],GrnPixels[05][14],GrnPixels[04][13],GrnPixels[03][12],GrnPixels[02][11],GrnPixels[01][10],4'b0000}), .reset, .clock, .out(f3));
	 shift_register greendiag4(.load, .data({6'b000000,GrnPixels[07][15],GrnPixels[06][14],GrnPixels[05][13],GrnPixels[04][12],GrnPixels[03][11],GrnPixels[02][10],GrnPixels[01][09],3'b000}), .reset, .clock, .out(f4));
	 shift_register greendiag5(.load, .data({6'b000000,GrnPixels[08][15],GrnPixels[07][14],GrnPixels[06][13],GrnPixels[05][12],GrnPixels[04][11],GrnPixels[03][10],GrnPixels[02][09],GrnPixels[01][08],2'b00}), .reset, .clock, .out(f5));
	 shift_register greendiag6(.load, .data({6'b000000,GrnPixels[09][15],GrnPixels[08][14],GrnPixels[07][13],GrnPixels[06][12],GrnPixels[05][11],GrnPixels[04][10],GrnPixels[03][09],GrnPixels[02][08],GrnPixels[01][07],1'b0}), .reset, .clock, .out(f6));
	 shift_register greendiag7(.load, .data({6'b000000,GrnPixels[10][15],GrnPixels[09][14],GrnPixels[08][13],GrnPixels[07][12],GrnPixels[06][11],GrnPixels[05][10],GrnPixels[04][09],GrnPixels[03][08],GrnPixels[02][07],GrnPixels[01][06]}), .reset, .clock, .out(f7));
	 shift_register greendiag8(.load, .data({5'b000000,GrnPixels[11][15],GrnPixels[10][14],GrnPixels[09][13],GrnPixels[08][12],GrnPixels[07][11],GrnPixels[06][10],GrnPixels[05][09],GrnPixels[04][08],GrnPixels[03][07],GrnPixels[02][06],GrnPixels[01][05]}), .reset, .clock, .out(f8));
	 shift_register greendiag9(.load, .data({4'b00000,GrnPixels[12][15],GrnPixels[11][14],GrnPixels[10][13],GrnPixels[09][12],GrnPixels[08][11],GrnPixels[07][10],GrnPixels[06][09],GrnPixels[05][08],GrnPixels[04][07],GrnPixels[03][06],GrnPixels[02][05],GrnPixels[01][04]}), .reset, .clock, .out(f9));
	 shift_register greendiag10(.load, .data({3'b000,GrnPixels[13][15],GrnPixels[12][14],GrnPixels[11][13],GrnPixels[10][12],GrnPixels[09][11],GrnPixels[08][10],GrnPixels[07][09],GrnPixels[06][08],GrnPixels[05][07],GrnPixels[04][06],GrnPixels[03][05],GrnPixels[02][04],GrnPixels[01][03]}), .reset, .clock, .out(f10));
	 shift_register greendiag11(.load, .data({2'b00,GrnPixels[14][15],GrnPixels[13][14],GrnPixels[12][13],GrnPixels[11][12],GrnPixels[10][11],GrnPixels[09][10],GrnPixels[08][09],GrnPixels[07][08],GrnPixels[06][07],GrnPixels[05][06],GrnPixels[04][05],GrnPixels[03][04],GrnPixels[02][03],GrnPixels[01][02]}), .reset, .clock, .out(f11));
	 shift_register greendiag12(.load, .data({1'b00,GrnPixels[15][15],GrnPixels[14][14],GrnPixels[13][13],GrnPixels[12][12],GrnPixels[11][11],GrnPixels[10][10],GrnPixels[09][09],GrnPixels[08][08],GrnPixels[07][07],GrnPixels[06][06],GrnPixels[05][05],GrnPixels[04][04],GrnPixels[03][03],GrnPixels[02][02],GrnPixels[01][01]}), .reset, .clock, .out(f12));
	 
	 
	 shift_register greendiag13(.load, .data({1'b0,GrnPixels[15][14],GrnPixels[14][13],GrnPixels[13][12],GrnPixels[12][11],GrnPixels[11][10],GrnPixels[10][09],GrnPixels[09][08],GrnPixels[08][07],GrnPixels[07][06],GrnPixels[06][05],GrnPixels[05][04],GrnPixels[04][03],GrnPixels[03][02],GrnPixels[02][01],GrnPixels[01][00]}), .reset, .clock, .out(f13));
	 shift_register greendiag14(.load, .data({2'b00,GrnPixels[15][13],GrnPixels[14][12],GrnPixels[13][11],GrnPixels[12][10],GrnPixels[11][09],GrnPixels[10][08],GrnPixels[09][07],GrnPixels[08][06],GrnPixels[07][05],GrnPixels[06][04],GrnPixels[05][03],GrnPixels[04][02],GrnPixels[03][01],GrnPixels[02][00]}), .reset, .clock, .out(f14));
	 shift_register greendiag15(.load, .data({3'b000,GrnPixels[15][12],GrnPixels[14][11],GrnPixels[13][10],GrnPixels[12][09],GrnPixels[11][08],GrnPixels[10][07],GrnPixels[09][06],GrnPixels[08][05],GrnPixels[07][04],GrnPixels[06][03],GrnPixels[05][02],GrnPixels[04][01],GrnPixels[03][00]}), .reset, .clock, .out(f15));
	 shift_register greendiag16(.load, .data({4'b0000,GrnPixels[15][11],GrnPixels[14][10],GrnPixels[13][09],GrnPixels[12][08],GrnPixels[11][07],GrnPixels[10][06],GrnPixels[09][05],GrnPixels[08][04],GrnPixels[07][03],GrnPixels[06][02],GrnPixels[05][01],GrnPixels[04][00]}), .reset, .clock, .out(f16));
	 shift_register greendiag17(.load, .data({5'b00000,GrnPixels[15][10],GrnPixels[14][09],GrnPixels[13][08],GrnPixels[12][07],GrnPixels[11][06],GrnPixels[10][05],GrnPixels[09][04],GrnPixels[08][03],GrnPixels[07][02],GrnPixels[06][01],GrnPixels[05][00]}), .reset, .clock, .out(f17));
	 shift_register greendiag18(.load, .data({6'b000000,GrnPixels[15][09],GrnPixels[14][08],GrnPixels[13][07],GrnPixels[12][06],GrnPixels[11][05],GrnPixels[10][04],GrnPixels[09][03],GrnPixels[08][02],GrnPixels[07][01],GrnPixels[06][00]}), .reset, .clock, .out(f18));
	 shift_register greendiag19(.load, .data({7'b0000000,GrnPixels[15][08],GrnPixels[14][07],GrnPixels[13][06],GrnPixels[12][05],GrnPixels[11][04],GrnPixels[10][03],GrnPixels[09][02],GrnPixels[08][01],GrnPixels[07][00]}), .reset, .clock, .out(f19));
	 shift_register greendiag20(.load, .data({8'b00000000,GrnPixels[15][07],GrnPixels[14][06],GrnPixels[13][05],GrnPixels[12][04],GrnPixels[11][03],GrnPixels[10][02],GrnPixels[09][01],GrnPixels[08][00]}), .reset, .clock, .out(f20));
	 shift_register greendiag21(.load, .data({9'b000000000,GrnPixels[15][06],GrnPixels[14][05],GrnPixels[13][04],GrnPixels[12][03],GrnPixels[11][02],GrnPixels[10][01],GrnPixels[09][00]}), .reset, .clock, .out(f21));
	 shift_register greendiag22(.load, .data({10'b0000000000,GrnPixels[15][05],GrnPixels[14][04],GrnPixels[13][03],GrnPixels[12][02],GrnPixels[11][01],GrnPixels[10][00]}), .reset, .clock, .out(f22));
	 shift_register greendiag23(.load, .data({11'b00000000000,GrnPixels[15][04],GrnPixels[14][03],GrnPixels[13][02],GrnPixels[12][01],GrnPixels[11][00]}), .reset, .clock, .out(f23));
	 shift_register greendiag24(.load, .data({12'b000000000000,GrnPixels[15][03],GrnPixels[14][02],GrnPixels[13][01],GrnPixels[12][00]}), .reset, .clock, .out(f24));
	 
	 // red diag 2
	 //shift_register reddiag0(.load, .data({6'b000000,RedPixels[03][00],RedPixels[02][01],RedPixels[01][02],RedPixels[00][03],6'b000000}), .reset, .clock, .out(g0));
	 shift_register reddiag1_1(.load, .data({6'b000000,RedPixels[04][00],RedPixels[03][01],RedPixels[02][02],RedPixels[01][03],6'b000000}), .reset, .clock, .out(g1));
	 shift_register reddiag2_1(.load, .data({6'b000000,RedPixels[05][00],RedPixels[04][01],RedPixels[03][02],RedPixels[02][03],RedPixels[01][04],5'b00000}), .reset, .clock, .out(g2));
	 shift_register reddiag3_1(.load, .data({6'b000000,RedPixels[06][00],RedPixels[05][01],RedPixels[04][02],RedPixels[03][03],RedPixels[02][04],RedPixels[01][05],4'b0000}), .reset, .clock, .out(g3));
	 shift_register reddiag4_1(.load, .data({6'b000000,RedPixels[07][00],RedPixels[06][01],RedPixels[05][02],RedPixels[04][03],RedPixels[03][04],RedPixels[02][05],RedPixels[01][06],3'b000}), .reset, .clock, .out(g4));
	 shift_register reddiag5_1(.load, .data({6'b000000,RedPixels[08][00],RedPixels[07][01],RedPixels[06][02],RedPixels[05][03],RedPixels[04][04],RedPixels[03][05],RedPixels[02][06],RedPixels[01][07],2'b00}), .reset, .clock, .out(g5));
	 shift_register reddiag6_1(.load, .data({6'b000000,RedPixels[09][00],RedPixels[08][01],RedPixels[07][02],RedPixels[06][03],RedPixels[05][04],RedPixels[04][05],RedPixels[03][06],RedPixels[02][07],RedPixels[01][08],1'b0}), .reset, .clock, .out(g6));
	 shift_register reddiag7_1(.load, .data({6'b000000,RedPixels[10][00],RedPixels[09][01],RedPixels[08][02],RedPixels[07][03],RedPixels[06][04],RedPixels[05][05],RedPixels[04][06],RedPixels[03][07],RedPixels[02][08],RedPixels[01][09]}), .reset, .clock, .out(g7));
	 shift_register reddiag8_1(.load, .data({5'b000000,RedPixels[11][00],RedPixels[10][01],RedPixels[09][02],RedPixels[08][03],RedPixels[07][04],RedPixels[06][05],RedPixels[05][06],RedPixels[04][07],RedPixels[03][08],RedPixels[02][09],RedPixels[01][10]}), .reset, .clock, .out(g8));
	 shift_register reddiag9_1(.load, .data({4'b00000,RedPixels[12][00],RedPixels[11][01],RedPixels[10][02],RedPixels[09][03],RedPixels[08][04],RedPixels[07][05],RedPixels[06][06],RedPixels[05][07],RedPixels[04][08],RedPixels[03][09],RedPixels[02][10],RedPixels[01][11]}), .reset, .clock, .out(g9));
	 shift_register reddiag10_1(.load, .data({3'b000,RedPixels[13][00],RedPixels[12][01],RedPixels[11][02],RedPixels[10][03],RedPixels[09][04],RedPixels[08][05],RedPixels[07][06],RedPixels[06][07],RedPixels[05][08],RedPixels[04][09],RedPixels[03][10],RedPixels[02][11],RedPixels[01][12]}), .reset, .clock, .out(g10));
	 shift_register reddiag11_1(.load, .data({2'b00,RedPixels[14][00],RedPixels[13][01],RedPixels[12][02],RedPixels[11][03],RedPixels[10][04],RedPixels[09][05],RedPixels[08][06],RedPixels[07][07],RedPixels[06][08],RedPixels[05][09],RedPixels[04][10],RedPixels[03][11],RedPixels[02][12],RedPixels[01][13]}), .reset, .clock, .out(g11));
	 shift_register reddiag12_1(.load, .data({1'b00,RedPixels[15][00],RedPixels[14][01],RedPixels[13][02],RedPixels[12][03],RedPixels[11][04],RedPixels[10][05],RedPixels[09][06],RedPixels[08][07],RedPixels[07][08],RedPixels[06][09],RedPixels[05][10],RedPixels[04][11],RedPixels[03][12],RedPixels[02][13],RedPixels[01][14]}), .reset, .clock, .out(g12));
	 
	 
	 
	 
	 shift_register reddiag13_1(.load, .data({1'b0,RedPixels[15][01],RedPixels[14][02],RedPixels[13][03],RedPixels[12][04],RedPixels[11][05],RedPixels[10][06],RedPixels[09][07],RedPixels[08][08],RedPixels[07][09],RedPixels[06][10],RedPixels[05][11],RedPixels[04][12],RedPixels[03][13],RedPixels[02][14],RedPixels[01][15]}), .reset, .clock, .out(g13));
	 shift_register reddiag14_1(.load, .data({2'b00,RedPixels[15][02],RedPixels[14][03],RedPixels[13][04],RedPixels[12][05],RedPixels[11][06],RedPixels[10][07],RedPixels[09][08],RedPixels[08][09],RedPixels[07][10],RedPixels[06][11],RedPixels[05][12],RedPixels[04][13],RedPixels[03][14],RedPixels[02][15]}), .reset, .clock, .out(g14));
	 shift_register reddiag15_1(.load, .data({3'b000,RedPixels[15][03],RedPixels[14][04],RedPixels[13][05],RedPixels[12][06],RedPixels[11][07],RedPixels[10][08],RedPixels[09][09],RedPixels[08][10],RedPixels[07][11],RedPixels[06][12],RedPixels[05][13],RedPixels[04][14],RedPixels[03][15]}), .reset, .clock, .out(g15));
	 shift_register reddiag16_1(.load, .data({4'b0000,RedPixels[15][04],RedPixels[14][05],RedPixels[13][06],RedPixels[12][07],RedPixels[11][08],RedPixels[10][09],RedPixels[09][10],RedPixels[08][11],RedPixels[07][12],RedPixels[06][13],RedPixels[05][14],RedPixels[04][15]}), .reset, .clock, .out(g16));
	 shift_register reddiag17_1(.load, .data({5'b00000,RedPixels[15][05],RedPixels[14][06],RedPixels[13][07],RedPixels[12][08],RedPixels[11][09],RedPixels[10][10],RedPixels[09][11],RedPixels[08][12],RedPixels[07][13],RedPixels[06][14],RedPixels[05][15]}), .reset, .clock, .out(g17));
	 shift_register reddiag18_1(.load, .data({6'b000000,RedPixels[15][06],RedPixels[14][07],RedPixels[13][08],RedPixels[12][09],RedPixels[11][10],RedPixels[10][11],RedPixels[09][12],RedPixels[08][13],RedPixels[07][14],RedPixels[06][15]}), .reset, .clock, .out(g18));
	 shift_register reddiag19_1(.load, .data({7'b0000000,RedPixels[15][07],RedPixels[14][08],RedPixels[13][09],RedPixels[12][10],RedPixels[11][11],RedPixels[10][12],RedPixels[09][13],RedPixels[08][14],RedPixels[07][15]}), .reset, .clock, .out(g19));
	 shift_register reddiag20_1(.load, .data({8'b00000000,RedPixels[15][08],RedPixels[14][09],RedPixels[13][10],RedPixels[12][11],RedPixels[11][12],RedPixels[10][13],RedPixels[09][14],RedPixels[08][15]}), .reset, .clock, .out(g20));
	 shift_register reddiag21_1(.load, .data({9'b000000000,RedPixels[15][09],RedPixels[14][10],RedPixels[13][11],RedPixels[12][12],RedPixels[11][13],RedPixels[10][14],RedPixels[09][15]}), .reset, .clock, .out(g21));
	 shift_register reddiag22_1(.load, .data({10'b0000000000,RedPixels[15][10],RedPixels[14][11],RedPixels[13][12],RedPixels[12][13],RedPixels[11][14],RedPixels[10][15]}), .reset, .clock, .out(g22));
	 shift_register reddiag23_1(.load, .data({11'b00000000000,RedPixels[15][11],RedPixels[14][12],RedPixels[13][13],RedPixels[12][14],RedPixels[11][15]}), .reset, .clock, .out(g23));
	 shift_register reddiag24_1(.load, .data({12'b000000000000,RedPixels[15][12],RedPixels[14][13],RedPixels[13][14],RedPixels[12][15]}), .reset, .clock, .out(g24));
	
	 
	 
	 
	  //shift_register greendiag0(.load, .data({6'b000000,GrnPixels[03][00],GrnPixels[02][01],GrnPixels[01][02],GrnPixels[00][03],6'b000000}), .reset, .clock, .out(h0));
	 shift_register greendiag1_1(.load, .data({6'b000000,GrnPixels[04][00],GrnPixels[03][01],GrnPixels[02][02],GrnPixels[01][03],6'b000000}), .reset, .clock, .out(h1));
	 shift_register greendiag2_1(.load, .data({6'b000000,GrnPixels[05][00],GrnPixels[04][01],GrnPixels[03][02],GrnPixels[02][03],GrnPixels[01][04],5'b00000}), .reset, .clock, .out(h2));
	 shift_register greendiag3_1(.load, .data({6'b000000,GrnPixels[06][00],GrnPixels[05][01],GrnPixels[04][02],GrnPixels[03][03],GrnPixels[02][04],GrnPixels[01][05],4'b0000}), .reset, .clock, .out(h3));
	 shift_register greendiag4_1(.load, .data({6'b000000,GrnPixels[07][00],GrnPixels[06][01],GrnPixels[05][02],GrnPixels[04][03],GrnPixels[03][04],GrnPixels[02][05],GrnPixels[01][06],3'b000}), .reset, .clock, .out(h4));
	 shift_register greendiag5_1(.load, .data({6'b000000,GrnPixels[08][00],GrnPixels[07][01],GrnPixels[06][02],GrnPixels[05][03],GrnPixels[04][04],GrnPixels[03][05],GrnPixels[02][06],GrnPixels[01][07],2'b00}), .reset, .clock, .out(h5));
	 shift_register greendiag6_1(.load, .data({6'b000000,GrnPixels[09][00],GrnPixels[08][01],GrnPixels[07][02],GrnPixels[06][03],GrnPixels[05][04],GrnPixels[04][05],GrnPixels[03][06],GrnPixels[02][07],GrnPixels[01][08],1'b0}), .reset, .clock, .out(h6));
	 shift_register greendiag7_1(.load, .data({6'b000000,GrnPixels[10][00],GrnPixels[09][01],GrnPixels[08][02],GrnPixels[07][03],GrnPixels[06][04],GrnPixels[05][05],GrnPixels[04][06],GrnPixels[03][07],GrnPixels[02][08],GrnPixels[01][09]}), .reset, .clock, .out(h7));
	 shift_register greendiag8_1(.load, .data({5'b000000,GrnPixels[11][00],GrnPixels[10][01],GrnPixels[09][02],GrnPixels[08][03],GrnPixels[07][04],GrnPixels[06][05],GrnPixels[05][06],GrnPixels[04][07],GrnPixels[03][08],GrnPixels[02][09],GrnPixels[01][10]}), .reset, .clock, .out(h8));
	 shift_register greendiag9_1(.load, .data({4'b00000,GrnPixels[12][00],GrnPixels[11][01],GrnPixels[10][02],GrnPixels[09][03],GrnPixels[08][04],GrnPixels[07][05],GrnPixels[06][06],GrnPixels[05][07],GrnPixels[04][08],GrnPixels[03][09],GrnPixels[02][10],GrnPixels[01][11]}), .reset, .clock, .out(h9));
	 shift_register greendiag10_1(.load, .data({3'b000,GrnPixels[13][00],GrnPixels[12][01],GrnPixels[11][02],GrnPixels[10][03],GrnPixels[09][04],GrnPixels[08][05],GrnPixels[07][06],GrnPixels[06][07],GrnPixels[05][08],GrnPixels[04][09],GrnPixels[03][10],GrnPixels[02][11],GrnPixels[01][12]}), .reset, .clock, .out(h10));
	 shift_register greendiag11_1(.load, .data({2'b00,GrnPixels[14][00],GrnPixels[13][01],GrnPixels[12][02],GrnPixels[11][03],GrnPixels[10][04],GrnPixels[09][05],GrnPixels[08][06],GrnPixels[07][07],GrnPixels[06][08],GrnPixels[05][09],GrnPixels[04][10],GrnPixels[03][11],GrnPixels[02][12],GrnPixels[01][13]}), .reset, .clock, .out(h11));
	 shift_register greendiag12_1(.load, .data({1'b00,GrnPixels[15][00],GrnPixels[14][01],GrnPixels[13][02],GrnPixels[12][03],GrnPixels[11][04],GrnPixels[10][05],GrnPixels[09][06],GrnPixels[08][07],GrnPixels[07][08],GrnPixels[06][09],GrnPixels[05][10],GrnPixels[04][11],GrnPixels[03][12],GrnPixels[02][13],GrnPixels[01][14]}), .reset, .clock, .out(h12));
	 
	 
	 
	 
	 shift_register greendiag13_1(.load, .data({1'b0,GrnPixels[15][01],GrnPixels[14][02],GrnPixels[13][03],GrnPixels[12][04],GrnPixels[11][05],GrnPixels[10][06],GrnPixels[09][07],GrnPixels[08][08],GrnPixels[07][09],GrnPixels[06][10],GrnPixels[05][11],GrnPixels[04][12],GrnPixels[03][13],GrnPixels[02][14],GrnPixels[01][15]}), .reset, .clock, .out(h13));
	 shift_register greendiag14_1(.load, .data({2'b00,GrnPixels[15][02],GrnPixels[14][03],GrnPixels[13][04],GrnPixels[12][05],GrnPixels[11][06],GrnPixels[10][07],GrnPixels[09][08],GrnPixels[08][09],GrnPixels[07][10],GrnPixels[06][11],GrnPixels[05][12],GrnPixels[04][13],GrnPixels[03][14],GrnPixels[02][15]}), .reset, .clock, .out(h14));
	 shift_register greendiag15_1(.load, .data({3'b000,GrnPixels[15][03],GrnPixels[14][04],GrnPixels[13][05],GrnPixels[12][06],GrnPixels[11][07],GrnPixels[10][08],GrnPixels[09][09],GrnPixels[08][10],GrnPixels[07][11],GrnPixels[06][12],GrnPixels[05][13],GrnPixels[04][14],GrnPixels[03][15]}), .reset, .clock, .out(h15));
	 shift_register greendiag16_1(.load, .data({4'b0000,GrnPixels[15][04],GrnPixels[14][05],GrnPixels[13][06],GrnPixels[12][07],GrnPixels[11][08],GrnPixels[10][09],GrnPixels[09][10],GrnPixels[08][11],GrnPixels[07][12],GrnPixels[06][13],GrnPixels[05][14],GrnPixels[04][15]}), .reset, .clock, .out(h16));
	 shift_register greendiag17_1(.load, .data({5'b00000,GrnPixels[15][05],GrnPixels[14][06],GrnPixels[13][07],GrnPixels[12][08],GrnPixels[11][09],GrnPixels[10][10],GrnPixels[09][11],GrnPixels[08][12],GrnPixels[07][13],GrnPixels[06][14],GrnPixels[05][15]}), .reset, .clock, .out(h17));
	 shift_register greendiag18_1(.load, .data({6'b000000,GrnPixels[15][06],GrnPixels[14][07],GrnPixels[13][08],GrnPixels[12][09],GrnPixels[11][10],GrnPixels[10][11],GrnPixels[09][12],GrnPixels[08][13],GrnPixels[07][14],GrnPixels[06][15]}), .reset, .clock, .out(h18));
	 shift_register greendiag19_1(.load, .data({7'b0000000,GrnPixels[15][07],GrnPixels[14][08],GrnPixels[13][09],GrnPixels[12][10],GrnPixels[11][11],GrnPixels[10][12],GrnPixels[09][13],GrnPixels[08][14],GrnPixels[07][15]}), .reset, .clock, .out(h19));
	 shift_register greendiag20_1(.load, .data({8'b00000000,GrnPixels[15][08],GrnPixels[14][09],GrnPixels[13][10],GrnPixels[12][11],GrnPixels[11][12],GrnPixels[10][13],GrnPixels[09][14],GrnPixels[08][15]}), .reset, .clock, .out(h20));
	 shift_register greendiag21_1(.load, .data({9'b000000000,GrnPixels[15][09],GrnPixels[14][10],GrnPixels[13][11],GrnPixels[12][12],GrnPixels[11][13],GrnPixels[10][14],GrnPixels[09][15]}), .reset, .clock, .out(h21));
	 shift_register greendiag22_1(.load, .data({10'b0000000000,GrnPixels[15][10],GrnPixels[14][11],GrnPixels[13][12],GrnPixels[12][13],GrnPixels[11][14],GrnPixels[10][15]}), .reset, .clock, .out(h22));
	 shift_register greendiag23_1(.load, .data({11'b00000000000,GrnPixels[15][11],GrnPixels[14][12],GrnPixels[13][13],GrnPixels[12][14],GrnPixels[11][15]}), .reset, .clock, .out(h23));
	 shift_register greendiag24_1(.load, .data({12'b000000000000,GrnPixels[15][12],GrnPixels[14][13],GrnPixels[13][14],GrnPixels[12][15]}), .reset, .clock, .out(h24));
	
	 
	 
	 logic w,z0,z1,z2,z3,z4,z5,z6,z7,z8,z9,z10,z11,z12,z13,z14,z15, t0,t1,t2,t3,t4,t5,t6,t7,t8,t9,t10,t11,t12,t13,t14,t15, m0,m1,m2,m3,m4,m5,m6,m7,m8,m9,m10,m11,m12,m13,m14,m15,n0,n1,n2,n3,n4,n5,n6,n7,n8,n9,n10,n11,n12,n13,n14,n15,k1,k2,k3,k4,k5,k6,k7,k8,k9,k10,k11,k12,k13,k14,k15,k16,k17,k18,k19,k20,k21,k22,k23,k24, l1,l2,l3,l4,l5,l6,l7,l8,l9,l10,l11,l12,l13,l14,l15,l16,l17,l18,l19,l20,l21,l22,l23,l24, p1,p2,p3,p4,p5,p6,p7,p8,p9,p10,p11,p12,p13,p14,p15,p16,p17,p18,p19,p20,p21,p22,p23,p24,y0,y1,y2,y3,y4,y5,y6,y7,y8,y9,y10,y11,y12,y13,y14,y15,y16,y17,y18,y19,y20,y21,y22,y23,y24;
	 //or n1(w,a0,a1,a2,a3,a4,a5,a6,a7,a8,a9,a10,a11,a12,a13,a14,a15,b0,b1,b2,b3,b4,b5,b6,b7,b8,b9,b10,b11,b12,b13,b14,b15,c0,c1,c2,c3,c4,c5,c6,c7,c8,c9,c10,c11,c12,c13,c14,c15,d0,d1,d2,d3,d4,d5,d6,d7,d8,d9,d10,d11,d12,d13,d14,d15);
	 winner_detection win0(.data(a0), .clock, .reset, .out(z0));
	 winner_detection win1(.data(a1), .clock, .reset, .out(z1));
	 winner_detection win2(.data(a2), .clock, .reset, .out(z2));
	 winner_detection win3(.data(a3), .clock, .reset, .out(z3));
	 winner_detection win4(.data(a4), .clock, .reset, .out(z4));
	 winner_detection win5(.data(a5), .clock, .reset, .out(z5));
	 winner_detection win6(.data(a6), .clock, .reset, .out(z6));
	 winner_detection win7(.data(a7), .clock, .reset, .out(z7));
	 winner_detection win8(.data(a8), .clock, .reset, .out(z8));
	 winner_detection win9(.data(a9), .clock, .reset, .out(z9));
	 winner_detection win10(.data(a10), .clock, .reset, .out(z10));
	 winner_detection win11(.data(a11), .clock, .reset, .out(z11));
	 winner_detection win12(.data(a12), .clock, .reset, .out(z12));
	 winner_detection win13(.data(a13), .clock, .reset, .out(z13));
	 winner_detection win14(.data(a14), .clock, .reset, .out(z14));
	 //winner_detection win15(.data(a15), .clock, .reset, .out(z15));
	 
	 winner_detection win0_1(.data(b0), .clock, .reset, .out(t0));
	 winner_detection win1_1(.data(b1), .clock, .reset, .out(t1));
	 winner_detection win2_1(.data(b2), .clock, .reset, .out(t2));
	 winner_detection win3_1(.data(b3), .clock, .reset, .out(t3));
	 winner_detection win4_1(.data(b4), .clock, .reset, .out(t4));
	 winner_detection win5_1(.data(b5), .clock, .reset, .out(t5));
	 winner_detection win6_1(.data(b6), .clock, .reset, .out(t6));
	 winner_detection win7_1(.data(b7), .clock, .reset, .out(t7));
	 winner_detection win8_1(.data(b8), .clock, .reset, .out(t8));
	 winner_detection win9_1(.data(b9), .clock, .reset, .out(t9));
	 winner_detection win10_1(.data(b10), .clock, .reset, .out(t10));
	 winner_detection win11_1(.data(b11), .clock, .reset, .out(t11));
	 winner_detection win12_1(.data(b12), .clock, .reset, .out(t12));
	 winner_detection win13_1(.data(b13), .clock, .reset, .out(t13));
	 winner_detection win14_1(.data(b14), .clock, .reset, .out(t14));
	 //winner_detection win15_1(.data(b15), .clock, .reset, .out(t15));
	 
	 winner_detection win0_2(.data(c0), .clock, .reset, .out(m0));
	 winner_detection win1_2(.data(c1), .clock, .reset, .out(m1));
	 winner_detection win2_2(.data(c2), .clock, .reset, .out(m2));
	 winner_detection win3_2(.data(c3), .clock, .reset, .out(m3));
	 winner_detection win4_2(.data(c4), .clock, .reset, .out(m4));
	 winner_detection win5_2(.data(c5), .clock, .reset, .out(m5));
	 winner_detection win6_2(.data(c6), .clock, .reset, .out(m6));
	 winner_detection win7_2(.data(c7), .clock, .reset, .out(m7));
	 winner_detection win8_2(.data(c9), .clock, .reset, .out(m8));
	 winner_detection win9_2(.data(c9), .clock, .reset, .out(m9));
	 winner_detection win10_2(.data(c10), .clock, .reset, .out(m10));
	 winner_detection win11_2(.data(c11), .clock, .reset, .out(m11));
	 winner_detection win12_2(.data(c12), .clock, .reset, .out(m12));
	 winner_detection win13_2(.data(c13), .clock, .reset, .out(m13));
	 winner_detection win14_2(.data(c14), .clock, .reset, .out(m14));
	 winner_detection win15_2(.data(c15), .clock, .reset, .out(m15));
	 
	 winner_detection win0_3(.data(d0), .clock, .reset, .out(n0));
	 winner_detection win1_3(.data(d1), .clock, .reset, .out(n1));
	 winner_detection win2_3(.data(d2), .clock, .reset, .out(n2));
	 winner_detection win3_3(.data(d3), .clock, .reset, .out(n3));
	 winner_detection win4_3(.data(d4), .clock, .reset, .out(n4));
	 winner_detection win5_3(.data(d5), .clock, .reset, .out(n5));
	 winner_detection win6_3(.data(d6), .clock, .reset, .out(n6));
	 winner_detection win7_3(.data(d7), .clock, .reset, .out(n7));
	 winner_detection win8_3(.data(d9), .clock, .reset, .out(n8));
	 winner_detection win9_3(.data(d9), .clock, .reset, .out(n9));
	 winner_detection win10_3(.data(d10), .clock, .reset, .out(n10));
	 winner_detection win11_3(.data(d11), .clock, .reset, .out(n11));
	 winner_detection win12_3(.data(d12), .clock, .reset, .out(n12));
	 winner_detection win13_3(.data(d13), .clock, .reset, .out(n13));
	 winner_detection win14_3(.data(d14), .clock, .reset, .out(n14));
	 winner_detection win15_3(.data(d15), .clock, .reset, .out(n15));
	 
	 //winner_detection win0_4(.data(e0), .clock, .reset, .out(k0));
	 winner_detection win1_4(.data(e1), .clock, .reset, .out(k1));
	 winner_detection win2_4(.data(e2), .clock, .reset, .out(k2));
	 winner_detection win3_4(.data(e3), .clock, .reset, .out(k3));
	 winner_detection win4_4(.data(e4), .clock, .reset, .out(k4));
	 winner_detection win5_4(.data(e5), .clock, .reset, .out(k5));
	 winner_detection win6_4(.data(e6), .clock, .reset, .out(k6));
	 winner_detection win7_4(.data(e7), .clock, .reset, .out(k7));
	 winner_detection win8_4(.data(e9), .clock, .reset, .out(k8));
	 winner_detection win9_4(.data(e9), .clock, .reset, .out(k9));
	 winner_detection win10_4(.data(e10), .clock, .reset, .out(k10));
	 winner_detection win11_4(.data(e11), .clock, .reset, .out(k11));
	 winner_detection win12_4(.data(e12), .clock, .reset, .out(k12));
	 winner_detection win13_4(.data(e13), .clock, .reset, .out(k13));
	 winner_detection win14_4(.data(e14), .clock, .reset, .out(k14));
	 winner_detection win15_4(.data(e15), .clock, .reset, .out(k15));
	 winner_detection win16_4(.data(e16), .clock, .reset, .out(k16));
	 winner_detection win17_4(.data(e17), .clock, .reset, .out(k17));
	 winner_detection win18_4(.data(e18), .clock, .reset, .out(k18));
	 winner_detection win19_4(.data(e19), .clock, .reset, .out(k19));
	 winner_detection win20_4(.data(e20), .clock, .reset, .out(k20));
	 winner_detection win21_4(.data(e21), .clock, .reset, .out(k21));
	 winner_detection win22_4(.data(e22), .clock, .reset, .out(k22));
	 winner_detection win23_4(.data(e23), .clock, .reset, .out(k23));
	 winner_detection win24_4(.data(e24), .clock, .reset, .out(k24));
	 
	 winner_detection win1_5(.data(f1), .clock, .reset, .out(l1));
	 winner_detection win2_5(.data(f2), .clock, .reset, .out(l2));
	 winner_detection win3_5(.data(f3), .clock, .reset, .out(l3));
	 winner_detection win4_5(.data(f4), .clock, .reset, .out(l4));
	 winner_detection win5_5(.data(f5), .clock, .reset, .out(l5));
	 winner_detection win6_5(.data(f6), .clock, .reset, .out(l6));
	 winner_detection win7_5(.data(f7), .clock, .reset, .out(l7));
	 winner_detection win8_5(.data(f9), .clock, .reset, .out(l8));
	 winner_detection win9_5(.data(f9), .clock, .reset, .out(l9));
	 winner_detection win10_5(.data(f10), .clock, .reset, .out(l10));
	 winner_detection win11_5(.data(f11), .clock, .reset, .out(l11));
	 winner_detection win12_5(.data(f12), .clock, .reset, .out(l12));
	 winner_detection win13_5(.data(f13), .clock, .reset, .out(l13));
	 winner_detection win14_5(.data(f14), .clock, .reset, .out(l14));
	 winner_detection win15_5(.data(f15), .clock, .reset, .out(l15));
	 winner_detection win16_5(.data(f16), .clock, .reset, .out(l16));
	 winner_detection win17_5(.data(f17), .clock, .reset, .out(l17));
	 winner_detection win18_5(.data(f18), .clock, .reset, .out(l18));
	 winner_detection win19_5(.data(f19), .clock, .reset, .out(l19));
	 winner_detection win20_5(.data(f20), .clock, .reset, .out(l20));
	 winner_detection win21_5(.data(f21), .clock, .reset, .out(l21));
	 winner_detection win22_5(.data(f22), .clock, .reset, .out(l22));
	 winner_detection win23_5(.data(f23), .clock, .reset, .out(l23));
	 winner_detection win24_5(.data(f24), .clock, .reset, .out(l24));
	 
	 winner_detection win1_6(.data(g1), .clock, .reset, .out(p1));
	 winner_detection win2_6(.data(g2), .clock, .reset, .out(p2));
	 winner_detection win3_6(.data(g3), .clock, .reset, .out(p3));
	 winner_detection win4_6(.data(g4), .clock, .reset, .out(p4));
	 winner_detection win5_6(.data(g5), .clock, .reset, .out(p5));
	 winner_detection win6_6(.data(g6), .clock, .reset, .out(p6));
	 winner_detection win7_6(.data(g7), .clock, .reset, .out(p7));
	 winner_detection win8_6(.data(g9), .clock, .reset, .out(p8));
	 winner_detection win9_6(.data(g9), .clock, .reset, .out(p9));
	 winner_detection win10_6(.data(g10), .clock, .reset, .out(p10));
	 winner_detection win11_6(.data(g11), .clock, .reset, .out(p11));
	 winner_detection win12_6(.data(g12), .clock, .reset, .out(p12));
	 winner_detection win13_6(.data(g13), .clock, .reset, .out(p13));
	 winner_detection win14_6(.data(g14), .clock, .reset, .out(p14));
	 winner_detection win15_6(.data(g15), .clock, .reset, .out(p15));
	 winner_detection win16_6(.data(g16), .clock, .reset, .out(p16));
	 winner_detection win17_6(.data(g17), .clock, .reset, .out(p17));
	 winner_detection win18_6(.data(g18), .clock, .reset, .out(p18));
	 winner_detection win19_6(.data(g19), .clock, .reset, .out(p19));
	 winner_detection win20_6(.data(g20), .clock, .reset, .out(p20));
	 winner_detection win21_6(.data(g21), .clock, .reset, .out(p21));
	 winner_detection win22_6(.data(g22), .clock, .reset, .out(p22));
	 winner_detection win23_6(.data(g23), .clock, .reset, .out(p23));
	 winner_detection win24_6(.data(g24), .clock, .reset, .out(p24));

	 winner_detection win1_7(.data(h1), .clock, .reset, .out(y1));
	 winner_detection win2_7(.data(h2), .clock, .reset, .out(y2));
	 winner_detection win3_7(.data(h3), .clock, .reset, .out(y3));
	 winner_detection win4_7(.data(h4), .clock, .reset, .out(y4));
	 winner_detection win5_7(.data(h5), .clock, .reset, .out(y5));
	 winner_detection win6_7(.data(h6), .clock, .reset, .out(y6));
	 winner_detection win7_7(.data(h7), .clock, .reset, .out(y7));
	 winner_detection win8_7(.data(h9), .clock, .reset, .out(y8));
	 winner_detection win9_7(.data(h9), .clock, .reset, .out(y9));
	 winner_detection win10_7(.data(h10), .clock, .reset, .out(y10));
	 winner_detection win11_7(.data(h11), .clock, .reset, .out(y11));
	 winner_detection win12_7(.data(h12), .clock, .reset, .out(y12));
	 winner_detection win13_7(.data(h13), .clock, .reset, .out(y13));
	 winner_detection win14_7(.data(h14), .clock, .reset, .out(y14));
	 winner_detection win15_7(.data(h15), .clock, .reset, .out(y15));
	 winner_detection win16_7(.data(h16), .clock, .reset, .out(y16));
	 winner_detection win17_7(.data(h17), .clock, .reset, .out(y17));
	 winner_detection win18_7(.data(h18), .clock, .reset, .out(y18));
	 winner_detection win19_7(.data(h19), .clock, .reset, .out(y19));
	 winner_detection win20_7(.data(h20), .clock, .reset, .out(y20));
	 winner_detection win21_7(.data(h21), .clock, .reset, .out(y21));
	 winner_detection win22_7(.data(h22), .clock, .reset, .out(y22));
	 winner_detection win23_7(.data(h23), .clock, .reset, .out(y23));
	 winner_detection win24_7(.data(h24), .clock, .reset, .out(y24));
	 
	 or gate1(w,z0,z1,z2,z3,z4,z5,z6,z7,z8,z9,z10,z11,z12,z13,z14,m0,m1,m2,m3,m4,m5,m6,m7,m8,m9,m10,m11,m12,m13,m14,m15,k1,k2,k3,k4,k5,k6,k7,k8,k9,k10,k11,k12,k13,k14,k15,k16,k17,k18,k19,k20,k21,k22,k23,k24,p1,p2,p3,p4,p5,p6,p7,p8,p9,p10,p11,p12,p13,p14,p15,p16,p17,p18,p19,p20,p21,p22,p23,p24);
	 or gate2(s,t0,t1,t2,t3,t4,t5,t6,t7,t8,t9,t10,t11,t12,t13,t14,n0,n1,n2,n3,n4,n5,n6,n7,n8,n9,n10,n11,n12,n13,n14,n15,l1,l2,l3,l4,l5,l6,l7,l8,l9,l10,l11,l12,l13,l14,l15,l16,l17,l18,l19,l20,l21,l22,l23,l24,y1,y2,y3,y4,y5,y6,y7,y8,y9,y10,y11,y12,y13,y14,y15,y16,y17,y18,y19,y20,y21,y22,y23,y24);
	display displ(.red(w),.green(s),.HEX0, .reset, .clock);

endmodule


module LED_test_testbench();

	logic reset, RK, LK, clock, key, CLOCK_50;
	logic [15:0][15:0] RedPixels, GrnPixels;
	logic [6:0] HEX0;
	
	  assign clock = CLOCK_50;
	
	LED_test dut (reset, RedPixels, GrnPixels, RK, LK, key, clock, HEX0);

   
 // Set up a simulated clock.   
 parameter CLOCK_PERIOD=100;  
 initial begin   
  CLOCK_50 <= 0;  
  forever #(CLOCK_PERIOD/2) CLOCK_50 <= ~CLOCK_50; // Forever toggle the clock 
 end  
 
 initial begin   
  reset <= 0;     repeat(1) @(posedge CLOCK_50);  
  reset <= 1;     repeat(1) @(posedge CLOCK_50); // Always reset FSMs at start  
  reset <= 0;     repeat(1) @(posedge CLOCK_50); 
  RK    <= 0;     repeat(1) @(posedge CLOCK_50); 
  LK    <= 0;     repeat(1) @(posedge CLOCK_50);
  key   <= 0;     repeat(16) @(posedge CLOCK_50);
  //game starts
  key   <= 1;     repeat(1) @(posedge CLOCK_50); 
  key   <= 0;     repeat(16) @(posedge CLOCK_50);
  RK    <= 1;     repeat(1) @(posedge CLOCK_50);  
  RK    <= 0;     repeat(4) @(posedge CLOCK_50);
  key   <= 1;     repeat(1) @(posedge CLOCK_50); 
  key   <= 0;     repeat(16) @(posedge CLOCK_50);
  RK    <= 1;     repeat(1) @(posedge CLOCK_50);  
  RK    <= 0;     repeat(4) @(posedge CLOCK_50);
  key   <= 1;     repeat(1) @(posedge CLOCK_50); 
  key   <= 0;     repeat(16) @(posedge CLOCK_50); 
  
  RK    <= 1;     repeat(2) @(posedge CLOCK_50); 
  RK    <= 0;     repeat(1) @(posedge CLOCK_50); 
  key   <= 1;     repeat(1) @(posedge CLOCK_50); 
  key   <= 0;     repeat(16) @(posedge CLOCK_50);
  
  RK    <= 1;     repeat(2) @(posedge CLOCK_50); 
  RK    <= 0;     repeat(1) @(posedge CLOCK_50);
  key   <= 1;     repeat(1) @(posedge CLOCK_50); 
  key   <= 0;     repeat(16) @(posedge CLOCK_50); 
  
  RK    <= 1;     repeat(2) @(posedge CLOCK_50); 
  RK    <= 0;     repeat(1) @(posedge CLOCK_50); 
  key   <= 1;     repeat(1) @(posedge CLOCK_50); 
  key   <= 0;     repeat(16) @(posedge CLOCK_50);
  
  RK    <= 1;     repeat(3) @(posedge CLOCK_50); 
  RK    <= 0;     repeat(1) @(posedge CLOCK_50); 
  key   <= 1;     repeat(1) @(posedge CLOCK_50); 
  key   <= 0;     repeat(16) @(posedge CLOCK_50);
  RK    <= 1;     repeat(3) @(posedge CLOCK_50); 
  RK    <= 0;     repeat(1) @(posedge CLOCK_50);
  key   <= 1;     repeat(1) @(posedge CLOCK_50); 
  key   <= 0;     repeat(16) @(posedge CLOCK_50);
  RK    <= 1;     repeat(7) @(posedge CLOCK_50);  
  RK    <= 0;     repeat(1) @(posedge CLOCK_50);
 
  key   <= 1;     repeat(1) @(posedge CLOCK_50); 
  key   <= 0;     repeat(32) @(posedge CLOCK_50);
  $stop; // End the simulation.  
 end  
 
	
endmodule
