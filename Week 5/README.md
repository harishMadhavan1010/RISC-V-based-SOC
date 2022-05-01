# Week 5: DAC Modelling and Openlane

This directory is dedicated to share my experiences in integrating PLL and RISC-V core.

## Table of Contents:
   - [Introduction](https://github.com/harishMadhavan1010/RISC-V-based-SOC/blob/main/Week%205/README.md#introduction)
   - [DAC Pre-synthesis Simulation](https://github.com/harishMadhavan1010/RISC-V-based-SOC/blob/main/Week%205/README.md#dac-pre-synthesis-simulation)
   - [DAC Post-synthesis Simulation](https://github.com/harishMadhavan1010/RISC-V-based-SOC/blob/main/Week%205/README.md#dac-post-synthesis-simulation)
   - [Openlane](https://github.com/harishMadhavan1010/RISC-V-based-SOC/blob/main/Week%205/README.md#openlane)
   - [Conclusion](https://github.com/harishMadhavan1010/RISC-V-based-SOC/blob/main/Week%205/README.md#conclusion)

## Introduction

> Our objective is to integrate rvmyth with DAC before proceeding onto Openlane. Here, rvmyth is the RISC-V core and DAC converts the digital output coming out of the core into an analog output. Since DAC is an analog block, it can't be written using synthesizable constructs in verilog. Hence, a functional verilog code is written to make it work and an interface is created between the core and DAC because the core is a digital block. Opensource tools like iverilog, gtkwave and yosys are used to perform this.

The following image is the DAC we are trying to implement.

![DAC](../Week%205/images/Capture5.png)

## DAC Pre-synthesis Simulation

First of all, relevant files are cloned from GitHub using `git clone https://github.com/kunalg123/rvmyth/`. Then, sandpiper is used to convert TLV files (used for developing rvmyth) to verilog files. Now, the following commands are run in the terminal to simulate the DAC.

```  
  iverilog avsddac.v avsddac_tb.v
  ./a.out
  gtkwave tb_avsddac.vcd
```
  
![dac](../Week%205/images/Capture3.PNG)

The following commands are run in the terminal for pre-synthesis simulation of the interface.

```
  iverilog daccore.v daccore_tb.v
  ./a.out
  gtkwave tb_daccore.vcd
```

![daccore](../Week%205/images/Capture1.PNG)

## DAC Post-synthesis Simulation

Synthesis is performed using yosys. First, yosys command is run in the terminal after which the following commands are executed.

```
read_verilog daccore.v 
read_liberty -lib avsddac.lib 
read_liberty -lib sky130_fd_sc_hd__tt_025C_1v80.lib 
synth -top daccore
dfflibmap -prepare -liberty sky130_fd_sc_hd__tt_025C_1v80.lib
abc -liberty sky130_fd_sc_hd__tt_025C_1v80.lib -script +strash;scorr;ifraig;retime;{D};strash;dch,-f;map,-M,1,{D}
write_verilog -noattr daccore_synth.v 
```

Now, Gate-Level Simulation is run by executing the following commands in the terminal.

```
iverilog primitives.v sky130_fd_sc_hd.v daccore_synth.v daccore_tb.v avsddac.v
./a.out
gtkwave tb_daccore.vcd
```

![postsynth](../Week%205/images/Capture2.PNG)

## Openlane

> Openlane is an automated RTL to GDSII flow based on various tools like OpenROAD, Yosys, Magic, Netgen, Fault, SPEF-Extractor and custom methodology scripts for design exploration and optimization. I have followed the steps advised in this repository for getting my Openlane setup: https://github.com/nickson-jose/openlane_build_script. I have simulated a simple design, "spm", to verify if the tools are working correctly. The following are the steps to obtain success (once we get the tool setup properly).

```
docker run -it -v $(pwd):/openlane -v $PDK_ROOT:$PDK_ROOT -e PDK_ROOT=$PDK_ROOT -u $(id -u $USER):$(id -g $USER) efabless/openlane:mpw-4
./flow.tcl -design spm
```

![spm](../Week%205/images/Capture4.PNG)

## Conclusion and Results

So far, the preliminary results have been obtained. I have debugged and thereby removed the synthesis-simulation mismatches. The error actually arises due to dfflibmap which simply skips cells if they don't match. This can be solved by using `-prepare` flag which forces it to include a best-fit DFF instead of not fitting anything.

**Future Plans:**

- Report describing PLL post-synth simulations
- Re-organizing the workspace
- Physical Design of the components
