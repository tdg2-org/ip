set ipDir "../ip"
set modName "mmcm_diff"

if {![file exists $ipDir]} {error "ip directory not present"}

create_ip -name clk_wiz -vendor xilinx.com -library ip -version 6.0 -module_name $modName -dir $ipDir -force
set_property -dict [list \
  CONFIG.CLKOUT2_JITTER {102.086} \
  CONFIG.CLKOUT2_PHASE_ERROR {87.180} \
  CONFIG.CLKOUT2_REQUESTED_OUT_FREQ {200.000} \
  CONFIG.CLKOUT2_USED {true} \
  CONFIG.CLKOUT3_JITTER {90.074} \
  CONFIG.CLKOUT3_PHASE_ERROR {87.180} \
  CONFIG.CLKOUT3_REQUESTED_OUT_FREQ {400.000} \
  CONFIG.CLKOUT3_USED {true} \
  CONFIG.CLKOUT4_JITTER {83.768} \
  CONFIG.CLKOUT4_PHASE_ERROR {87.180} \
  CONFIG.CLKOUT4_REQUESTED_OUT_FREQ {600.000} \
  CONFIG.CLKOUT4_USED {true} \
  CONFIG.CLK_OUT1_PORT {clk100} \
  CONFIG.CLK_OUT2_PORT {clk200} \
  CONFIG.CLK_OUT3_PORT {clk400} \
  CONFIG.CLK_OUT4_PORT {clk600} \
  CONFIG.LOCKED_PORT {lock} \
  CONFIG.MMCM_CLKOUT1_DIVIDE {6} \
  CONFIG.MMCM_CLKOUT2_DIVIDE {3} \
  CONFIG.MMCM_CLKOUT3_DIVIDE {2} \
  CONFIG.NUM_OUT_CLKS {4} \
  CONFIG.PRIM_SOURCE {Differential_clock_capable_pin} \
  CONFIG.RESET_PORT {resetn} \
  CONFIG.RESET_TYPE {ACTIVE_LOW} \
  CONFIG.USE_RESET {false} \
] [get_ips $modName]

if {"-gen" in $argv} {generate_target all [get_files $modName.xci]}

# input = 100mhz, diff

# mmcm_diff mmcm_diff_i (
#     .clk100     (clk100     ),  // output clk100
#     .clk200     (clk200     ),  // output clk200
#     .clk400     (clk400     ),  // output clk400
#     .clk600     (clk600     ),  // output clk600
#     .lock       (lock       ),  // output lock
#     .clk_in1_p  ( ),  // input clk_in1_p
#     .clk_in1_n  ( )   // input clk_in1_n
# );