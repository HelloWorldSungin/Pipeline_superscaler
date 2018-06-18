onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -radix unsigned /reg_file_tb/register_file/clk
add wave -noupdate -radix unsigned /reg_file_tb/register_file/reset
add wave -noupdate -expand -group REG_SET_A -radix unsigned /reg_file_tb/register_file/wr_en_a
add wave -noupdate -expand -group REG_SET_A -radix unsigned /reg_file_tb/register_file/rd_addr_a0
add wave -noupdate -expand -group REG_SET_A -radix unsigned /reg_file_tb/register_file/rd_addr_a1
add wave -noupdate -expand -group REG_SET_A -radix unsigned /reg_file_tb/register_file/wr_addr_a
add wave -noupdate -expand -group REG_SET_A -radix unsigned /reg_file_tb/register_file/wr_data_a
add wave -noupdate -expand -group REG_SET_A -radix unsigned /reg_file_tb/register_file/rd_data_a0
add wave -noupdate -expand -group REG_SET_A -radix unsigned /reg_file_tb/register_file/rd_data_a1
add wave -noupdate -expand -group REG_SET_B -radix unsigned /reg_file_tb/register_file/wr_en_b
add wave -noupdate -expand -group REG_SET_B -radix unsigned /reg_file_tb/register_file/rd_addr_b0
add wave -noupdate -expand -group REG_SET_B -radix unsigned /reg_file_tb/register_file/rd_addr_b1
add wave -noupdate -expand -group REG_SET_B -radix unsigned /reg_file_tb/register_file/wr_addr_b
add wave -noupdate -expand -group REG_SET_B -radix unsigned /reg_file_tb/register_file/wr_data_b
add wave -noupdate -expand -group REG_SET_B -radix unsigned /reg_file_tb/register_file/rd_data_b0
add wave -noupdate -expand -group REG_SET_B -radix unsigned /reg_file_tb/register_file/rd_data_b1
add wave -noupdate -radix unsigned -childformat {{{/reg_file_tb/register_file/regs[0]} -radix unsigned} {{/reg_file_tb/register_file/regs[1]} -radix unsigned} {{/reg_file_tb/register_file/regs[2]} -radix unsigned} {{/reg_file_tb/register_file/regs[3]} -radix unsigned} {{/reg_file_tb/register_file/regs[4]} -radix unsigned} {{/reg_file_tb/register_file/regs[5]} -radix unsigned} {{/reg_file_tb/register_file/regs[6]} -radix unsigned} {{/reg_file_tb/register_file/regs[7]} -radix unsigned} {{/reg_file_tb/register_file/regs[8]} -radix unsigned} {{/reg_file_tb/register_file/regs[9]} -radix unsigned} {{/reg_file_tb/register_file/regs[10]} -radix unsigned} {{/reg_file_tb/register_file/regs[11]} -radix unsigned} {{/reg_file_tb/register_file/regs[12]} -radix unsigned} {{/reg_file_tb/register_file/regs[13]} -radix unsigned} {{/reg_file_tb/register_file/regs[14]} -radix unsigned} {{/reg_file_tb/register_file/regs[15]} -radix unsigned} {{/reg_file_tb/register_file/regs[16]} -radix unsigned} {{/reg_file_tb/register_file/regs[17]} -radix unsigned} {{/reg_file_tb/register_file/regs[18]} -radix unsigned} {{/reg_file_tb/register_file/regs[19]} -radix unsigned} {{/reg_file_tb/register_file/regs[20]} -radix unsigned} {{/reg_file_tb/register_file/regs[21]} -radix unsigned} {{/reg_file_tb/register_file/regs[22]} -radix unsigned} {{/reg_file_tb/register_file/regs[23]} -radix unsigned} {{/reg_file_tb/register_file/regs[24]} -radix unsigned} {{/reg_file_tb/register_file/regs[25]} -radix unsigned} {{/reg_file_tb/register_file/regs[26]} -radix unsigned} {{/reg_file_tb/register_file/regs[27]} -radix unsigned} {{/reg_file_tb/register_file/regs[28]} -radix unsigned} {{/reg_file_tb/register_file/regs[29]} -radix unsigned} {{/reg_file_tb/register_file/regs[30]} -radix unsigned} {{/reg_file_tb/register_file/regs[31]} -radix unsigned}} -subitemconfig {{/reg_file_tb/register_file/regs[0]} {-height 16 -radix unsigned} {/reg_file_tb/register_file/regs[1]} {-height 16 -radix unsigned} {/reg_file_tb/register_file/regs[2]} {-height 16 -radix unsigned} {/reg_file_tb/register_file/regs[3]} {-height 16 -radix unsigned} {/reg_file_tb/register_file/regs[4]} {-height 16 -radix unsigned} {/reg_file_tb/register_file/regs[5]} {-height 16 -radix unsigned} {/reg_file_tb/register_file/regs[6]} {-height 16 -radix unsigned} {/reg_file_tb/register_file/regs[7]} {-height 16 -radix unsigned} {/reg_file_tb/register_file/regs[8]} {-height 16 -radix unsigned} {/reg_file_tb/register_file/regs[9]} {-height 16 -radix unsigned} {/reg_file_tb/register_file/regs[10]} {-height 16 -radix unsigned} {/reg_file_tb/register_file/regs[11]} {-height 16 -radix unsigned} {/reg_file_tb/register_file/regs[12]} {-height 16 -radix unsigned} {/reg_file_tb/register_file/regs[13]} {-height 16 -radix unsigned} {/reg_file_tb/register_file/regs[14]} {-height 16 -radix unsigned} {/reg_file_tb/register_file/regs[15]} {-height 16 -radix unsigned} {/reg_file_tb/register_file/regs[16]} {-height 16 -radix unsigned} {/reg_file_tb/register_file/regs[17]} {-height 16 -radix unsigned} {/reg_file_tb/register_file/regs[18]} {-height 16 -radix unsigned} {/reg_file_tb/register_file/regs[19]} {-height 16 -radix unsigned} {/reg_file_tb/register_file/regs[20]} {-height 16 -radix unsigned} {/reg_file_tb/register_file/regs[21]} {-height 16 -radix unsigned} {/reg_file_tb/register_file/regs[22]} {-height 16 -radix unsigned} {/reg_file_tb/register_file/regs[23]} {-height 16 -radix unsigned} {/reg_file_tb/register_file/regs[24]} {-height 16 -radix unsigned} {/reg_file_tb/register_file/regs[25]} {-height 16 -radix unsigned} {/reg_file_tb/register_file/regs[26]} {-height 16 -radix unsigned} {/reg_file_tb/register_file/regs[27]} {-height 16 -radix unsigned} {/reg_file_tb/register_file/regs[28]} {-height 16 -radix unsigned} {/reg_file_tb/register_file/regs[29]} {-height 16 -radix unsigned} {/reg_file_tb/register_file/regs[30]} {-height 16 -radix unsigned} {/reg_file_tb/register_file/regs[31]} {-height 16 -radix unsigned}} /reg_file_tb/register_file/regs
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {10 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 150
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
configure wave -timelineunits ns
update
WaveRestoreZoom {0 ps} {1 ns}
