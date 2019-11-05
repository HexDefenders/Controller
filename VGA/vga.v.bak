module vga (clk, rst, hsync, vsync, vga_blank_n, vga_clk, switches, r, g, b);
	input		    clk, rst;
	input	 [9:0] switches;
	output		 hsync, vsync, vga_blank_n, vga_clk;
	output [7:0] r, g, b;
	
	wire	 [9:0] hcount, vcount;
	wire   [2:0] lout, rout;
	wire 			 bright;
	
	vga_control uut1 (
		.clk(clk), .rst(rst), .hsync(hsync), .vsync(vsync),
		.vga_blank_n(vga_blank_n), .vga_clk(vga_clk), .bright(bright),
		.hcount(hcount), .vcount(vcount)
	);

//	bitgen1 uut2 (
//		.bright(bright), .switches(switches[7:0]), .r(r), .g(g), .b(b)
//	);
	
	bitgen2 uut3 (
		.bright(bright), .lin(lout), .hcount(hcount), .vcount(vcount), .rin(rout), .r(r), .g(g), .b(b)
	);


	tbird_fsm uut4 (
		.Clk(clk), .Rst(rst), 
		.Left(switches[1]), .Right(switches[0]), .Haz(switches[9]), .L(lout), .R(rout)
	);
endmodule
