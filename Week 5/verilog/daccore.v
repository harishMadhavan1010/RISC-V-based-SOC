module daccore(input clk,
               input reset, 
	       output wire out);

   wire [9:0] out_dig;
   wire VSS, VDD, VREFL, VREFH;

   assign VREFH = 3.3;
   assign VREFL = 0.0;
   assign VDD = 1.8;
   assign VSS = 0.0;

   core uut1(.clk(clk), .reset(reset), .out(out_dig));
   avsddac uut2(.OUT(out), .VREFH(VREFH), .VREFL(VREFL), .D(out_dig));

endmodule

