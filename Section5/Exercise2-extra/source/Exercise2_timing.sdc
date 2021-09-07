## Generated SDC file "C:/Users/leandro.santos/Documents/0.Pessoal/0.Pos/FPGA/Learning_FPGA/Section5/Exercise2-extra/source/Exercise2_timing.sdc"

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

## DATE    "Tue Sep 07 20:08:07 2021"

##
## DEVICE  "EP4CE115F29C7"
##


#**************************************************************
# Time Information
#**************************************************************

set_time_format -unit ns -decimal_places 3



#**************************************************************
# Create Clock
#**************************************************************

create_clock -name {rclk} -period 10.000 -waveform { 0.000 5.000 } [get_ports {qh_o qa_o qb_o qc_o qd_o qe_o qf_o qg_o}]
create_clock -name {srclk} -period 40.000 -waveform { 0.000 20.000 } [get_ports {qh1_o}]


#**************************************************************
# Create Generated Clock
#**************************************************************



#**************************************************************
# Set Clock Latency
#**************************************************************



#**************************************************************
# Set Clock Uncertainty
#**************************************************************



#**************************************************************
# Set Input Delay
#**************************************************************

set_input_delay -add_delay  -clock [get_clocks {srclk}]  25.000 [get_ports {oe_n_i}]
set_input_delay -add_delay  -clock [get_clocks {srclk}]  25.000 [get_ports {ser}]
set_input_delay -add_delay  -clock [get_clocks {srclk}]  25.000 [get_ports {srclr_n_i}]


#**************************************************************
# Set Output Delay
#**************************************************************

set_output_delay -add_delay  -clock [get_clocks {rclk}]  37.000 [get_ports {qa_o}]
set_output_delay -add_delay  -clock [get_clocks {rclk}]  37.000 [get_ports {qb_o}]
set_output_delay -add_delay  -clock [get_clocks {rclk}]  37.000 [get_ports {qc_o}]
set_output_delay -add_delay  -clock [get_clocks {rclk}]  37.000 [get_ports {qd_o}]
set_output_delay -add_delay  -clock [get_clocks {rclk}]  37.000 [get_ports {qe_o}]
set_output_delay -add_delay  -clock [get_clocks {rclk}]  37.000 [get_ports {qf_o}]
set_output_delay -add_delay  -clock [get_clocks {rclk}]  37.000 [get_ports {qg_o}]
set_output_delay -add_delay  -clock [get_clocks {rclk}]  37.000 [get_ports {qh1_o}]
set_output_delay -add_delay  -clock [get_clocks {rclk}]  37.000 [get_ports {qh_o}]


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

