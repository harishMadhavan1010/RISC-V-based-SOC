`timescale 1ns / 1ps

module avsddac_tb;

   reg EN;
   reg real VREFL, VREFH;
   reg [9:0] D;
   wire real OUT;

   avsddac dut (.OUT(OUT), .VREFL(VREFL), .VREFH(VREFH), .D(D));
   
   initial begin
      EN = 1'b0;
      #5 EN = 1'b1;
   end

   initial begin
      VREFH = 3.3;
      VREFL = 0.0;
   end

   initial begin
      #10 D = 10'h3FF;
      #10 D = 10'h1DB;
      #10 D = 10'h3FE;
      #10 D = 10'h3FA;
      #10 D = 10'h0A1;
      #10 D = 10'h000;
      #10 D = 10'h25F;
   end

   initial begin
      $dumpfile("tb_vsddac.vcd");
      $dumpvars(0, avsddac_tb);

      #300 $finish;
   end
endmodule
