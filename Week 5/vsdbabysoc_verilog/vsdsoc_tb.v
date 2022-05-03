`timescale 1ns / 1ps
module vsdsoc_tb;

  reg VSSD;
  reg EN_VCO;
  reg VSSA;
  reg VDDD;
  reg VDDA;
  reg VCO_IN;
  reg REF;

  reg reset;
  wire real out;

   vsdsoc uut (.VCO_IN(VCO_IN), .VDDA(VDDA), .VDDD(VDDD), .VSSA(VSSA), 
               .VSSD(VSSD), .EN_VCO(EN_VCO), .REF(REF), .reset(reset), .out(out));

   initial begin
    {REF, EN_VCO} = 0;
    VCO_IN = 1'b0;
    VDDA = 1.8;
    VDDD = 1.8;
    VSSA = 0;
    VSSD = 0;
    reset = 0;
    #20 reset = 1;
    #100 reset = 0;

  end

  initial begin
    $dumpfile("tb_vsdsoc.vcd");
    $dumpvars(0, vsdsoc_tb);
  end

  initial begin
    repeat(400)
    begin
      EN_VCO = 1;
      #100 REF = ~REF;
      #(83.33/2) VCO_IN = ~VCO_IN;
    end

    $finish;
  end

endmodule
