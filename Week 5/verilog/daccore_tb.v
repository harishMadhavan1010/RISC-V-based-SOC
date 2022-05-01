module daccore_tb;

   reg clk, reset;
   wire real out;

   daccore uut (.clk(clk), .reset(reset), .out(out));

   initial begin
      $dumpfile("tb_daccore.vcd");
      $dumpvars(0, daccore_tb);

      clk = 1'b1;

      reset = 0;
      #2 reset = 1;
      #6 reset = 0;

      #5000 $finish;

   end
   always #1 clk = ~clk;

endmodule
