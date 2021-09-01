add wave -noupdate /exercise1_tb/clock
add wave -noupdate /exercise1_tb/counter_stop_ctrl
add wave -noupdate /exercise1_tb/rst
add wave -noupdate /exercise1_tb/counter
add wave -noupdate /exercise1_tb/led_clk_125M
add wave -noupdate /exercise1_tb/led_clk_100M
add wave -noupdate /exercise1_tb/led_clk_25M
add wave -noupdate /exercise1_tb/led_clk_10M
add wave -noupdate -divider PLL
add wave -noupdate /exercise1_tb/DUT/Pll_exemple_inst/areset
add wave -noupdate /exercise1_tb/DUT/Pll_exemple_inst/inclk0
add wave -noupdate /exercise1_tb/DUT/Pll_exemple_inst/c0
add wave -noupdate /exercise1_tb/DUT/Pll_exemple_inst/c1
add wave -noupdate /exercise1_tb/DUT/Pll_exemple_inst/c2
add wave -noupdate /exercise1_tb/DUT/Pll_exemple_inst/c3
add wave -noupdate /exercise1_tb/DUT/Pll_exemple_inst/locked
view structure
view signals
run 1ms