set ipDir "../ip"
set modName "dds_cfo"

if {![file exists $ipDir]} {error "ip directory not present"}

create_ip -name dds_compiler -vendor xilinx.com -library ip -version 6.0 -module_name $modName -dir $ipDir -force
set_property -dict [list \
  CONFIG.DATA_Has_TLAST {Not_Required} \
  CONFIG.DDS_Clock_Rate {200} \
  CONFIG.Frequency_Resolution {0.4} \
  CONFIG.Has_ACLKEN {true} \
  CONFIG.Has_ARESETn {true} \
  CONFIG.Latency {8} \
  CONFIG.Noise_Shaping {Auto} \
  CONFIG.OUTPUT_FORM {Twos_Complement} \
  CONFIG.Output_Frequency1 {0.02} \
  CONFIG.Output_Width {16} \
  CONFIG.Phase_Increment {Programmable} \
  CONFIG.Phase_Width {29} \
  CONFIG.S_PHASE_Has_TUSER {Not_Required} \
  CONFIG.Spurious_Free_Dynamic_Range {96} \
] [get_ips $modName]

if {"-gen" in $argv} {generate_target all [get_files $modName.xci]}
