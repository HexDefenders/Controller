module bitgen(bright, hcount, vcount, glyph, rgb);
	input  			   bright;
	input  	  [9:0]  hcount, vcount;
	input  	  [63:0] glyph;
	output reg [23:0] rgb;
	
	reg [23:0] rgbout;
	reg [9:0]  xoffset, yoffset;
	
	// split glyph so it's 2D for easy parsing
	wire [7:0] lglyph [7:0];
	assign lglyph[0] = glyph[63:56];
	assign lglyph[1] = glyph[55:48];
	assign lglyph[2] = glyph[47:40];
	assign lglyph[3] = glyph[39:32];
	assign lglyph[4] = glyph[31:24];
	assign lglyph[5] = glyph[23:16];
	assign lglyph[6] = glyph[15:8];
	assign lglyph[7] = glyph[7:0];
	
	// colors
	parameter rgb_bg = 24'hf8f9fa;
	parameter rgb_text = 24'h343a40;
	
	// display area
	parameter x_start = 10'd300;
	parameter y_start = 10'd400;
	parameter x_size  = 10'd16; // exact match to size of glyph projection width
	parameter y_size  = 10'd16; // exact match to size of glyph projection height
	parameter t_size  = 2;  	 // i.e. doubling size
	
	always @(*) begin
		rgbout <= rgb_bg;
		
		// normal size
		if (hcount >= y_start && hcount < (y_start + y_size)) begin
			if (vcount >= x_start && vcount < (x_start + x_size)) begin
				if (lglyph[vcount-x_start][hcount-y_start] == 1'b1)
					rgbout <= rgb_text;
			end
		end
		
//		// double size
//		if (hcount >= y_start && hcount < (y_start + y_size)) begin
//			if (vcount >= x_start && vcount < (x_start + x_size)) begin
//				if (lglyph[vcount-x_start][hcount-y_start] == 1'b1) begin
//					rgbout <= rgb_text;
//				end
//			end
//		end
		
		if (bright == 1)
			rgb <= rgbout;
		else
			rgb <= rgb_bg;
	end
	
endmodule
