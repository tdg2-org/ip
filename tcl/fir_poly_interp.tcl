set ipDir "../ip"
set modName "fir_poly_interp"

if {![file exists $ipDir]} {error "ip directory not present"}

create_ip -name fir_compiler -vendor xilinx.com -library ip -version 7.2 -module_name $modName -dir $ipDir -force
set_property -dict [list \
  CONFIG.Clock_Frequency {200.0} \
  CONFIG.CoefficientSource {COE_File} \
  CONFIG.Coefficient_File {/mnt/TDG_512/projects/2_zub_msk_udp_dma/sub/ip/tcl/coe/polyphase_interp.coe} \
  CONFIG.Coefficient_Fractional_Bits {0} \
  CONFIG.Coefficient_Sets {20} \
  CONFIG.Coefficient_Sign {Signed} \
  CONFIG.Coefficient_Structure {Inferred} \
  CONFIG.Coefficient_Width {19} \
  CONFIG.ColumnConfig {1} \
  CONFIG.Data_Width {16} \
  CONFIG.Decimation_Rate {20} \
  CONFIG.Filter_Architecture {Systolic_Multiply_Accumulate} \
  CONFIG.Filter_Selection {1} \
  CONFIG.Filter_Type {Decimation} \
  CONFIG.Has_ACLKEN {true} \
  CONFIG.Has_ARESETn {true} \
  CONFIG.Interpolation_Rate {1} \
  CONFIG.Number_Channels {1} \
  CONFIG.Output_Rounding_Mode {Full_Precision} \
  CONFIG.Output_Width {35} \
  CONFIG.Quantization {Integer_Coefficients} \
  CONFIG.RateSpecification {Frequency_Specification} \
  CONFIG.Sample_Frequency {200} \
  CONFIG.Zero_Pack_Factor {1} \
] [get_ips $modName]

if {"-gen" in $argv} {generate_target all [get_files $modName.xci]}

