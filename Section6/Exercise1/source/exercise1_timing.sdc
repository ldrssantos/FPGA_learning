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



#**************************************************************
# Create Generated Clock
#**************************************************************

create_clock -name {clock_50} -period 50.000 -waveform { 0.000 10.00 } [get_ports {clock_50}]


#**************************************************************
# Set Clock Latency
#**************************************************************



#**************************************************************
# Set Clock Uncertainty
#**************************************************************

set_clock_uncertainty -rise_from [get_clocks {clock_50}] -rise_to [get_clocks {clock_50}]  0.020  
set_clock_uncertainty -rise_from [get_clocks {clock_50}] -fall_to [get_clocks {clock_50}]  0.020  
set_clock_uncertainty -fall_from [get_clocks {clock_50}] -rise_to [get_clocks {clock_50}]  0.020  
set_clock_uncertainty -fall_from [get_clocks {clock_50}] -fall_to [get_clocks {clock_50}]  0.020 

#**************************************************************
# Set Input Delay
#**************************************************************
set_input_delay -add_delay -clock [get_clocks {clock_50}] 0.020 [get_ports {switches[0]}]
set_input_delay -add_delay -clock [get_clocks {clock_50}] 0.020 [get_ports {switches[1]}]
set_input_delay -add_delay -clock [get_clocks {clock_50}] 0.020 [get_ports {switches[2]}]
set_input_delay -add_delay -clock [get_clocks {clock_50}] 0.020 [get_ports {switches[3]}]
set_input_delay -add_delay -clock [get_clocks {clock_50}] 0.020 [get_ports {switches[4]}]


#**************************************************************
# Set Output Delay
#**************************************************************
set_output_delay -add_delay -clock [get_clocks {clock_50}] 0.020 [get_ports {leds[0]}]
set_output_delay -add_delay -clock [get_clocks {clock_50}] 0.020 [get_ports {leds[1]}]
set_output_delay -add_delay -clock [get_clocks {clock_50}] 0.020 [get_ports {leds[2]}]
set_output_delay -add_delay -clock [get_clocks {clock_50}] 0.020 [get_ports {leds[3]}]
set_output_delay -add_delay -clock [get_clocks {clock_50}] 0.020 [get_ports {leds[4]}]


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

