onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /exercise2_tb/counter
add wave -noupdate /exercise2_tb/srclk
add wave -noupdate /exercise2_tb/ser
add wave -noupdate /exercise2_tb/rclk
add wave -noupdate /exercise2_tb/srclr_n_i
add wave -noupdate /exercise2_tb/oe_n_i
add wave -noupdate /exercise2_tb/qa_o
add wave -noupdate /exercise2_tb/qb_o
add wave -noupdate /exercise2_tb/qc_o
add wave -noupdate /exercise2_tb/qd_o
add wave -noupdate /exercise2_tb/qe_o
add wave -noupdate /exercise2_tb/qf_o
add wave -noupdate /exercise2_tb/qg_o
add wave -noupdate /exercise2_tb/qh_o
add wave -noupdate /exercise2_tb/qh1_o
add wave -noupdate /exercise2_tb/DUT/q_data
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {524827128 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 150
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
WaveRestoreZoom {523974608 ps} {526025392 ps}
