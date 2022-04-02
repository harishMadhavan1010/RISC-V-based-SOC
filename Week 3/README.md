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


## Day 1
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

  The logic gates are fundamental, using which bigger circuits are constructed.

  ### Combinational Logic
  
  
