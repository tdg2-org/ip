set ipDir "../ip"
set modName "fifo_gen_0"

if {![file exists $ipDir]} {error "ip directory not present"}

create_ip -name fifo_generator -vendor xilinx.com -library ip -version 13.2 -module_name $modName -dir $ipDir -force
set_property -dict [list \
  CONFIG.Clock_Type_AXI {Common_Clock} \
  CONFIG.Enable_TLAST {true} \
  CONFIG.HAS_TKEEP {true} \
  CONFIG.INTERFACE_TYPE {AXI_STREAM} \
  CONFIG.Programmable_Empty_Type_axis {No_Programmable_Empty_Threshold} \
  CONFIG.TDATA_NUM_BYTES {8} \
  CONFIG.TUSER_WIDTH {0} \
] [get_ips $modName]

if {"-gen" in $argv} {generate_target all [get_files $modName.xci]}
