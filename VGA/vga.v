module vga (clk, rst, hsync, vsync, vga_blank_n, vga_clk, switches, r, g, b);
	input		     clk, rst;
	input	 [3:0]  switches;
	output		  hsync, vsync, vga_blank_n, vga_clk;
	output [7:0]  r, g, b;
	
	wire	 [9:0]  hcount, vcount;
	wire   [2:0]  lout, rout;
	wire 			  bright;
	wire	 [63:0] glyph;
	
	vga_control uut1 (
		.clk(clk), .rst(rst), .hsync(hsync), .vsync(vsync),
		.vga_blank_n(vga_blank_n), .vga_clk(vga_clk), .bright(bright),
		.hcount(hcount), .vcount(vcount)
	);

	glyphs uut2 (
		.clk(clk), .en(1), .value(switches), .glyph(glyph)
	);
	
	bitgen uut3 (
		.bright(bright), .hcount(hcount), .vcount(vcount), .glyph(glyph), .rgb({r,g,b})
	);
	
	
endmodule
