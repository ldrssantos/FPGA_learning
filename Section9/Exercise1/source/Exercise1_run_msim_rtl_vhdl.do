add wave -noupdate /exercise1_tb/clk_50M
add wave -noupdate /exercise1_tb/sr_in_ctrl
add wave -noupdate -expand /exercise1_tb/estimulo_vector
add wave -noupdate /exercise1_tb/estimulo
add wave -noupdate /exercise1_tb/rst
add wave -noupdate /exercise1_tb/en
add wave -noupdate /exercise1_tb/counter
add wave -noupdate /exercise1_tb/sr_for_out
add wave -noupdate /exercise1_tb/sr_while_out
add wave -noupdate /exercise1_tb/sr_for_vec_out
add wave -noupdate /exercise1_tb/sr_while_vec_out
add wave -noupdate -expand /exercise1_tb/DUT/sr_in_ctrl_vec
add wave -noupdate /exercise1_tb/DUT/en_sr_in_crtl
view structure
view signals
run 1ms