


module tb;

	// Inputs
	reg clock;
	reg Btn1;

	// Outputs
	wire Horizonatalsync;
	wire Verticalsync;
	wire [2:0] red;
	wire [2:0] green;
	wire [1:0] blue;

	// Instantiate the Unit Under Test (UUT)
	VGALPTop uut (
		.clock(clock), 
		.Btn1(Btn1), 
		.Horizonatalsync(Horizonatalsync), 
		.Verticalsync(Verticalsync), 
		.red(red), 
		.green(green), 
		.blue(blue)
	);
	always #1 clock=!clock;
	initial begin
		// Initialize Inputs
		clock = 0;
		Btn1 = 0;

		// Wait 100 ns for global reset to finish
		#100;
		#10;
		Btn1 = 1;
		#10;
		Btn1 = 0;
