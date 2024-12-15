//taken from: https://docs.amd.com/r/en-US/pg065-clk-wiz/Register-Space

`define BASE_ADDR 32'h43C0_0000
`define SW_RST 32'h0 //write 0xA to reset, write only
`define STATUS 32'h4
`define ERROR_STATUS 32'h8
`define GLBL_CLK_CONFIG 32'h200 //7-0: divclk, 15-8: int mult factor, 25-16: fractional mult factor
`define CLK0_CONFIG 32'h208 //7-0 clk0 div int, 17-8 frac div
`define LOAD_SEN 32'h25c // bit[0] loads clk config register values to internal fsm, bit[1] 0: default GUI config is loaded, 1: settings in registers are loaded