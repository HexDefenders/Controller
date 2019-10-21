module controller (gpins, volts);
	input	 [35:0] 	gpins;
	output [1:0]	volts;

	// red, yellow
	assign volts[0] = 1'b1; // 1.8 output voltage always on (GPIO pin)
	
	// blue, green, white
	assign volts[1] = 1'b1; // 3.0 output voltage always on (GPIO pin)
	
	// gpins[8:0] (red)
	single_controller rctrl (.volts(volts[0]), .sw(gpins[7:0]), .btn(gpins[8]));
	// gpins[17:9]
	// gpins[26:18]
	// gpins[35:27]
	
endmodule 



module single_controller(volts, sw, btn);
	input			 volts;
	output 		 btn;
	output [7:0] sw;
	
endmodule
   