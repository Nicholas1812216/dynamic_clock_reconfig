`timescale 1ns / 1ps
import zynq_ex_axi_vip_0_0_pkg::*;
`include "register_addrs.svh"
`define clock_bd_axi_vip_0_0_PATH_TO_INTERFACE "dut.zynq_ex_i.axi_vip_0"
module top_tb();


  wire [14:0]DDR_addr;
  wire [2:0]DDR_ba;
  wire DDR_cas_n;
  wire DDR_ck_n;
  wire DDR_ck_p;
  wire DDR_cke;
  wire DDR_cs_n;
  wire [3:0]DDR_dm;
  wire [31:0]DDR_dq;
  wire [3:0]DDR_dqs_n;
  wire [3:0]DDR_dqs_p;
  wire DDR_odt;
  wire DDR_ras_n;
  wire DDR_reset_n;
  wire DDR_we_n;
  wire FIXED_IO_ddr_vrn;
  wire FIXED_IO_ddr_vrp;
  wire [53:0]FIXED_IO_mio;
  wire FIXED_IO_ps_clk;
  wire FIXED_IO_ps_porb;
  wire FIXED_IO_ps_srstb;
  logic clk_in1_0;
  logic clk_out1_0;
  logic locked_0;


    logic clk125 = 0;
    logic led;
     
    logic [31:0] rdData = 0;
    logic testRresp;
    always begin
      #4ns clk125 = ~clk125;
    end  
      
    clock_dynamic_reconfig_top dut(.*);


    zynq_ex_axi_vip_0_0_mst_t  clock_bd_axi_vip_0_0_mst;
    initial begin : START_clock_bd_axi_vip_0_0_MASTER
      clock_bd_axi_vip_0_0_mst = new("clock_bd_axi_vip_0_0_mst", dut.zynq_ex_i.axi_vip_0.inst.IF);
      clock_bd_axi_vip_0_0_mst.start_master();
    end


    initial begin
      wait (dut.locked == 1'b1);
      $display("pll lock!");
      #100ns;
      clock_bd_axi_vip_0_0_mst.AXI4LITE_READ_BURST(`BASE_ADDR+`STATUS, 0, rdData,testRresp);
      $display("reg lock status: %0h", rdData);
	  clock_bd_axi_vip_0_0_mst.AXI4LITE_READ_BURST(`BASE_ADDR+`GLBL_CLK_CONFIG, 0, rdData,testRresp);
	  $display("global mult/div register: %0h", rdData);
	  clock_bd_axi_vip_0_0_mst.AXI4LITE_READ_BURST(`BASE_ADDR+`CLK0_CONFIG, 0, rdData,testRresp);
	  $display("clk0 config register: %0h", rdData);
	  clock_bd_axi_vip_0_0_mst.AXI4LITE_WRITE_BURST(`BASE_ADDR+`CLK0_CONFIG, 0, 32'h5, testRresp);
	  clock_bd_axi_vip_0_0_mst.AXI4LITE_WRITE_BURST(`BASE_ADDR+`LOAD_SEN, 0, 32'h3, testRresp);
	  wait (dut.locked == 1'b1);
      $display("pll lock!");
      clock_bd_axi_vip_0_0_mst.AXI4LITE_READ_BURST(`BASE_ADDR+`STATUS, 0, rdData,testRresp);
      $display("reg lock status: %0h", rdData);
	  clock_bd_axi_vip_0_0_mst.AXI4LITE_READ_BURST(`BASE_ADDR+`GLBL_CLK_CONFIG, 0, rdData,testRresp);
	  $display("global mult/div register: %0h", rdData);
	  clock_bd_axi_vip_0_0_mst.AXI4LITE_READ_BURST(`BASE_ADDR+`CLK0_CONFIG, 0, rdData,testRresp);
	  $display("clk0 config register: %0h", rdData);

    end

endmodule
