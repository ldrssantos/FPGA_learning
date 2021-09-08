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
set_input_delay -add_delay  -clock [get_clocks {clk_50M}]  0.020 [get_ports {direction}]
set_input_delay -add_delay  -clock [get_clocks {clk_50M}]  0.020 [get_ports {en}]
set_input_delay -add_delay  -clock [get_clocks {clk_50M}]  0.020 [get_ports {shift_register_in}]
set_input_delay -add_delay  -clock [get_clocks {clk_50M}]  0.020 [get_ports {parallel_load_ctrl}]
set_input_delay -add_delay  -clock [get_clocks {clk_50M}]  0.020 [get_ports {data_force_in}]
set_input_delay -add_delay  -clock [get_clocks {clk_50M}]  0.020 [get_ports {data_fix_in[0]}]
set_input_delay -add_delay  -clock [get_clocks {clk_50M}]  0.020 [get_ports {data_fix_in[1]}]
set_input_delay -add_delay  -clock [get_clocks {clk_50M}]  0.020 [get_ports {parallel_data[0]}]
set_input_delay -add_delay  -clock [get_clocks {clk_50M}]  0.020 [get_ports {parallel_data[1]}]
set_input_delay -add_delay  -clock [get_clocks {clk_50M}]  0.020 [get_ports {parallel_data[2]}]
set_input_delay -add_delay  -clock [get_clocks {clk_50M}]  0.020 [get_ports {parallel_data[3]}]
set_input_delay -add_delay  -clock [get_clocks {clk_50M}]  0.020 [get_ports {parallel_data[4]}]
set_input_delay -add_delay  -clock [get_clocks {clk_50M}]  0.020 [get_ports {parallel_data[5]}]
set_input_delay -add_delay  -clock [get_clocks {clk_50M}]  0.020 [get_ports {parallel_data[6]}]
set_input_delay -add_delay  -clock [get_clocks {clk_50M}]  0.020 [get_ports {parallel_data[7]}]
set_input_delay -add_delay  -clock [get_clocks {clk_50M}]  0.020 [get_ports {parallel_data[8]}]
set_input_delay -add_delay  -clock [get_clocks {clk_50M}]  0.020 [get_ports {parallel_data[9]}]
set_input_delay -add_delay  -clock [get_clocks {clk_50M}]  0.020 [get_ports {parallel_data[10]}]
set_input_delay -add_delay  -clock [get_clocks {clk_50M}]  0.020 [get_ports {parallel_data[11]}]
set_input_delay -add_delay  -clock [get_clocks {clk_50M}]  0.020 [get_ports {parallel_data[12]}]
set_input_delay -add_delay  -clock [get_clocks {clk_50M}]  0.020 [get_ports {parallel_data[13]}]
set_input_delay -add_delay  -clock [get_clocks {clk_50M}]  0.020 [get_ports {parallel_data[14]}]
set_input_delay -add_delay  -clock [get_clocks {clk_50M}]  0.020 [get_ports {parallel_data[15]}]
set_input_delay -add_delay  -clock [get_clocks {clk_50M}]  0.020 [get_ports {parallel_data[16]}]
set_input_delay -add_delay  -clock [get_clocks {clk_50M}]  0.020 [get_ports {parallel_data[17]}]
set_input_delay -add_delay  -clock [get_clocks {clk_50M}]  0.020 [get_ports {parallel_data[18]}]
set_input_delay -add_delay  -clock [get_clocks {clk_50M}]  0.020 [get_ports {parallel_data[19]}]
set_input_delay -add_delay  -clock [get_clocks {clk_50M}]  0.020 [get_ports {parallel_data[20]}]
set_input_delay -add_delay  -clock [get_clocks {clk_50M}]  0.020 [get_ports {parallel_data[21]}]
set_input_delay -add_delay  -clock [get_clocks {clk_50M}]  0.020 [get_ports {parallel_data[22]}]
set_input_delay -add_delay  -clock [get_clocks {clk_50M}]  0.020 [get_ports {parallel_data[23]}]
set_input_delay -add_delay  -clock [get_clocks {clk_50M}]  0.020 [get_ports {parallel_data[24]}]
set_input_delay -add_delay  -clock [get_clocks {clk_50M}]  0.020 [get_ports {parallel_data[25]}]
set_input_delay -add_delay  -clock [get_clocks {clk_50M}]  0.020 [get_ports {parallel_data[26]}]
set_input_delay -add_delay  -clock [get_clocks {clk_50M}]  0.020 [get_ports {parallel_data[27]}]
set_input_delay -add_delay  -clock [get_clocks {clk_50M}]  0.020 [get_ports {parallel_data[28]}]
set_input_delay -add_delay  -clock [get_clocks {clk_50M}]  0.020 [get_ports {parallel_data[29]}]
set_input_delay -add_delay  -clock [get_clocks {clk_50M}]  0.020 [get_ports {parallel_data[30]}]
set_input_delay -add_delay  -clock [get_clocks {clk_50M}]  0.020 [get_ports {parallel_data[31]}]
set_input_delay -add_delay  -clock [get_clocks {clk_50M}]  0.020 [get_ports {parallel_data[32]}]
set_input_delay -add_delay  -clock [get_clocks {clk_50M}]  0.020 [get_ports {parallel_data[33]}]
set_input_delay -add_delay  -clock [get_clocks {clk_50M}]  0.020 [get_ports {parallel_data[34]}]
set_input_delay -add_delay  -clock [get_clocks {clk_50M}]  0.020 [get_ports {parallel_data[35]}]


#**************************************************************
# Set Output Delay
#**************************************************************

set_output_delay -add_delay  -clock [get_clocks {clk_50M}]  0.020 [get_ports {shift_register_out}]


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

