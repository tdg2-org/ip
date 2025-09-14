set ipDir "../ip"
set modName "xfft_0"

if {![file exists $ipDir]} {error "ip directory not present"}

create_ip -name xfft -vendor xilinx.com -library ip -version 9.1 -module_name $modName -dir $ipDir -force
set_property -dict [list \
  CONFIG.data_format {fixed_point} \
  CONFIG.implementation_options {automatically_select} \
  CONFIG.number_of_stages_using_block_ram_for_data_and_phase_factors {1} \
  CONFIG.super_sample_rates {1} \
  CONFIG.target_clock_frequency {100} \
  CONFIG.target_data_throughput {100} \
  CONFIG.transform_length {256} \
] [get_ips $modName]

if {"-gen" in $argv} {generate_target all [get_files $modName.xci]}

