# Integrating PLL and RISC-V Core
This directory is dedicated to share my experiences in integrating PLL and RISC-V core.

## Table of Contents
* [Introduction](https://github.com/harishMadhavan1010/RISC-V-based-SOC/blob/main/Week%204/README.md#introduction)
* [Pre-Synthesis Simulations](https://github.com/harishMadhavan1010/RISC-V-based-SOC/blob/main/Week%204/README.md#pre-synthesis-simulations)
* [Synthesis](https://github.com/harishMadhavan1010/RISC-V-based-SOC/blob/main/Week%204/README.md#synthesis)
* [Post-Synthesis Simulation](https://github.com/harishMadhavan1010/RISC-V-based-SOC/blob/main/Week%204/README.md#post-synthesis-simulations)
* [Results and Conclusion](https://github.com/harishMadhavan1010/RISC-V-based-SOC/blob/main/Week%204/README.md#results-and-conclusion)

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
  iverilog pllcore.v pllcore_tb.v
  ./a.out
  gtkwave tb_pllcore.vcd
```
 
![PLLCore](../Week%204/images/Capture1.PNG)
 
## Synthesis
 
Synthesis is performed using yosys. First, `yosys` command is run in the terminal after which the following commands are executed.

```
read_verilog pllcore.v 
read_liberty -lib avsdpll.lib 
read_liberty -lib sky130_fd_sc_hd__tt_025C_1v80.lib 
synth -top pllcore
dfflibmap -prepare -liberty sky130_fd_sc_hd__tt_025C_1v80.lib
abc -liberty sky130_fd_sc_hd__tt_025C_1v80.lib -script +strash;scorr;ifraig;retime;{D};strash;dch,-f;map,-M,1,{D} 
write_verilog -noattr pllcore_synth.v 
```

## Post-Synthesis Simulation

Now, Gate-Level Simulation is run by executing the following commands in the terminal. 

```
iverilog primitives.v sky130_fd_sc_hd.v pllcore_synth.v pllcore_tb.v avsdpll.v
./a.out
gtkwave tb_pllcore.vcd
```

The following image is the post-synthesis simulation of the PLL.

![post-synth](../Week%204/images/Capture11.PNG)

The results and the shortcomings are posted in the next section.

## Results and Conclusion

The following was (now fixed) the result of the GLS and we can see how the output stays crowbarred for all clock cycles which is not the intended functionality (and hence a mismatch).

![PLLCore](../Week%204/images/Capture5.PNG)

The source of the mismatch is my PLL file and my mythcore file. The mythcore file (RISC-V core) after synthesis doesn't function as intended because of `dfflibmap` but this issue can easily be fixed if we use `-prepare` flag. My original PLL file was flawed and for unknown reasons, didn't let total simulation ticks go beyond 384000 ticks (384ns) which severely hindered my post-synth simulation showcase and hence I have removed IEEE floating-point syntax (which I formerly included to replace `real`). This makes the simulation run as intended. For synthesis, I have converted pll verilog file to liberty file and made that be read by yosys.

> However, there still is a trivial mismatch between the pre-synth simulation and GLS. We can notice how in the pre-synth simulation, right as the reset goes low, out immediately changes to 0. But, in the GLS, it remains crowbarred for a short while. Apart from this minor shift in out, everything else remain one-to-one.
