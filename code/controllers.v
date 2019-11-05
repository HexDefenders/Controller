module controllers (gpins, playerInputVal, playerInput, playerInputFlag, switchInput);
	input	     	[35:0]	gpins;
	input		  	[15:0] 	playerInputVal;
	output reg 	 [1:0]	playerInput;
	output reg				playerInputFlag;
	output		 [7:0]	switchInput;
	
	wire [7:0] mux4playeroutput;

	// gpins[8:0]
	single_controller ctrl1 (.sw(gpins[7:0]), .btn(gpins[8]));
	// gpins[17:9]
	single_controller ctrl2 (.sw(gpins[16:9]), .btn(gpins[17]));
	// gpins[26:18]
	single_controller ctrl3 (.sw(gpins[25:18]), .btn(gpins[26]));
	// gpins[35:27]
	single_controller ctrl4 (.sw(gpins[34:27]), .btn(gpins[35]));
	
	// Sensitivity list is all the GPIO pins for the buttons.
	// If any are activated, the playerInput will be swapped in
	// order to process the correct player's pins and sets the 
	// playerInputFlag to 1 in order to use the player's input rather 
	// than the default of all 0's.
	always @(posedge gpins[8], posedge gpins[17], posedge gpins[26], posedge gpins[35]) begin
		if (gpins[8])
			playerInput = 2'b00;
		else if (gpins[17])
			playerInput = 2'b01;
		else if (gpins[26])
			playerInput = 2'b10;
		else
			playerInput = 2'b11;
		playerInputFlag = 1'b1;
	end
	
	mux4 #(8) whichPlayer (
		.d0(gpins[7:0]),			// 00
		.d1(gpins[16:9]), 		// 01
		.d2(gpins[25:18]),		// 10
		.d3(gpins[34:27]), 		// 11
		.s(playerInputFlag), 	// select
		.y(mux4playeroutput)		// output
	);
	
	mux2 #(8) playerOrDefault(
		.d0(8'b0), 					// 0
		.d1(mux4playeroutput), 	// 1
		.s(playerInputVal[0]), 	// select
		.y(switchInput)			// output
	);
		
endmodule 

module single_controller(sw, btn);
	inout 		 btn;
	inout [7:0] sw;
endmodule

module mux4 #(parameter WIDTH = 16)
             (input      [WIDTH-1:0] d0, d1, d2, d3,
              input      [1:0]       s, 
              output reg [WIDTH-1:0] y);

   always @(*)
      case(s)
         2'b00: y <= d0;
         2'b01: y <= d1;
         2'b10: y <= d2;
         2'b11: y <= d3;
      endcase
endmodule

module mux2 #(parameter WIDTH = 16)
             (input  [WIDTH-1:0] d0, d1, 
              input              s, 
              output [WIDTH-1:0] y);

   assign y = s ? d1 : d0; 
endmodule


   