


module tb;

	// Inputs
	reg clk;
	reg [2:0] controllers;

	// Outputs
	wire Horizonatalsync;
	wire Verticalsync;
	wire [3:0] red;
	wire [3:0] green;
	wire [3:0] blue;

	// Instantiate the Unit Under Test (UUT)
	VGA_module uut (
		.clk(clk), 
		.Horizonatalsync(Horizonatalsync), 
		.Verticalsync(Verticalsync), 
		.red(red), 
		.green(green), 
		.blue(blue), 
		.controllers(controllers)
	);
	
	always #1 clk <= !clk;
	initial begin
		// Initialize Inputs
		clk = 0;
		controllers = 7;
	end      
endmodule

