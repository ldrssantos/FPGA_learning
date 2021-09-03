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

## DATE    "Sat Aug 28 16:30:00 2021"

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
create_clock -name {clk_50M} -period 50.000 -waveform { 0.000 10.00 } [get_ports {clk_50M}]



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
set_input_delay -add_delay -clock [get_clocks {clk_50M}] 0.020 [get_ports {rst}]
set_input_delay -add_delay -clock [get_clocks {clk_50M}] 0.020 [get_ports {sr_in_ctrl}]
set_input_delay -add_delay -clock [get_clocks {clk_50M}] 0.020 [get_ports {en_sr}]
set_input_delay -add_delay -clock [get_clocks {clk_50M}] 0.020 [get_ports {sr_in}]


#**************************************************************
# Set Output Delay
#**************************************************************
set_output_delay -add_delay -clock [get_clocks {clk_50M}] 0.020 [get_ports {sr_for_out}]
set_output_delay -add_delay -clock [get_clocks {clk_50M}] 0.020 [get_ports {sr_for_vec_out[0]}]
set_output_delay -add_delay -clock [get_clocks {clk_50M}] 0.020 [get_ports {sr_for_vec_out[1]}]
set_output_delay -add_delay -clock [get_clocks {clk_50M}] 0.020 [get_ports {sr_for_vec_out[2]}]
set_output_delay -add_delay -clock [get_clocks {clk_50M}] 0.020 [get_ports {sr_for_vec_out[3]}]
set_output_delay -add_delay -clock [get_clocks {clk_50M}] 0.020 [get_ports {sr_for_vec_out[4]}]
set_output_delay -add_delay -clock [get_clocks {clk_50M}] 0.020 [get_ports {sr_for_vec_out[5]}]
set_output_delay -add_delay -clock [get_clocks {clk_50M}] 0.020 [get_ports {sr_for_vec_out[6]}]
set_output_delay -add_delay -clock [get_clocks {clk_50M}] 0.020 [get_ports {sr_for_vec_out[7]}]

set_output_delay -add_delay -clock [get_clocks {clk_50M}] 0.020 [get_ports {sr_while_out}]
set_output_delay -add_delay -clock [get_clocks {clk_50M}] 0.020 [get_ports {sr_while_vec_out[0]}]
set_output_delay -add_delay -clock [get_clocks {clk_50M}] 0.020 [get_ports {sr_while_vec_out[1]}]
set_output_delay -add_delay -clock [get_clocks {clk_50M}] 0.020 [get_ports {sr_while_vec_out[2]}]
set_output_delay -add_delay -clock [get_clocks {clk_50M}] 0.020 [get_ports {sr_while_vec_out[3]}]
set_output_delay -add_delay -clock [get_clocks {clk_50M}] 0.020 [get_ports {sr_while_vec_out[4]}]
set_output_delay -add_delay -clock [get_clocks {clk_50M}] 0.020 [get_ports {sr_while_vec_out[5]}]
set_output_delay -add_delay -clock [get_clocks {clk_50M}] 0.020 [get_ports {sr_while_vec_out[6]}]
set_output_delay -add_delay -clock [get_clocks {clk_50M}] 0.020 [get_ports {sr_while_vec_out[7]}]

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

