`timescale 1ns / 1ps



module Hor_Counter(
 input clk,
 output reg enablev=0,
 output reg [15:0] hcount=0,
  output wire clk_slow
);

clock_divider clock (
		.clk_slow(clk_slow),
		.clk(clk)
	);


always@(posedge clk_slow) 
begin
 if (hcount <1155 )
  begin 
  hcount<=hcount+1; 
  enablev<=0;
    end 
    else begin 
     hcount <=0;
     enablev<=1;
end 
end 


endmodule
