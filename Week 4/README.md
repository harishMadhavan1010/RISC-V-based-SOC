# Integrating PLL and RISC-V Core
This directory is dedicated to share my experiences in integrating PLL and RISC-V core.

## Table of Contents
* [Introduction]()
* [Pre-Synthesis Simulations]()
* [Synthesis]()
* [Post-Synthesis Simulation]()
* [Conclusion, Updates and References]()

## Introduction

> Our objective is to integrate PLL with rvmyth before proceeding onto DAC. Here, PLL serves as a clock multiplier and rvmyth is the RISC-V core. Since PLL is an analog block, it can't be written using synthesizable constructs in verilog. Hence, a functional verilog code is written to make it work and an interface is created between PLL and the core because the core is a digital block. Opensource tools like iverilog, gtkwave and yosys are used.

The following are the specifications of the VSD-PLL.

![PLL](../Week%204/images/Capture9.png)

![PLL](../Week%204/images/Capture10.png)

## Pre-Synthesis Simulations

First of all, relevant files are cloned from GitHub using `git clone https://github.com/kunalg123/rvmyth/`. Now, the following commands are run in the terminal to simulate the rvmyth.

```   iverilog mythcore_test.v tb_mythcore_test.v 
  ./a.out
  gtkwave tb_mythcore_test.vcd ```
  
![Core](../Week%204/images/Capture1.png)

The following commands are run to simulate the PLL.

```  iverilog avsd_pll_1v8.v pll_tb.v
  ./a.out
  gtkwave tb_pll.vcd```

![PLL](../Week%204/images/Capture2.png)

The following commands are run to simulate the interfacing of PLL and myth.

```  iverilog rvmyth_pll.v rvmyth_pll_tb.v
 ./a.out
 gtkwave tb_pllcore.vcd```
 
 ![PLLCore](../Week%204/images/Capture3.png)
 
 ## Synthesis
 
