`timescale 1ns / 1ps



module Vertical_Counter(
    input clk,
	input enablev,
	output reg [15:0] vcount=0,
	 output wire clk_slow
    );

	clock_divider clock1 (
		.clk_slow(clk_slow),
		.clk(clk)
	);

	 
  always@(posedge clk_slow) 
	begin
     if (enablev== 1) begin
	  if (vcount < 625)
	  vcount<=vcount+1; 
	 else  
		vcount <=0;
end
end 


endmodule