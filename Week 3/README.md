# Week 3: Designing a RISC-V Core
This directory is dedicated to explaining/reporting my design of RISC-V core using TL-Verilog.

## Table of Contents
* [Day 3: Digital Logic with TL-Verilog in Makerchip IDE]()
  - [Logic Gates]()
  - [Combinational Logic]()
  - [Sequential Logic]()
  - [Pipelined Logic]()
* [Day 4: Coding a RISC-V CPU subset]()
* [Day 5: Pipelining and completing your CPU]()


## Day 3
  ### Logic Gates
  
  |   Name    | Function  |  Syntax  |
  |-----------|-----------|----------|
  |   NOT(A)  |   ¬A      |       !A |
  |  AND(A,B) |   A^B     |      A&B |
  |   OR(A,B) |   AvB     |      A|B |
  |  XOR(A,B) |¬A^B v ¬B^A|      A^B |
  |  NAND(A,B)| ¬(A^B)    |   !(A&B) |
  |   NOR(A,B)| ¬(AvB)    |   !(A|B) |
  |  XNOR(A,B)|¬A^¬B v A^B|   !(A^B) |

  These are the fundamental logic gates which not only help us build bigger circuits but also serve as a conceptual latching point in understanding more advanced concepts or ideas.

  ### Combinational Logic
  
  Let's discuss some basic combinational logic circuits like Multiplexers, Adders, etc. Let's first consider some adder circuits. 
  
  A Half Adder takes in two inputs (A, B) and gives two outputs (S, Cout) where A and B represent the addends, S represents the sum and Cout represents the carry. Here, `S = XOR(A,B)` and `Cout = AND(A,B)`. Similary, a Full Adder takes in three inputs (A, B, Cin) and spits out two outputs (S, Cout). In this case, Cin is the input carry which may have happened because of output carry of the previous stage. In this case, `S = XOR(A,B,C) = XOR(XOR(A,B),C)` and `Cout = OR(AND(A,B), AND(Cin, XOR(A,B))`. From these examples, one can infer that more complex adder circuits arise out of smaller circuits (logic gates).
  
  Now, let's consider a multiplexer.
  
  ![Multiplexer](../Week%203/images/Capture2.png)
  
  In this circuit, the n selection lines (n bits) control the output by selecting a particular input (out of the 2^n inputs). Choose n=1 for simplicity. Here, there is only one selection line (1 bit) which can possess two values. If selection line is 0, the output takes in the value of the first input; if it is 1, the output takes in the value of the second input. We can easily implement this using ternary operator. Let sel be the selection line, let A and B be the first and the second input (respectively) and let y be the output.

  `y = sel ? B : A`
  
  We can build bigger multiplexers using smaller multiplexers. For example, a 4:1 multiplexer can be built using 2:1 multiplexers as shown below.
  
  ![4_1_Mux](../Week%203/images/Capture3.PNG)
  
  Finally comes a small exercise wherein I have constructed a small 32-bit calculator using various TL-V operators.
  
  ![CombCalc](../Week%203/images/Capture1.PNG)
  
  ### Sequential Logic
  
  Sequential Logic is sequenced by a clock signal. Let's start out by considering the simplest sequential circuit i.e. the D-Flip Flop. A D-Flip Flop transitions next state to current state on a rising clock edge.
  
  ![DFF](../Week%203/images/Capture4.PNG)
  
  A sequential circuit can be used as a state machine with DFFs and combinational logic, sequenced by a clk signal.
  
  ![SeqCir](../Week%203/images/Capture5.PNG)
  
  Let's look at a free-running 4-bit counter. This counter counts from 0 to F (which is a sequence of numbers with next number equal to the current number incremented by 1) and rolls over beyond that. We can reimagine the output of the counter as the output of the adder circuit whose inputs are the previous output of the adder and 1. This circuit is modelled in TL-Verilog as:
  
  ![Counter](../Week%203/images/Capture6.PNG)
  
  Now, with this knowledge, we can update our calculator circuit to include past inputs as well, as shown below.
  
  ![SeqCalc](../Week%203/images/Capture7.PNG)
  
  The addition of the line `$val1 = >>1$out` creates a DFF at the end of the output which is then fedback to `$val1`.
  
  ### Pipelined Logic
  
  Note how the examples showed that DFF basically shifts it's input back by one time unit. We can now think of the entire circuit as one big pipeline. The pipeline is divided into various sectors/stages with the introduction of DFF prior to the next stage. If we place DFFs at appropriate nodes, we can control the timing of our circuit. This concept is called retiming. We illustrate this in the following example.
  
  ![Pythagoras](../Week%203/images/Capture8.PNG)
  
  The above code uses Pythagoras' Theorem to compute the value of the hypotenuse. The `|calc` creates a pipeline. `@1`, `@2`, `@3` basically sectors the pipeline up as stages.
  
  Reframing our calculator and our counter to showcase the formerly unmentioned pipelines:
  
  ![Calccnt](../Week%203/images/Capture9.PNG)
  
  Now, in order to deal with high frequency clocks, we have to add more stages to our pipeline. With more stages shifts alignment of output being fed back to the input `val1`. We also have to ensure that the multiplexer doesn't keep spewing out garbage values by using a 2-bit counter. This also takes care of clock gating.
  
  ![Calcnew](../Week%203/images/Capture10.PNG) 

  Now, we introduce ourselves a new syntax `?$valid` where `$valid` is a variable which defines when a certain operation is valid and `?<var>` ensures that the block turns off whenever <var> is not high. This provides a cleaner design and makes it easy to debug.
  
  The following is the pythagoras theorem example but with validity syntax included in it.
  
  ![Pythval](../Week%203/images/Capture11.PNG)
  
  We now also include the total distance by accumulating individual distances.
  
  ![Pythvalacc](../Week%203/images/Capture12.PNG)
  
  The following is the calculator with validity syntax included in it.
  
  ![Calcval](../Week%203/images/Capture13.PNG) 
  
  We now also include memory and recall features by extending the multiplexer.
  
  ![Calcmemrec](../Week%203/images/Capture14.PNG) 
  
