set ipDir "../ip"
set modName "rrc_float_signleRate_fp_0"

if {![file exists $ipDir]} {error "ip directory not present"}

create_ip -name fir_compiler -vendor xilinx.com -library ip -version 7.2 -module_name $modName -dir $ipDir -force

set_property -dict [list \
  CONFIG.Clock_Frequency {100} \
  CONFIG.CoefficientSource {COE_File} \
  CONFIG.Coefficient_File {/mnt/TDG_512/projects/py/taps_float.coe} \
  CONFIG.Coefficient_Fractional_Bits {16} \
  CONFIG.Coefficient_Sets {1} \
  CONFIG.Coefficient_Sign {Signed} \
  CONFIG.Coefficient_Structure {Inferred} \
  CONFIG.Coefficient_Width {16} \
  CONFIG.ColumnConfig {41} \
  CONFIG.Data_Width {16} \
  CONFIG.Filter_Architecture {Systolic_Multiply_Accumulate} \
  CONFIG.Output_Width {35} \
  CONFIG.Quantization {Quantize_Only} \
  CONFIG.Sample_Frequency {100} \
] [get_ips $modName]

if {"-gen" in $argv} {generate_target all [get_files $modName.xci]}

