`timescale 1ns / 1ps
module VGA_module(
 input clk,
 output reg Horizonatalsync = 0, 
 output reg Verticalsync = 0,
 output reg [3:0] red ,
 output reg[3:0] green ,
 output reg[3:0] blue,
 input [2:0] controllers //rgb on-off
 );
  
//assign LED = sw;

 wire enablev;
 wire[15:0] hcount; 
 wire[15:0] vcount; 
   
 Hor_Counter horis (
     .enablev(enablev),
     .hcount(hcount),
	  .clk(clk),
	  .clk_slow(clk_slow)
 );
 
 Ver_Counter vertic (
     .enablev(enablev),
     .vcount(vcount),
	  .clk(clk)	  
 );
	always @(posedge clk_slow) begin 
        
         Horizonatalsync = ( hcount <128) ? 1 : 0;
         Verticalsync= ( vcount <4) ? 1'b1:1'b0;
         
        //write T
        if((((hcount > 300 && hcount < 500)&& (vcount > 200 && vcount < 250))
        || ((hcount > 375 && hcount < 425) && (vcount > 250 && vcount < 450)))&& controllers[0])
        begin
            red = 0;
            green = 15;
            blue = 0;
        end
        
        //write H
        else if(((((hcount > 550 && hcount < 600) || (hcount > 700 && hcount < 750))  && (vcount > 200 && vcount < 450)) 
        || ((hcount > 600 && hcount < 700) && (vcount > 300 && vcount < 350)))&& controllers[1])
        begin
            red = 15;
            green = 0;
            blue = 0;
        end
        
         //write E
         else if((((hcount > 800 && hcount < 850) && (vcount > 200 && vcount < 450))
         || ((hcount > 850 && hcount < 975)&&((vcount > 400 && vcount < 450)||(vcount > 300 && vcount < 350)||(vcount > 200 && vcount < 250))))&& controllers[2])
               begin
                   red = 0;
                   green = 0;
                   blue = 15;
               end
                 
        else
        begin
            red = 0;
            green = 0;
            blue = 0;
			  
		  end		
	end
endmodule
