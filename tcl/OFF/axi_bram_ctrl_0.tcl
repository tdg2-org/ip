set ipDir "../ip"
set modName "axi_bram_ctrl_0"

if {![file exists $ipDir]} {error "ip directory not present"}

create_ip -name axi_bram_ctrl -vendor xilinx.com -library ip -version 4.1 -module_name $modName -dir $ipDir -force

set_property -dict [list \
  CONFIG.BMG_INSTANCE {INTERNAL} \
  CONFIG.DATA_WIDTH {1024} \
  CONFIG.MEM_DEPTH {1024} \
] [get_ips $modName]

if {"-gen" in $argv} {generate_target all [get_files $modName.xci]}
