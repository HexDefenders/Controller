module controller(clk, led);
	input clk;
	output led;
	integer counter;
	
	always@(posedge clk) begin
		if (counter < 50000)
			counter += 1;
			led = 0;
		else begin
			counter = 0;
			led = 1;
		end	
	end

endmodule 