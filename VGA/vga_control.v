module vga_control (clk, rst, vga_blank_n, hsync, vsync, vga_clk, bright, hcount, vcount);
	input			clk, rst;
	output		hsync, vsync;
	output reg	vga_blank_n, vga_clk, bright;
	
	// size of registers log2(800) ~ 10
	//							log2(525) ~ 10
	output reg [9:0] hcount, vcount;
	reg		 counter;
	
	parameter HS_START = 10'd16;
	parameter HS_SYNC  = 10'd96;
	parameter HS_END   = 10'd48;
	parameter HS_TOTAL = 10'd800;
	
	parameter VS_INIT  = 10'd480;
	parameter VS_START = 10'd10;
	parameter VS_SYNC  = 10'd2;
	parameter VS_END   = 10'd33;
	parameter VS_TOTAL = 10'd525;

	always @(posedge clk) begin
		if (rst == 1'b0) begin
			vcount  = 10'd0; 	
			hcount  = 10'd0;
			counter = 1'b0; 	
			vga_clk = 1'b0;
		end
		
		else if (counter == 1'b1) begin
			hcount = hcount + 1'b1;
			if (hcount == HS_TOTAL) begin
				hcount = 10'd0;
				vcount = vcount + 1'b1;
				if (vcount == VS_TOTAL)
					vcount = 10'd0;
			end
		end
		
		vga_clk = ~vga_clk;
		counter = counter + 1'b1;
	end
	
	assign hsync = ~((hcount >= HS_START) & (hcount < HS_START + HS_SYNC));
	
	assign vsync = ~((vcount >= VS_INIT + VS_START) & (vcount < VS_INIT + VS_START + VS_SYNC));
	
	always @(*) begin
		// bright
		if ((hcount >= HS_START + HS_SYNC + HS_END)
					&& (hcount < HS_TOTAL - HS_START) 
					&& (vcount < VS_INIT)) begin
			bright = 1'b1;
			vga_blank_n = 1'b1;
		end
		
		else begin
			bright = 1'b0;
			vga_blank_n = 1'b0;
		end
	end
	
endmodule
