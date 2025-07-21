set ipDir "../ip"
set modName "fir_mf"

if {![file exists $ipDir]} {error "ip directory not present"}

create_ip -name fir_compiler -vendor xilinx.com -library ip -version 7.2 -module_name $modName -dir $ipDir -force
set_property -dict [list \
  CONFIG.CoefficientVector {0,2571,5126,7649,10126,12539,14876,17121,19260,21280,23170,24916,26509,27938,29196,30273,31163,31862,32364,32666,32767,32666,32364,31862,31163,30273,29196,27938,26509,24916,23170,21280,19260,17121,14876,12539,10126,7649,5126,2571,0} \
  CONFIG.Coefficient_Fractional_Bits {0} \
  CONFIG.Coefficient_Sets {1} \
  CONFIG.Coefficient_Sign {Signed} \
  CONFIG.Coefficient_Structure {Inferred} \
  CONFIG.Coefficient_Width {16} \
  CONFIG.Data_Width {16} \
  CONFIG.Output_Width {32} \
  CONFIG.Quantization {Integer_Coefficients} \
  CONFIG.Clock_Frequency {200} \
  CONFIG.ColumnConfig {12} \
  CONFIG.Filter_Architecture {Systolic_Multiply_Accumulate} \
  CONFIG.Sample_Frequency {200} \
  CONFIG.S_DATA_Has_FIFO {false} \
] [get_ips $modName]

if {"-gen" in $argv} {generate_target all [get_files $modName.xci]}
