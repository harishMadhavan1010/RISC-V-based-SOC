# Week 3: Designing a RISC-V Core
This directory is dedicated to explaining/reporting my design of RISC-V core using TL-Verilog.

## Table of Contents
* [Day 3: Digital Logic with TL-Verilog in Makerchip IDE]()
  - [Logic Gates]()
  - [Combinational Logic]()
  - [Sequential Logic]()
  - [Pipelined Logic]()
  - [State]()
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
  
  We discuss some basic combinational logic circuits like Multiplexers, Adders, etc. Let's first consider some adder circuits. 
  
  A Half Adder takes in two inputs (A, B) and gives two outputs (S, Cout) where A and B represent the addends, S represents the sum and Cout represents the carry. Here, `S = XOR(A,B)` and `Cout = AND(A,B)`. Similary, a Full Adder takes in three inputs (A, B, Cin) and spits out two outputs (S, Cout). In this case, Cin is the input carry which may have happened because of output carry of the previous stage. In this case, `S = XOR(A,B,C) = XOR(XOR(A,B),C)` and `Cout = OR(AND(A,B), AND(Cin, XOR(A,B))`. From these examples, one can infer that more complex adder circuits arise out of smaller circuits (logic gates).
  
  Now, let's consider a multiplexer.
  
  ![Multiplexer](../Week%203/images/Capture2.PNG)
  
  In this circuit, the n selection lines (n bits) control the output by selecting a particular input (out of the 2^n inputs). Choose n=1 for simplicity. Here, there is only one selection line (1 bit) which can possess two values. If selection line is 0, the output takes in the value of the first input; if it is 1, the output takes in the value of the second input. We can easily implement this using ternary operator. Let sel be the selection line, let A and B be the first and the second input (respectively) and let y be the output.

  `y = sel ? B : A`
  
  We can build bigger multiplexers using smaller multiplexers. For example, a 4:1 multiplexer can be built using 2:1 multiplexers as shown below.
  
  ![4_1_Mux](../Week%203/images/Capture3.PNG)
  
  Finally comes a small exercise wherein I have constructed a small 32-bit calculator using various TL-V operators.
  
  ![CombCalc](../Week%203/images/Capture1.PNG)
