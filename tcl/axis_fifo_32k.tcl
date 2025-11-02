set ipDir "../ip"
set modName "axis_fifo_32k"

if {![file exists $ipDir]} {error "ip directory not present"}

create_ip -name axis_data_fifo -vendor xilinx.com -library ip -version 2.0 -module_name $modName -dir $ipDir -force

set_property -dict [list \
  CONFIG.FIFO_DEPTH {32768} \
  CONFIG.TDATA_NUM_BYTES {2} \
] [get_ips $modName]

if {"-gen" in $argv} {generate_target all [get_files $modName.xci]}


#create_ip -name axis_data_fifo -vendor xilinx.com -library ip -version 2.0 -module_name axis_data_fifo_0
#set_property CONFIG.FIFO_DEPTH {32768} [get_ips axis_data_fifo_0]

