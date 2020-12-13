`timescale 1ns / 1ps
module VGA_module(
 input clk,
 input sw,
 output reg Horizonatalsync = 0, 
 output reg Verticalsync = 0,
 output reg [3:0] red ,
 output reg[3:0] green ,
 output reg[3:0] blue,
output reg LED
 );
  
//assign LED = sw;

 wire enablev;
 wire[15:0] hcount; 
 wire[15:0] vcount; 
 
 
 Hor_Counter horis (
     .clk_slow(clk_slow),
     .enablev(enablev),
     .hcount(hcount),
	  .clk(clk)
 );
 
 Vertical_Counter vertic (
     .clk_slow(clk_slow),
     .enablev(enablev),
     .vcount(vcount),
	  .clk(clk)
 );


	always @(posedge clk_slow) begin 
    
        if(sw)begin
        LED = 0;
                Horizonatalsync= ( hcount <128) ? 1'b1:1'b0;
                Verticalsync= ( vcount <4) ? 1'b1:1'b0;
            
                red = ( hcount <1140 && hcount >180&& vcount <665 && vcount>30) ? 15:6;
                blue =( hcount <1140 && hcount >180 && vcount <665 && vcount>30) ? 15:6;
                green =( hcount <1140  && hcount >180 && vcount <665 && vcount>30) ? 15:6;
                end

		else begin 
		LED = 1;
                  Horizonatalsync= ( hcount <128) ? 1'b1:1'b0;
                  Verticalsync= ( vcount <4) ? 1'b1:1'b0;
	
	             //  if(hcount <1140 && hcount >180&& vcount <665 && vcount>30) 
                 //  begin
                  //  red = 15; blue = 0; green = 0;
                  // end 
			red= ( hcount <1040 && hcount >180&& vcount <665 && vcount>30) ? 15:0;
			blue=( hcount <1040 && hcount >180 && vcount <665 && vcount>30) ? 1:0;
			green=( hcount <1040  && hcount >180 && vcount <665 && vcount>30) ? 1:0;
			end
		
	end



endmodule
