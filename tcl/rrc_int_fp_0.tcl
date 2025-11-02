set ipDir "../ip"
set modName "rrc_int_fp_0"

if {![file exists $ipDir]} {error "ip directory not present"}

create_ip -name fir_compiler -vendor xilinx.com -library ip -version 7.2 -module_name $modName -dir $ipDir -force

set_property -dict [list \
  CONFIG.Clock_Frequency {100} \
  CONFIG.CoefficientSource {COE_File} \
  CONFIG.Coefficient_File {/mnt/TDG_512/projects/py/taps_int.coe} \
  CONFIG.Coefficient_Fractional_Bits {0} \
  CONFIG.Coefficient_Sets {1} \
  CONFIG.Coefficient_Sign {Signed} \
  CONFIG.Coefficient_Structure {Inferred} \
  CONFIG.Coefficient_Width {16} \
  CONFIG.ColumnConfig {9} \
  CONFIG.Data_Fractional_Bits {0} \
  CONFIG.Data_Width {14} \
  CONFIG.Decimation_Rate {1} \
  CONFIG.Filter_Architecture {Systolic_Multiply_Accumulate} \
  CONFIG.Filter_Type {Interpolation} \
  CONFIG.Interpolation_Rate {10} \
  CONFIG.Number_Channels {1} \
  CONFIG.Output_Rounding_Mode {Full_Precision} \
  CONFIG.Output_Width {30} \
  CONFIG.Quantization {Integer_Coefficients} \
  CONFIG.RateSpecification {Frequency_Specification} \
  CONFIG.Sample_Frequency {100} \
  CONFIG.Zero_Pack_Factor {1} \
] [get_ips $modName]

if {"-gen" in $argv} {generate_target all [get_files $modName.xci]}

