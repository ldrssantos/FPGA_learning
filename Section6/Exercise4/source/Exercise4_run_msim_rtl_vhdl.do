add wave -noupdate /exercise4_tb/DUT/clock_50
add wave -noupdate /exercise4_tb/DUT/rst
add wave -noupdate /exercise4_tb/DUT/counter_load_value
add wave -noupdate /exercise4_tb/DUT/counter_en
add wave -noupdate /exercise4_tb/DUT/counter_ud
add wave -noupdate /exercise4_tb/DUT/counter_out
add wave -noupdate /exercise4_tb/DUT/iCounter
add wave -noupdate /exercise4_tb/DUT/counter_load
add wave -noupdate /exercise4_tb/DUT/counter_load_int
add wave -noupdate /exercise4_tb/DUT/counter_en_int
add wave -noupdate -expand -group counter_load_deb /exercise4_tb/DUT/counter_load_deb/deb_in
add wave -noupdate -expand -group counter_load_deb /exercise4_tb/DUT/counter_load_deb/ck
add wave -noupdate -expand -group counter_load_deb /exercise4_tb/DUT/counter_load_deb/deb_out
add wave -noupdate -expand -group counter_load_deb /exercise4_tb/DUT/counter_load_deb/debounce
add wave -noupdate -expand -group counter_load_deb /exercise4_tb/DUT/counter_load_deb/pulse
add wave -noupdate -expand -group counter_en_deb /exercise4_tb/DUT/counter_en_deb/ck
add wave -noupdate -expand -group counter_en_deb /exercise4_tb/DUT/counter_en_deb/deb_in
add wave -noupdate -expand -group counter_en_deb /exercise4_tb/DUT/counter_en_deb/deb_out
add wave -noupdate -expand -group counter_en_deb /exercise4_tb/DUT/counter_en_deb/debounce
add wave -noupdate -expand -group counter_en_deb /exercise4_tb/DUT/counter_en_deb/pulse
view structure
view signals
run 1ms