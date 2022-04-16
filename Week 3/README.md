# Week 3: Designing a RISC-V Core
This directory is dedicated to explaining/reporting my design of RISC-V core using TL-Verilog.

## Table of Contents
* [Day 3: Digital Logic with TL-Verilog in Makerchip IDE](https://github.com/harishMadhavan1010/RISC-V-based-SOC/tree/main/Week%203#day-3)
  - [Logic Gates](https://github.com/harishMadhavan1010/RISC-V-based-SOC/tree/main/Week%203#logic-gates)
  - [Combinational Logic](https://github.com/harishMadhavan1010/RISC-V-based-SOC/tree/main/Week%203#combinational-logic)
  - [Sequential Logic](https://github.com/harishMadhavan1010/RISC-V-based-SOC/tree/main/Week%203#sequential-logic)
  - [Pipelined Logic](https://github.com/harishMadhavan1010/RISC-V-based-SOC/tree/main/Week%203#pipelined-logic)
* [Day 4: Coding a RISC-V CPU subset](https://github.com/harishMadhavan1010/RISC-V-based-SOC/tree/main/Week%203#day-4)
* [Day 5: Pipelining and completing the CPU](https://github.com/harishMadhavan1010/RISC-V-based-SOC/tree/main/Week%203#day-5)
  - [Pipelining the CPU](https://github.com/harishMadhavan1010/RISC-V-based-SOC/tree/main/Week%203#pipelining-the-cpu)
  - [Execution](https://github.com/harishMadhavan1010/RISC-V-based-SOC/tree/main/Week%203#execution)
  - [Waveforms](https://github.com/harishMadhavan1010/RISC-V-based-SOC/tree/main/Week%203#waveforms)


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
  
  Finally comes a small exercise wherein I have constructed a small 32-bit calculator using various TL-V operators.
  
  ![CombCalc](../Week%203/images/Capture1.PNG)
  
  ### Sequential Logic
  
  Sequential Logic is sequenced by a clock signal. Let's start out by considering the simplest sequential circuit i.e. the D-Flip Flop. A D-Flip Flop transitions next state to current state on a rising clock edge. A sequential circuit can be used as a state machine with DFFs and combinational logic, sequenced by a clk signal.
  
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
  
  Then, we compute some simple instructions like ADD and ADDI (which make up a part of the ALU). We then deal with actually writing that data to the Register File. This is illustrated below.
  
  > NOTE: Register 0 can't be written to.
  
  ![ALU](../Week%203/images/Capture27.PNG)
  
  ![RegFileWr](../Week%203/images/Capture28.PNG)
  
  Then comes the part where branching instructions are implemented! These instructions are conditional and when the condition is met with, the PC takes another value i.e. `br_tgt_pc`. This is fairly simple if we use ternary operators and implement each one of the six instructions.
  
  ![Branch](../Week%203/images/Capture29.PNG)
  
  We finally check the instructions through the handy visualization implementation provided in the Makerchip IDE. The following images show that the simulation was successful. A more detailed visualization containing the instructions is also shown after this.
  
  ![SimComm](../Week%203/images/Capture31.PNG)
  
  ![SimPass](../Week%203/images/Capture30.PNG)
  
  <details><summary><b><u><ins>Click here to check the detailed visualization!</ins></u></b></summary>
  
  <p>
  
  ```
    // External to function:
   m4_asm(ADD, r10, r0, r0)             // Initialize r10 (a0) to 0.
   // Function:
   m4_asm(ADD, r14, r10, r0)            // Initialize sum register a4 with 0x0
   m4_asm(ADDI, r12, r10, 1010)         // Store count of 10 in register a2.
   m4_asm(ADD, r13, r10, r0)            // Initialize intermediate sum register a3 with 0
   // Loop:
   m4_asm(ADD, r14, r13, r14)           // Incremental addition
   m4_asm(ADDI, r13, r13, 1)            // Increment intermediate register by 1
   m4_asm(BLT, r13, r12, 1111111111000) // If a3 is less than a2, branch to label named <loop>
   m4_asm(ADD, r10, r14, r0)            // Store final result to register a0 so that it can be read by main program
  ```
    
  Note that the reset stays for some time, taking up a few cycles at the start. So, the instructions start executing from the 4th cycle. Each register is loaded with a value equal to the register's location in the register file initially. The main ones we care about are x10, x12, x13 and x14. x10 is to store the final value. x12 and x13 basically are used to form a loop by storing the limitting condition and incrementing the iterating variable respectively. x14 stores sum of natural numbers from 1 to the value of x13. The instructions themselves are self-explanatory.
  
  ![Visualization](../Week%203/images/Capture32.PNG)
  ![Visualization](../Week%203/images/Capture33.PNG)
  ![Visualization](../Week%203/images/Capture34.PNG)
  ![Visualization](../Week%203/images/Capture35.PNG)
  ![Visualization](../Week%203/images/Capture36.PNG)
  ![Visualization](../Week%203/images/Capture37.PNG)
  ![Visualization](../Week%203/images/Capture38.PNG)
  ![Visualization](../Week%203/images/Capture39.PNG)
  ![Visualization](../Week%203/images/Capture40.PNG)
  
  </p>
  </details>

  ## Day 5
  
  ### Pipelining the CPU
  
  In order to make the RISC-V core run at a high clock frequency, pipelining the CPU into several stages and executing them parallely is a must. However, adding more stages just like that doesn't work because of timing issues.

  ![Pipelining](../Week%203/images/Capture42.PNG)
  
  To resolve the issues, we look at the "Waterfall Logic Diagram" (which basically represents feedback loops as set of new time-shifted pipelines). These diagrams make a complex pipeline be understandable physically in the form of waterfalls. Signals flows through nets which may drip down into hypothetical pipelines placed below the existing ones. If the signals drip backward, it goes against our expectations and hence not realizable. These unrealizable nets are hazards.
  
  ![Pipelining](../Week%203/images/Capture41.PNG)
  
  To fix them requires adding hardware like Flip Flops but in TL-Verilog, it's as simple as using `>>1` or `>>2`. Everything done in Day-4 stays is restructured and timing is ensured as well. This solves pretty much everything, except for branch targets. Determining branch targets isn't easy and so, in this design, for the sake of brevity, I've decided to keep it simple and don't execute (or) write for a few cycles. This is very easy to implement and is shown below. The following basically defines a signal `$valid` such that ALU, branch targets, jumps, register files, etc. operate only as long as the last two instructions aren't branching instructions.
  
  ```
  $valid_taken_br = $taken_br & $valid;
  $valid = ! (>>1$valid_taken_br || >>2$valid_taken_br);
  ```
  
  Note that hazards exist whenever read and write are in different stages because when the destination register in previous instruction is the source register in current instruction. This happens because of a hypothetical net which forms so that the values we use as source operands are valid. If ignored, this will cause hideous bugs. To fix these bugs, we use multiplexers to select appropriate values as shown below.
  
  ![ReadWrite](../Week%203/images/Capture43.PNG)
  
  All the other instructions are now taken care of as well including load and store instructions.
  
  ![InstrDecode](../Week%203/images/Capture44.PNG)
  
  ![Instructions](../Week%203/images/Capture45.PNG)
  
  Then, we include Data Memory for utilizing Load and Store instructions. Load takes in a value from Data Memory and write that in Register File. Store instructions takens in the value of the source operand and write that in Data Memory.
  
  ![DMem](../Week%203/images/Capture46.PNG)
  
  ![Load](../Week%203/images/Capture47.PNG)
  
  Finally comes the jump instructions: `JAL` and `JALR`. They are very similar to branches but they are unconditional in nature. Also, JAL jumps relative to Program Counter whereas JALR jumps to a fixed address independent of the current value in Program Counter.
  
  ```
  JAL: $pc + $imm
  JALR: $src1_value + $imm
  ```
  
  Appropriate changes are made in the `$pc` and `$valid` signal.
  
  ![PC](../Week%203/images/Capture49.PNG)
  
  ![Valid](../Week%203/images/Capture50.PNG)
  
  > Note how `$valid` depends on `$reset` to stop ALU from executing when the reset signal is active.
  
  ### Execution:
  
  The following image consists of the program we are going to execute. The new lines are the load, store and jump instructions those of which have been implemented recently. They don't serve any real purpose apart from adding style points and verifying whether the instructions function as intended.
  
  ![Program](../Week%203/images/Capture48.PNG)
  
  Since the program itself is covered already, I'll showcase the important details. The presentation is made more investigative and observational to keep the readers engaged. 
  
  <details><summary><b><u><ins>Click here to view the results!</ins></u></b></summary>
  
  <p>
    
  ![Visualization](../Week%203/images/Capture51.PNG)
    
  > Note how mentioning r0 as source operand didn't influence at all in determining where the data is stored in Data Memory and a random value "100" is kept at the end. Somehow, we ended up at d1.
    
  ![Visualization](../Week%203/images/Capture52.PNG)
    
  > Load takes two more cycles to write in the Register File because: we need to avoid hazards which happens when load instruction and instruction using RF on the same register.
    
  ![Visualization](../Week%203/images/Capture53.PNG)
    
  > Note how instructions aren't executed or register file is written to. It's because of the `$valid` which shuts off hardware in the later stages (like ALU) from executing.
    
  ![Visualization](../Week%203/images/Capture54.PNG)
    
  > Note how the load instruction finally writes to register file in x15.
    
  ![Visualization](../Week%203/images/Capture55.PNG)
    
  > Note how the instructions which weren't executed after load instruction is used are now executed. Also note how r1 and `1000` points to d2 now. After noticing the code, we can now see that 1000 is the immediate value and r1 is the source operand.
    
  ![Visualization](../Week%203/images/Capture56.PNG)
    
  > Note how r2 and `1100` points to d3 now. "01 - 1, 10 - 2 and 11 - 3" Here, we can notice that either the source operand and the immediate value directly decides which register we are going to end up at in data memory. But in reality, this is just a trick, it actually depends only on immediate value (in this case) because the first two bits of `$src1_value + $imm` aren't considered while taking address of Data Memory.
    
  ![Visualization](../Week%203/images/Capture57.PNG)
    
  > JAL is very similar to Branch Targets but is unconditional. It takes two cycles just to execute.
    
  ![Visualization](../Week%203/images/Capture58.PNG)
    
  > Like branch instructions and load instructions, jump instructions suffer from this tradeoff.
    
  ![Visualization](../Week%203/images/Capture59.PNG)
    
  > Note how ALU returns a value even for jump instructions but this implementation decides not to write in any registers unnecessarily as it might cause unnecessary bugs. By keeping write-enable to register file like the following, one can avoid this issue. 
    
  `$rf_wr_en = ($valid_jump ^ $valid_load ^ $write_valid) || >>2$valid_load;`
    
  ![Visualization](../Week%203/images/Capture60.PNG)
    
  > Note how this is just self-loop to stop the program counter from ramping up unnecessarily. 
    
  </p>
    
  </details>
  
  ### Waveforms:
  
  ![Waveforms](../Week%203/images/Capture61.PNG)
  
  ![Waveforms](../Week%203/images/Capture62.PNG)
  
  ![Waveforms](../Week%203/images/Capture63.PNG)
