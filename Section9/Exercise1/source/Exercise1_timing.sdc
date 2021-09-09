## Generated SDC file "Exercise1_timing.sdc"

## Copyright (C) 2020  Intel Corporation. All rights reserved.
## Your use of Intel Corporation's design tools, logic functions 
## and other software and tools, and any partner logic 
## functions, and any output files from any of the foregoing 
## (including device programming or simulation files), and any 
## associated documentation or information are expressly subject 
## to the terms and conditions of the Intel Program License 
## Subscription Agreement, the Intel Quartus Prime License Agreement,
## the Intel FPGA IP License Agreement, or other applicable license
## agreement, including, without limitation, that your use is for
## the sole purpose of programming logic devices manufactured by
## Intel and sold by Intel or its authorized distributors.  Please
## refer to the applicable agreement for further details, at
## https://fpgasoftware.intel.com/eula.


## VENDOR  "Altera"
## PROGRAM "Quartus Prime"
## VERSION "Version 20.1.1 Build 720 11/11/2020 SJ Lite Edition"

## DATE    "Sat Aug 28 09:06:12 2021"

##
## DEVICE  "10M08DAF484C8G"
##


#**************************************************************
# Time Information
#**************************************************************

set_time_format -unit ns -decimal_places 3



#**************************************************************
# Create Clock
#**************************************************************

create_clock -name {clk_50M} -period 20.000 -waveform { 0.000 10.00 } [get_ports {clk_50M}]


#**************************************************************
# Create Generated Clock
#**************************************************************



#**************************************************************
# Set Clock Latency
#**************************************************************



#**************************************************************
# Set Clock Uncertainty
#**************************************************************

set_clock_uncertainty -rise_from [get_clocks {clk_50M}] -rise_to [get_clocks {clk_50M}]  0.020  
set_clock_uncertainty -rise_from [get_clocks {clk_50M}] -fall_to [get_clocks {clk_50M}]  0.020  
set_clock_uncertainty -fall_from [get_clocks {clk_50M}] -rise_to [get_clocks {clk_50M}]  0.020  
set_clock_uncertainty -fall_from [get_clocks {clk_50M}] -fall_to [get_clocks {clk_50M}]  0.020  


set_input_delay -add_delay  -clock [get_clocks {clk_50M}]  0.020 [get_ports {rst}]
set_input_delay -add_delay  -clock [get_clocks {clk_50M}]  0.020 [get_ports {increment_counter_i}]
set_input_delay -add_delay  -clock [get_clocks {clk_50M}]  0.020 [get_ports {decrement_counter_i}]
set_input_delay -add_delay  -clock [get_clocks {clk_50M}]  0.020 [get_ports {input_enable}]


#**************************************************************
# Set Output Delay
#**************************************************************

set_output_delay -add_delay  -clock [get_clocks {clk_50M}]  0.020 [get_ports {st_machine_debug_o[0]}]
set_output_delay -add_delay  -clock [get_clocks {clk_50M}]  0.020 [get_ports {st_machine_debug_o[1]}]
set_output_delay -add_delay  -clock [get_clocks {clk_50M}]  0.020 [get_ports {st_machine_debug_o[2]}]
set_output_delay -add_delay  -clock [get_clocks {clk_50M}]  0.020 [get_ports {st_machine_debug_o[3]}]
set_output_delay -add_delay  -clock [get_clocks {clk_50M}]  0.020 [get_ports {output_enable}]
set_output_delay -add_delay  -clock [get_clocks {clk_50M}]  0.020 [get_ports {overflow_debug_o}]


#**************************************************************
# Set Clock Groups
#**************************************************************



#**************************************************************
# Set False Path
#**************************************************************



#**************************************************************
# Set Multicycle Path
#**************************************************************



#**************************************************************
# Set Maximum Delay
#**************************************************************



#**************************************************************
# Set Minimum Delay
#**************************************************************



#**************************************************************
# Set Input Transition
#**************************************************************

