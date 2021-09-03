add wave -noupdate /Example1_tb/clk_50M
add wave -noupdate /Example1_tb/sr_in_ctrl
add wave -noupdate -expand /Example1_tb/estimulo_vector
add wave -noupdate /Example1_tb/estimulo
add wave -noupdate /Example1_tb/rst
add wave -noupdate /Example1_tb/en
add wave -noupdate /Example1_tb/counter
add wave -noupdate /Example1_tb/sr_for_out
add wave -noupdate /Example1_tb/sr_while_out
add wave -noupdate /Example1_tb/sr_for_vec_out
add wave -noupdate /Example1_tb/sr_while_vec_out
add wave -noupdate -expand /Example1_tb/DUT/sr_in_ctrl_vec
add wave -noupdate /Example1_tb/DUT/en_sr_in_crtl
view structure
view signals
run 1ms