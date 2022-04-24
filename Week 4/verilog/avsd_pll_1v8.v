`timescale 1ns / 1ps
module avsd_pll_1v8(CLK, VCO_IN, VDDA, VDDD, VSSA, VSSD, EN_VCO, REF);
  
  input VSSD;
  input EN_VCO;
  input VSSA;
  input VDDD;
  input VDDA;
  input VCO_IN;
  output CLK;
  input REF;
  
  reg CLK;
  reg[31:0] period, lastedge, refpd, thisedge;
  reg[7:0] expdetect;
  reg[22:0] shiftededge;
  wire VSSD, VSSA, VDDD, VDDA;

  initial begin
    lastedge = 32'b0_01111111_00000000000000000000000;
    period = 32'b0_10000011_10010000000000000000000;
    CLK <= 0;
  end

  always @(CLK or EN_VCO) begin
    if (EN_VCO == 1'b1) begin
      #(2**(period[30:23]-127) + period[22:0]*(2**(period[30:23]-24-127)));
      CLK <= (CLK === 1'b0);
    end

    else if (EN_VCO == 1'b0) begin
      CLK <= 1'b0;
    end

    else begin
      CLK <= 1'bx;
    end
  end

  always @(posedge REF) begin
    if ((lastedge[22:0] != 23'b0) && (lastedge[31] == 0)) begin
      thisedge = $realtime;
      expdetect = thisedge[30:23] - lastedge[30:23];
      shiftededge = lastedge[22:0] >> expdetect;
      refpd = thisedge[22:0] - shiftededge;

      period = refpd - 32'b0_00000001_00000000000000000000000;
    end

    lastedge = $realtime;

  end

endmodule
