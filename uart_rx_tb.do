#******************************************************************************
#                                                                             *
#                  Copyright (C) 2009 Altera Corporation                      *
#                                                                             *
# ALTERA, ARRIA, CYCLONE, HARDCOPY, MAX, MEGACORE, NIOS, QUARTUS & STRATIX    *
# are Reg. U.S. Pat. & Tm. Off. and Altera marks in and outside the U.S.      *
#                                                                             *
# All information provided herein is provided on an "as is" basis,            *
# without warranty of any kind.                                               *
#                                                                             *
# File Name: counter_tb.do                                                    *
#                                                                             *
# Function: Script file for Introduction to Verilog exercise 4b               *
#                                                                             *
# REVISION HISTORY:                                                           *
#  Revision 1.0    12/15/2009 - Initial Revision  for QII 9.1                 *
#******************************************************************************

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