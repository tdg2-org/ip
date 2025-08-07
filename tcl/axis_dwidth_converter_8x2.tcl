set ipDir "../ip"
set modName "axis_dwidth_converter_8x2"

if {![file exists $ipDir]} {error "ip directory not present"}

create_ip -name axis_dwidth_converter -vendor xilinx.com -library ip -version 1.1 -module_name $modName -dir $ipDir -force
set_property -dict [list \
  CONFIG.HAS_TKEEP {1} \
  CONFIG.HAS_TLAST {1} \
  CONFIG.S_TDATA_NUM_BYTES {8} \
] [get_ips $modName]

if {"-gen" in $argv} {generate_target all [get_files $modName.xci]}