## Day 4: Coding a RISC-V subset
  
  The following is the pipelined version of the microarchitecture we are going to implement using TL-Verilog. The important parts are highlighted and will be described as we move on further.
  
  ![uarch](../Week%203/images/Capture17.PNG)
  
  We begin by implementing the program counter which increments by 4 bytes i.e. increments by 1 instruction. Then, we include instruction memory and make appropriate connections to perform Instruction Fetch.
  
  ![PC](../Week%203/images/Capture15.PNG)
  
  ![IFetch](../Week%203/images/Capture16.PNG)
  
  Then comes the decoding part. First up, the instruction type is determined by the instr[6:2]. There are 6 differents types of instructions i.e. R, I, S, B, J and U. Each of these have its own way of addressing. We then extract various fields out of the instruction like immediate values, rs1, rs2, etc. To illustrate, the imm entries can be extracted as follows:
  
  ![ImmDecode](../Week%203/images/Capture19.PNG)
  
  The TL-V to perform these is shown below:
  
  ![TypeIden](../Week%203/images/Capture21.PNG)
  
  ![ImmDec2](../Week%203/images/Capture22.PNG)
  
  The other fields are opcode, rs1, rs2, funct3, funct7 and rd. We can know when they occur and eventually represent instructions as a bunch of instruction fields so that when the CPU sees the fields, it can recognize which instruction it is and perform suitable operation.
  
  ![validWhen](../Week%203/images/Capture23.PNG)
  
  ![validityInstr](../Week%203/images/Capture24.PNG)
  
  We then decode various simple instructions like ADD, ADDI and BEQ! The decoding procedure is fairly simple. Each operation depends on opcode and funct3 and a few also depend on funct7 as well. The decoding procedure is illustrated below.
  
  ![InstDecode](../Week%203/images/Capture25.PNG)
  
  We now include Register File and learn how to interface it and read it. The register file we are using is `2-read, 1-write register file` which has two sources to read from and one destination to write to. This part is fairly simple and the code for which is shown below.
  
  ![RegFileRead](../Week%203/images/Capture26.PNG)
  
  (WIP)
