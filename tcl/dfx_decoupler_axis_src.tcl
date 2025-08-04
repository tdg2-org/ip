set ipDir "../ip"
set modName "dfx_decoupler_axis_src"

if {![file exists $ipDir]} {error "ip directory not present"}

create_ip -name dfx_decoupler -vendor xilinx.com -library ip -version 1.0 -module_name $modName -dir $ipDir -force
set_property -dict [list \
  CONFIG.ALL_PARAMS {INTF {axis {ID 0 VLNV xilinx.com:interface:axis_rtl:1.0 SIGNALS {TKEEP {PRESENT 1 WIDTH 8} TDATA {WIDTH 64}}}} HAS_SIGNAL_STATUS 0 HAS_SIGNAL_CONTROL 1} \
  CONFIG.GUI_SIGNAL_WIDTH_2 {64} \
  CONFIG.GUI_SIGNAL_WIDTH_8 {8} \
] [get_ips dfx_decoupler_axis_src]

if {"-gen" in $argv} {generate_target all [get_files $modName.xci]}
