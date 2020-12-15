module uart_rx(

	input clk, 
	input nRST, 
	input rx_input_data,
	output reg [1:0] rx_state,
	output reg rx


); 

	parameter 	IDLE_ST 	= 0, START_ST = 1, DATA_ST = 2,STOP_ST = 3; 
					
					
	

	reg [8:0] clk_count = 0 ; 
	reg rx_data = 1'b1 ;
	reg [7:0] rx_store =0 ; 
	reg [2:0] rx_idx = 0 ; 

 
	
	
	always@(*) begin 
			rx_data = rx_input_data ; 
		end
		
	
	always@(posedge clk) begin 
	
	if(!nRST) 
		rx_state <= IDLE_ST ; 
	else 
	
	 begin 
			case (rx_state) 
				IDLE_ST :
				begin 
				rx <= 1;
				clk_count <= 0;
			 
					if(!rx_data) 
						begin 
							rx_state <= START_ST ; 
						end
					else 
						begin 
							rx_state <= IDLE_ST ; 
						end
				end
				START_ST :
				begin 
					rx <= 0 ; 
					if(clk_count == 434)
						begin 
							clk_count <= 0 ; 
							rx_state <= DATA_ST; 
							
						end
					else
						begin 
						clk_count <= clk_count +1 ; 
					
						end
				end 
				
				DATA_ST : 
				begin 
				rx <= rx_data;
				
					if(clk_count == 434)
						begin 
							clk_count <= 0 ; 
							rx_store[rx_idx] <= rx_data ;
								if (rx_idx < 7) 
									begin 
										rx_idx <= rx_idx + 1 ;  
									end
								else 
									begin 
										rx_idx <= 0 ; 
										rx_state <= STOP_ST ;
									end
						end
					else
						begin 
						clk_count <= clk_count +1 ; 
						end
				end 
				
				

			
			
				STOP_ST :
				begin 
					rx <= 1 ;
				 	
					if(clk_count == 434 ) 
					begin 
						clk_count <= 0 ; 
						rx_state <= IDLE_ST ; 
				
					end
					
					else 
						clk_count <= clk_count + 1; 
				end 
				
				default : 
					rx_state <= IDLE_ST ; 
				
				endcase 
			
	end 
	
	end
		

				
				
endmodule 
