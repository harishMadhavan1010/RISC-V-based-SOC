module pllcore_tb;
  reg VSSD;
  reg EN_VCO;
  reg VSSA;
  reg VDDD;
  reg VDDA;
  reg VCO_IN;
  reg REF;

  reg reset;
  wire [9:0] out;

  pllcore uut (.VCO_IN(VCO_IN), .EN_VCO(EN_VCO), .VDDD(VDDD), .VDDA(VDDA), .VSSA(VSSA), .VSSD(VSSD), .REF(REF), .reset(reset), .out(out));

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
    $dumpfile("tb_pllcore.vcd");
    $dumpvars(0, pllcore_tb);
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
