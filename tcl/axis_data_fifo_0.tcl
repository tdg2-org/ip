set ipDir "../ip"
set modName "axis_data_fifo_0"

if {![file exists $ipDir]} {error "ip directory not present"}

create_ip -name axis_data_fifo -vendor xilinx.com -library ip -version 2.0 -module_name $modName -dir $ipDir -force
set_property -dict [list \
  CONFIG.FIFO_DEPTH {1024} \
  CONFIG.FIFO_MODE {1} \
  CONFIG.HAS_AEMPTY {1} \
  CONFIG.HAS_AFULL {1} \
  CONFIG.HAS_PROG_EMPTY {1} \
  CONFIG.HAS_PROG_FULL {1} \
  CONFIG.HAS_RD_DATA_COUNT {1} \
  CONFIG.HAS_TKEEP {1} \
  CONFIG.HAS_WR_DATA_COUNT {1} \
  CONFIG.PROG_FULL_THRESH {1000} \
  CONFIG.TDATA_NUM_BYTES {8} \
  CONFIG.HAS_TLAST {1} \
] [get_ips $modName]

if {"-gen" in $argv} {generate_target all [get_files $modName.xci]}


# axis_data_fifo_0 axis_data_fifo_0_inst (
#   .s_axis_aresetn     (s_axis_aresetn       ),  // input wire s_axis_aresetn
#   .s_axis_aclk        (s_axis_aclk          ),  // input wire s_axis_aclk
#   .s_axis_tvalid      (s_axis_tvalid        ),  // input wire s_axis_tvalid
#   .s_axis_tready      (s_axis_tready        ),  // output wire s_axis_tready
#   .s_axis_tdata       (s_axis_tdata         ),  // input wire [63 : 0] s_axis_tdata
#   .s_axis_tkeep       (s_axis_tkeep         ),  // input wire [7 : 0] s_axis_tkeep
#   .s_axis_tlast       (s_axis_tlast         ),  // input wire s_axis_tlast
#   .m_axis_tvalid      (m_axis_tvalid        ),  // output wire m_axis_tvalid
#   .m_axis_tready      (m_axis_tready        ),  // input wire m_axis_tready
#   .m_axis_tdata       (m_axis_tdata         ),  // output wire [63 : 0] m_axis_tdata
#   .m_axis_tkeep       (m_axis_tkeep         ),  // output wire [7 : 0] m_axis_tkeep
#   .m_axis_tlast       (m_axis_tlast         ),  // output wire m_axis_tlast
#   .axis_wr_data_count (axis_wr_data_count   ),  // output wire [31 : 0] axis_wr_data_count
#   .axis_rd_data_count (axis_rd_data_count   ),  // output wire [31 : 0] axis_rd_data_count
#   .almost_empty       (almost_empty         ),  // output wire almost_empty
#   .prog_empty         (prog_empty           ),  // output wire prog_empty
#   .almost_full        (almost_full          ),  // output wire almost_full
#   .prog_full          (prog_full            )  // output wire prog_full
# );
