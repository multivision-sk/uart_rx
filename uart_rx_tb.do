
vlib work
vlog uart_rx.v uart_rx_tb.v
vsim -t ns work.uart_rx_tb
view wave
add wave -radix binary /clk
add wave -radix binary /nRST
add wave -radix binary /rx_state
add wave -radix binary /rx  
add wave -radix hexadecimal /din 

 

run  1ms
