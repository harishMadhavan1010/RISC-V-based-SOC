`timescale 1ns / 1ps
module vsdsoc(VCO_IN, VDDA, VDDD, VSSA, VSSD, EN_VCO, REF, reset, out);
   input EN_VCO;
   input VSSD;
   input VSSA;
   input VDDD;
   input VDDA;
   input VCO_IN;
   input REF;
   wire CLK;
   
   input reset;
   wire [9:0] out_dig;
   
   wire VSS, VDD, VREFL, VREFH;
   output wire out;

   assign VDDA = 3.3;
   assign VDDD = 1.8;
   assign VSSA = 0;
   assign VSSD = 0;
   
   assign VREFH = 3.3;
   assign VREFL = 0.0;
   assign VDD = 1.8;
   assign VSS = 0.0;

   avsdpll uut1(.CLK(CLK), .VCO_IN(VCO_IN), .VDDA(VDDA), .VDDD(VDDD),
	  .VSSA(VSSA), .VSSD(VSSD), .EN_VCO(EN_VCO), .REF(REF));
	  
   core uut2(.clk(CLK), .reset(reset), .out(out_dig));
   
   avsddac uut3(.OUT(out), .VREFH(VREFH), .VREFL(VREFL), .D(out_dig));

endmodule

