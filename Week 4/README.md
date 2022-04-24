# Integrating PLL and RISC-V Core
This directory is dedicated to share my experiences in integrating PLL and RISC-V core.

## Table of Contents
* [Introduction]()
* [Pre-Synthesis Simulations]()
* [Synthesis]()
* [Post-Synthesis Simulation]()
* [Results and Conclusion]()

## Introduction

> Our objective is to integrate PLL with rvmyth before proceeding onto DAC. Here, PLL serves as a clock multiplier and rvmyth is the RISC-V core. Since PLL is an analog block, it can't be written using synthesizable constructs in verilog. Hence, a functional verilog code is written to make it work and an interface is created between PLL and the core because the core is a digital block. Opensource tools like iverilog, gtkwave and yosys are used.

The following are the specifications of the VSD-PLL.

![PLL](../Week%204/images/Capture9.png)

![PLL](../Week%204/images/Capture10.png)

## Pre-Synthesis Simulations

First of all, relevant files are cloned from GitHub using `git clone https://github.com/kunalg123/rvmyth/`. Then, sandpiper is used to convert TLV files (used for developing rvmyth) to verilog files. Now, the following commands are run in the terminal to simulate the rvmyth. 

```  
  iverilog mythcore_test.v tb_mythcore_test.v 
  ./a.out
  gtkwave tb_mythcore_test.vcd 
```
  
![Core](../Week%204/images/Capture2.PNG)

The following commands are run to simulate the PLL.

```
  iverilog avsd_pll_1v8.v pll_tb.v
  ./a.out
  gtkwave tb_pll.vcd
```

![PLL](../Week%204/images/Capture3.PNG)

The following commands are run to simulate the interfacing of PLL and myth.

```
  iverilog rvmyth_pll.v rvmyth_pll_tb.v
  ./a.out
  gtkwave tb_pllcore.vcd
```
 
![PLLCore](../Week%204/images/Capture1.PNG)
 
## Synthesis
 
Synthesis is performed using yosys. First, `yosys` command is run in the terminal after which the following commands are executed.

```
read_verilog rvmyth_pll.v 
read_liberty -lib avsd_pll_1v8.lib 
read_liberty -lib sky130_fd_sc_hd__tt_025C_1v80.lib 
synth -top pllcore
dfflibmap -liberty sky130_fd_sc_hd__tt_025C_1v80.lib 
opt 
abc -liberty sky130_fd_sc_hd__tt_025C_1v80.lib -script +strash;scorr;ifraig;retime;{D};strash;dch,-f;map,-M,1,{D} 
flatten 
setundef -zero 
clean -purge 
rename -enumerate
stat 
write_verilog -noattr pllcore.synth.v 
```

## Post-Synthesis Simulation

Now, Gate-Level Simulation is run by executing the following commands in the terminal. 

```
iverilog primitives.v sky130_fd_sc_hd.v pllcore.synth.v pllcore_tb.v
./a.out
gtkwave tb_pllcore.vcd
```

The results and the shortcomings are posted in the next section.

## Results and Conclusion

The following is the result of the GLS and we can see how the output stays crowbarred for all clock cycles which is not the intended functionality (and hence a mismatch).

![PLLCore](../Week%204/images/Capture5.PNG)

The sources of the mismatch probably are my PLL file or my .lib file as I have even used the default mythcore file available in the repository shared previously instead of mine to avoid any other error on top of this. After debugging and figuring out where I am going wrong, this repository will be updated. The following is a segment of my PLL file.

![PLLfile](../Week%204/images/Capture6.PNG)

Here, I have used IEEE 754 FP standards to implement the non-synthesizable `real` construct which I specifically think is the source.
