#create_clock -period 10.000 -name clk_fpga_0 [get_pins {PS7_i/FCLKCLK[0]}]
#create_clock -period 5.000 -name clk_fpga_1 [get_pins {PS7_i/FCLKCLK[0]}] -add

set_false_path -from [get_clocks clk_fpga_0] -to [get_clocks -of_objects [get_pins zynq_ex_i/clk_wiz_0/inst/CLK_CORE_DRP_I/clk_inst/mmcm_adv_inst/CLKOUT0]]