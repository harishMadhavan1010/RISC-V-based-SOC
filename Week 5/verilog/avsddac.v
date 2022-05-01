module avsddac(
	OUT, 
	D, 
	VREFH, 
	VREFL
);
   output OUT;
   input VREFH;
   input VREFL;
   input[9:0] D;

   reg real OUT;
   wire real VREFH;
   wire real VREFL;
   wire real VSS, VDD;
   real NaN;
   wire EN;

   wire [10:0] Dext;
   assign Dext = {1'b0, D};
   assign EN = 1;

   initial begin
      NaN = 0.0/0.0;
      if (EN == 1'b0) begin
         OUT <= 0;
      end else if (VREFH == NaN) begin
         OUT <= NaN;
      end else if (VREFL == NaN) begin
         OUT <= NaN;
      end else if (EN == 1'b1) begin
         OUT <= VREFL + ($itor(Dext) / 1023.0)*(VREFH - VREFL);
      end else begin
         OUT <= NaN;
      end

   end

   always @(D or EN or VREFH or VREFL) begin
      if (EN == 1'b0) begin
         OUT <= 0;
      end else if (VREFH == NaN) begin
         OUT <= NaN;
      end else if (VREFL == NaN) begin
         OUT <= NaN;
      end else if (EN == 1'b1) begin
         OUT <= VREFL + ($itor(Dext) / 1023.0)*(VREFH - VREFL);
      end else begin
         OUT <= NaN;
      end
   end

endmodule
