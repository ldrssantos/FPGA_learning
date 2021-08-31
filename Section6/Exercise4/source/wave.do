onerror {resume}
quietly WaveActivateNextPane {} 0
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
add wave -noupdate /exercise4_tb/DUT/rst_int
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
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {998638579 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 172
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
WaveRestoreZoom {0 ps} {1050 us}
