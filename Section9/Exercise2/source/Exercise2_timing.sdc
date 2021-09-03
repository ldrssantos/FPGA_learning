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

create_clock -name {clk} -period 20.000 -waveform { 0.000 10.00 } [get_ports {clk}]


#**************************************************************
# Create Generated Clock
#**************************************************************



#**************************************************************
# Set Clock Latency
#**************************************************************



#**************************************************************
# Set Clock Uncertainty
#**************************************************************

set_clock_uncertainty -rise_from [get_clocks {clk}] -rise_to [get_clocks {clk}]  0.020  
set_clock_uncertainty -rise_from [get_clocks {clk}] -fall_to [get_clocks {clk}]  0.020  
set_clock_uncertainty -fall_from [get_clocks {clk}] -rise_to [get_clocks {clk}]  0.020  
set_clock_uncertainty -fall_from [get_clocks {clk}] -fall_to [get_clocks {clk}]  0.020  


set_input_delay -add_delay  -clock [get_clocks {clk}]  0.020 [get_ports {mem3_addr_inout[0]}]
set_input_delay -add_delay  -clock [get_clocks {clk}]  0.020 [get_ports {mem3_addr_inout[1]}]
set_input_delay -add_delay  -clock [get_clocks {clk}]  0.020 [get_ports {mem3_addr_inout[2]}]
set_input_delay -add_delay  -clock [get_clocks {clk}]  0.020 [get_ports {mem3_addr_inout[3]}]
set_input_delay -add_delay  -clock [get_clocks {clk}]  0.020 [get_ports {mem3_addr_inout[4]}]
set_input_delay -add_delay  -clock [get_clocks {clk}]  0.020 [get_ports {mem3_addr_inout[5]}]
set_input_delay -add_delay  -clock [get_clocks {clk}]  0.020 [get_ports {mem3_addr_inout[6]}]
set_input_delay -add_delay  -clock [get_clocks {clk}]  0.020 [get_ports {mem3_addr_inout[7]}]
set_input_delay -add_delay  -clock [get_clocks {clk}]  0.020 [get_ports {mem3_data_inout[0]}]
set_input_delay -add_delay  -clock [get_clocks {clk}]  0.020 [get_ports {mem3_data_inout[1]}]
set_input_delay -add_delay  -clock [get_clocks {clk}]  0.020 [get_ports {mem3_data_inout[2]}]
set_input_delay -add_delay  -clock [get_clocks {clk}]  0.020 [get_ports {mem3_data_inout[3]}]
set_input_delay -add_delay  -clock [get_clocks {clk}]  0.020 [get_ports {mem3_data_inout[4]}]
set_input_delay -add_delay  -clock [get_clocks {clk}]  0.020 [get_ports {mem3_data_inout[5]}]
set_input_delay -add_delay  -clock [get_clocks {clk}]  0.020 [get_ports {mem3_data_inout[6]}]
set_input_delay -add_delay  -clock [get_clocks {clk}]  0.020 [get_ports {mem3_data_inout[7]}]
set_input_delay -add_delay  -clock [get_clocks {clk}]  0.020 [get_ports {mem3_oe_i}]
set_input_delay -add_delay  -clock [get_clocks {clk}]  0.020 [get_ports {mem3_wr_i}]
set_input_delay -add_delay  -clock [get_clocks {clk}]  0.020 [get_ports {rst}]


#**************************************************************
# Set Output Delay
#**************************************************************

set_output_delay -add_delay  -clock [get_clocks {clk}]  0.020 [get_ports {mem3_data_inout[0]}]
set_output_delay -add_delay  -clock [get_clocks {clk}]  0.020 [get_ports {mem3_data_inout[1]}]
set_output_delay -add_delay  -clock [get_clocks {clk}]  0.020 [get_ports {mem3_data_inout[2]}]
set_output_delay -add_delay  -clock [get_clocks {clk}]  0.020 [get_ports {mem3_data_inout[3]}]
set_output_delay -add_delay  -clock [get_clocks {clk}]  0.020 [get_ports {mem3_data_inout[4]}]
set_output_delay -add_delay  -clock [get_clocks {clk}]  0.020 [get_ports {mem3_data_inout[5]}]
set_output_delay -add_delay  -clock [get_clocks {clk}]  0.020 [get_ports {mem3_data_inout[6]}]
set_output_delay -add_delay  -clock [get_clocks {clk}]  0.020 [get_ports {mem3_data_inout[7]}]



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

