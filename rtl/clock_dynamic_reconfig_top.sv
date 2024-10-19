`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/19/2024 03:36:25 PM
// Design Name: 
// Module Name: clock_dynamic_reconfig_top
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module clock_dynamic_reconfig_top(
      input clk125,
      output logic led
    );
    
logic clk100;
logic [26:0] count_1s = '0;
logic led_int = 1'b0;
logic flag_1s;
localparam logic [26:0] ref_1s = 27'd100_000_000;
    
clk_wiz_0 clk_inst
   (
    // Clock out ports
    .clk_out1(clk100),     // output clk_out1
   // Clock in ports
    .clk_in1(clk125)      // input clk_in1
);

always_ff@(posedge clk100) begin
  led <= led_int;
  flag_1s <= (ref_1s == count_1s);
  if(flag_1s == 1'b1) begin
    count_1s <= '0;
    led_int <= ~led_int;
  end else begin
    count_1s <= count_1s + 1'b1;
  end
end
    
endmodule
