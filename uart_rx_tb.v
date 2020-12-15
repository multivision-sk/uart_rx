

`timescale 1 ns/1 ns

module uart_rx_tb();

	// Wires to connect to DUT
	reg clk;
	reg nRST ; 

	
	reg din ; 

	
	wire rx ; 
	wire [1:0] rx_state ; 
	
	
	
	
	// Instantiate unit under test (counter)
	uart_rx uart_rx1 (.clk(clk),.rx(rx),.rx_input_data(din),.rx_state(rx_state),.nRST(nRST));

	// Process to create clock signal
	initial begin  
		clk = 0;
		nRST = 1; 
		#300 nRST = 0 ;
		#100 nRST = 1 ; 
	end 		
		
		
		
	always 
		clk = #20 ~clk;
		
	
		 
	
	initial 
	begin 
	forever begin 
	din = 0 ; 
	#100 din = 0 ;
	#200 din = 1 ; 
	#1000 din = 0 ;
		end 
	end 
	



endmodule
