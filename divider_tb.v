/* 
 * We want to pretend we have a 16MHz clock (62.5ns period)
 * we therefor need a percision of 0.25ns or 25ps, but only 1,10,100 are allowed
 * 
 */
`timescale 1ns/1ps

module testbench;

   reg clk;
   reg reset;
   reg [0:7] divider;
   wire out;
     
   
   divider dut (clk, divider, reset, out);
   
   initial begin
      //Set the dump file
      $dumpfile("divider_tb.lxt2");
      //Dump all variables (levels=0) of this module
      $dumpvars(0, testbench);
      clk = 0;
      
      //Wait 500 ns and init vars
      #500;
      reset = 0;
      divider = 0;      
      #1000; reset = 1;
      #1300; reset = 0;
      

      #50000 $finish;   
   end // initial begin

   always begin
      #31.25; //delay for clock pulses
      clk = ~clk;
   end
     
   
endmodule
