# 1. design environment constraints
set_operating_conditions -min_library N16ADFP_StdCellff0p88v125c_ccs -min ff0p88v125c -max_library N16ADFP_StdCellss0p72vm40c_ccs -max ss0p72vm40c
set_wire_load_model -name ZeroWireload -library N16ADFP_StdCellss0p72vm40c_ccs
set_driving_cell -library N16ADFP_StdCellss0p72vm40c_ccs \
                 -lib_cell BUFFD4BWP16P90LVT -pin {Z} [get_ports clk_i]
set_driving_cell -library N16ADFP_StdCellss0p72vm40c_ccs \
                 -lib_cell DFQD1BWP16P90LVT -pin {Q} \
                 [all_inputs]
set_load [load_of "N16ADFP_StdCellss0p72vm40c_ccs/DFQD1BWP16P90LVT/D"] [all_outputs]

# 2. design optimization constraints
# create timing constraints (includes clock)
set period 10.0
create_clock -name "CLK" -period $period -waveform [list 0 [expr $period / 2]] [get_ports clk_i]
set_fix_hold [get_clocks CLK]
set_dont_touch_network [get_clocks CLK]
set_clock_uncertainty 0.02 [get_clocks CLK]
set_clock_latency 0.2 [get_clocks CLK]
set_input_transition 0.5 [all_inputs]
# set input/output delay for setup/hold time STA
set_input_delay -clock CLK -max [expr {$period * 0.6}] [all_inputs]
set_input_delay -clock CLK -min 0 [all_inputs]
set_output_delay -clock CLK -max [expr {$period * 0.1}] [all_outputs]
set_output_delay -clock CLK -min 0 [all_outputs]

# 3. design rule constraints (DRCs)
set_max_area 0
set_max_fanout 10 [all_inputs]
set_max_transition 0.1 [all_inputs]
set_max_capacitance 0.1 [all_inputs]
