`timescale 1 ns / 1 ps

module tb_vga();
	reg 		  clk, rst;
	reg  [3:0] switches;
	reg		  hsync, vsync, vga_blank_n, vga_clk;
	wire [7:0] r, g, b;
	
	integer i = 0;
	
	wire [63:0] e0, e1, e2, e3, e4, e5, e6, e7, e8, e9, ea, eb, ec, ed, ee, ef;
	assign e0 = 64'b0000000000111000010001000100010001000100010001000100010000111000;
	assign e1 = 64'b0000000000100000001000000110000001100000011000000110000001100000;
	assign e2 = 64'b0000000000111000010001000000110000011000001100000110000001111100;
	assign e3 = 64'b0000000000111000010001000000010000011000000001000100010000111000;
	assign e4 = 64'b0000000001000100010001000100010001111100000001000000010000000100;
	assign e5 = 64'b0000000001111100010000000100000001111000000001000000010001111000;
	assign e6 = 64'b0000000000111000010000000100000001011000011001000100010000111000;
	assign e7 = 64'b0000000001111100000001000000100000111100000100000010000001000000;
	assign e8 = 64'b0000000000111000010001000100010000111000010001000100010000111000;
	assign e9 = 64'b0000000000111000010001000100010000111100000001000100010000111000;
	assign ea = 64'b0000000000011000001001000100001001000010011111100100001001000010;
	assign eb = 64'b0000000001111000010001000100010001111000010001000100010001111000;
	assign ec = 64'b0000000000011000001001000100000001000000010000000010010000011000;
	assign ed = 64'b0000000001110000010010000100010001000100010001000100100001110000;
	assign ee = 64'b0000000001111100010000000100000001111000010000000100000001111100;
	assign ef = 64'b0000000001111100010000000100000001111000010000000100000001000000;
	
	vga uut ( .clk(clk), .rst(rst), 
				 .hsync(hsync), .vsync(vsync), 
				 .vga_blank_n(vga_blank_n), .vga_clk(vga_clk), 
				 .switches(switches), .r(r), .g(g), .b(b)     );

	initial begin
	
		$display("Start testing!");
		
		switches = 4'b0;
		rst = 1'b0; #22;
		rst = 1'b1; #40;
		
		for (i = 0; i < 16; i=i+1) begin
			switches = i; #40;
		end
	
	end
	
	// Alternate clock to simulate a clock cycle
	always begin
		clk <= 1; #15;
		clk <= 1; #15;
	end
	
	// Self-checking code
	always @(negedge clk) begin
		case (switches)
			4'h0: if (uut.uut2.glyph != e0)
						$display("Incorrect glyph for switch input: %b\n\tExpected glyph: %b\nResulted glyph %b", switches, e0, uut.uut2.glyph);
			4'h1: if (uut.uut2.glyph != e1)
						$display("Incorrect glyph for switch input: %b\n\tExpected glyph: %b\nResulted glyph %b", switches, e1, uut.uut2.glyph);
			4'h2: if (uut.uut2.glyph != e2)
						$display("Incorrect glyph for switch input: %b\n\tExpected glyph: %b\nResulted glyph %b", switches, e2, uut.uut2.glyph);
			4'h3: if (uut.uut2.glyph != e3)
						$display("Incorrect glyph for switch input: %b\n\tExpected glyph: %b\nResulted glyph %b", switches, e3, uut.uut2.glyph);
			4'h4: if (uut.uut2.glyph != e4)
						$display("Incorrect glyph for switch input: %b\n\tExpected glyph: %b\nResulted glyph %b", switches, e4, uut.uut2.glyph);
			4'h5: if (uut.uut2.glyph != e5)
						$display("Incorrect glyph for switch input: %b\n\tExpected glyph: %b\nResulted glyph %b", switches, e5, uut.uut2.glyph);
			4'h6: if (uut.uut2.glyph != e6)
						$display("Incorrect glyph for switch input: %b\n\tExpected glyph: %b\nResulted glyph %b", switches, e6, uut.uut2.glyph);
			4'h7: if (uut.uut2.glyph != e7)
						$display("Incorrect glyph for switch input: %b\n\tExpected glyph: %b\nResulted glyph %b", switches, e7, uut.uut2.glyph);
			4'h8: if (uut.uut2.glyph != e8)
						$display("Incorrect glyph for switch input: %b\n\tExpected glyph: %b\nResulted glyph %b", switches, e8, uut.uut2.glyph);
			4'h9: if (uut.uut2.glyph != e9)
						$display("Incorrect glyph for switch input: %b\n\tExpected glyph: %b\nResulted glyph %b", switches, e9, uut.uut2.glyph);
			4'ha: if (uut.uut2.glyph != ea)
						$display("Incorrect glyph for switch input: %b\n\tExpected glyph: %b\nResulted glyph %b", switches, ea, uut.uut2.glyph);
			4'hb: if (uut.uut2.glyph != eb)
						$display("Incorrect glyph for switch input: %b\n\tExpected glyph: %b\nResulted glyph %b", switches, eb, uut.uut2.glyph);
			4'hc: if (uut.uut2.glyph != ec)
						$display("Incorrect glyph for switch input: %b\n\tExpected glyph: %b\nResulted glyph %b", switches, ec, uut.uut2.glyph);
			4'hd: if (uut.uut2.glyph != ed)
						$display("Incorrect glyph for switch input: %b\n\tExpected glyph: %b\nResulted glyph %b", switches, ed, uut.uut2.glyph);
			4'he: if (uut.uut2.glyph != ee)
						$display("Incorrect glyph for switch input: %b\n\tExpected glyph: %b\nResulted glyph %b", switches, ee, uut.uut2.glyph);
			4'hf: if (uut.uut2.glyph != ef)
						$display("Incorrect glyph for switch input: %b\n\tExpected glyph: %b\nResulted glyph %b", switches, ef, uut.uut2.glyph);
		endcase
	end
				 
endmodule
