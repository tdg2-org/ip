set ipDir "../ip"
set modName "fir_rrc_float_0"

if {![file exists $ipDir]} {error "ip directory not present"}

create_ip -name fir_compiler -vendor xilinx.com -library ip -version 7.2 -module_name $modName -dir $ipDir -force

set_property -dict [list \
  CONFIG.BestPrecision {true} \
  CONFIG.Clock_Frequency {100} \
  CONFIG.CoefficientSource {COE_File} \
  CONFIG.Coefficient_File {../../sw/py/fir/taps_scaled_float2.coe} \
  CONFIG.Coefficient_Fractional_Bits {16} \
  CONFIG.Coefficient_Sets {1} \
  CONFIG.Coefficient_Sign {Signed} \
  CONFIG.Coefficient_Structure {Inferred} \
  CONFIG.Coefficient_Width {16} \
  CONFIG.ColumnConfig {5} \
  CONFIG.Data_Fractional_Bits {0} \
  CONFIG.Data_Width {14} \
  CONFIG.Decimation_Rate {1} \
  CONFIG.Filter_Architecture {Systolic_Multiply_Accumulate} \
  CONFIG.Filter_Type {Interpolation} \
  CONFIG.Interpolation_Rate {10} \
  CONFIG.Number_Channels {1} \
  CONFIG.Output_Rounding_Mode {Convergent_Rounding_to_Even} \
  CONFIG.Output_Width {28} \
  CONFIG.Quantization {Quantize_Only} \
  CONFIG.RateSpecification {Frequency_Specification} \
  CONFIG.Sample_Frequency {10} \
  CONFIG.Zero_Pack_Factor {1} \
] [get_ips $modName]

if {"-gen" in $argv} {generate_target all [get_files $modName.xci]}

