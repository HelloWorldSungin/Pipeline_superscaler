onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -expand -group inst1_in&out /execute_tb/DUT/exe_ctrl_e_0
add wave -noupdate -expand -group inst1_in&out -radix decimal /execute_tb/DUT/execout_m_0
add wave -noupdate -expand -group inst1_in&out -radix decimal /execute_tb/DUT/forwarda_e_0
add wave -noupdate -expand -group inst1_in&out -radix decimal /execute_tb/DUT/rd_e_0
add wave -noupdate -expand -group inst1_in&out -radix decimal /execute_tb/DUT/result_w_0
add wave -noupdate -expand -group inst1_in&out -radix decimal /execute_tb/DUT/rfout1_e_0
add wave -noupdate -expand -group inst1_in&out -radix decimal /execute_tb/DUT/rfout2_e_0
add wave -noupdate -expand -group inst1_in&out -radix decimal /execute_tb/DUT/rs_e_0
add wave -noupdate -expand -group inst1_in&out -radix decimal /execute_tb/DUT/rt_e_0
add wave -noupdate -expand -group inst1_in&out -radix decimal /execute_tb/DUT/upperimm_e_0
add wave -noupdate -expand -group inst1_in&out -radix decimal /execute_tb/DUT/execout_e_0
add wave -noupdate -expand -group inst1_in&out -radix decimal /execute_tb/DUT/writereg_e_0
add wave -noupdate -expand -group inst2_in&out /execute_tb/DUT/exe_ctrl_e_1
add wave -noupdate -expand -group inst2_in&out -radix unsigned /execute_tb/DUT/execout_m_1
add wave -noupdate -expand -group inst2_in&out -radix unsigned /execute_tb/DUT/forwarda_e_1
add wave -noupdate -expand -group inst2_in&out -radix unsigned /execute_tb/DUT/forwardb_e_1
add wave -noupdate -expand -group inst2_in&out -radix unsigned /execute_tb/DUT/imm_e_1
add wave -noupdate -expand -group inst2_in&out -radix unsigned /execute_tb/DUT/rd_e_1
add wave -noupdate -expand -group inst2_in&out -radix unsigned /execute_tb/DUT/result_w_1
add wave -noupdate -expand -group inst2_in&out -radix unsigned /execute_tb/DUT/rfout1_e_1
add wave -noupdate -expand -group inst2_in&out -radix unsigned /execute_tb/DUT/rfout2_e_1
add wave -noupdate -expand -group inst2_in&out -radix unsigned /execute_tb/DUT/rs_e_1
add wave -noupdate -expand -group inst2_in&out -radix unsigned /execute_tb/DUT/rt_e_1
add wave -noupdate -expand -group inst2_in&out -radix unsigned /execute_tb/DUT/upperimm_e_1
add wave -noupdate -expand -group inst2_in&out -radix unsigned /execute_tb/DUT/execout_e_1
add wave -noupdate -expand -group inst2_in&out -radix unsigned /execute_tb/DUT/writereg_e_1
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {176 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 252
configure wave -valuecolwidth 100
configure wave -justifyvalue left
configure wave -signalnamewidth 1
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ps
update
WaveRestoreZoom {0 ps} {994 ps}
