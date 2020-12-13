`timescale 1ns / 1ps

module clock_divider(
    input clk,
    output clk_slow
    );

	//parameter integer CEIL = 1; //1 in simulation
	
	//reg [7:0] counter = 0;
	reg clk_reg = 0;

	always @(posedge clk) begin
	//	counter <= counter + 1;
	//	if (counter == CEIL) begin
	//		counter <= 0;
	//		clk_reg <= !clk_reg;
	//	end
		clk_reg <= ~clk_reg;
	end

	assign clk_slow = clk_reg;

	//100 mhz -> 
	//50 000 000 -> 1 second. 
	//9600 -> 1 second

endmodule
