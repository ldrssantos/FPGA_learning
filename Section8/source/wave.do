onerror {resume}
quietly WaveActivateNextPane {} 0
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
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {524949940 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 301
configure wave -valuecolwidth 100
configure wave -justifyvalue left
configure wave -signalnamewidth 0
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ns
update
WaveRestoreZoom {524935913 ps} {525037611 ps}
