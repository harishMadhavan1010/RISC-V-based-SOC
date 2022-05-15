# Week 5: Openlane

This directory is dedicated to share my experiences and progress I've made in executing the flow using Openlane.

## Table of Contents:
   - [Introduction](https://github.com/harishMadhavan1010/RISC-V-based-SOC/blob/main/Week%205/README.md#introduction)
   - [Openlane Flow](https://github.com/harishMadhavan1010/RISC-V-based-SOC/blob/main/Week%205/README.md#openlane-flow)
   - [DAC Magic File](https://github.com/harishMadhavan1010/RISC-V-based-SOC/blob/main/Week%205/README.md#dac-magic-file)
   - [Current Progress](https://github.com/harishMadhavan1010/RISC-V-based-SOC/blob/main/Week%205/README.md#current-progress)
   - [Conclusion](https://github.com/harishMadhavan1010/RISC-V-based-SOC/blob/main/Week%205/README.md#conclusion)

## Introduction

> Openlane is an automated RTL-GDSII flow based on several components like OpenROAD, yosys, Magic, Netgen, Fault, OpenPhySyn, SPEF-extractor and custom methodology scripts for design exploration and optimization. This week, I have focussed on using openlane to execute the flow of rvmyth-DAC interface.

## Openlane Flow

OpenLane flow consists of several stages. By default all flow steps are run in sequence. Each stage may consist of multiple sub-stages. OpenLane can also be run interactively as shown here.

    Synthesis
        yosys - Performs RTL synthesis
        abc - Performs technology mapping
        OpenSTA - Performs static timing analysis on the resulting netlist to generate timing reports
    Floorplan and PDN
        init_fp - Defines the core area for the macro as well as the rows (used for placement) and the tracks (used for routing)
        ioplacer - Places the macro input and output ports
        pdn - Generates the power distribution network
        tapcell - Inserts welltap and decap cells in the floorplan
    Placement
        RePLace - Performs global placement
        Resizer - Performs optional optimizations on the design
        OpenDP - Perfroms detailed placement to legalize the globally placed components
    CTS
        TritonCTS - Synthesizes the clock distribution network (the clock tree)
    Routing
        FastRoute - Performs global routing to generate a guide file for the detailed router
        CU-GR - Another option for performing global routing.
        TritonRoute - Performs detailed routing
        SPEF-Extractor - Performs SPEF extraction
    GDSII Generation
        Magic - Streams out the final GDSII layout file from the routed def
        Klayout - Streams out the final GDSII layout file from the routed def as a back-up
    Checks
        Magic - Performs DRC Checks & Antenna Checks
        Klayout - Performs DRC Checks
        Netgen - Performs LVS Checks
        CVC - Performs Circuit Validity Checks


![DAC](../Week%206/images/Capture6.png)

## DAC Magic File

The following is the .mag file of DAC when `magic -T sky130A.tech avsddac.mag` is executed in the terminal.

![DAC_mag](../Week%206/images/Capture8.png)

Here's a more zoomed-in version of the same.

![DAC_mag](../Week%206/images/Capture9.png)

The following is the DAC design I have implemented in magic.

![DAC_design](../Week%206/images/Capture7.png)

Here, the switches (SPST) can be reduced to SPDT switches which can be designed directly by implementing 2:1 Multiplexers.

## Current Progress

The openlane tools are set up properly and have been tested. To open the bash window to make use of the docker, `docker run -it -v $(pwd):/openLANE_flow -v $PDK_ROOT:$PDK_ROOT -e PDK_ROOT=$PDK_ROOT -u $(id -u $USER):$(id -g $USER) openlane:rc6` is executed. Before that, necessary directories, verilog files and .lef files are added.

```
./flow.tcl -design rvmyth_avsddac -init_design_config (Creates a config.tcl file)

package require openlane 0.9 (Checks if a package exists and returns the version specified)
prep -design rvmyth_avsddac -overwrite (prepares a run in openlane or loads a previously stopped run in order to proceed with it.)
set lefs 	 [glob $::env(DESIGN_DIR)/src/lef/*.lef] (A variable called lefs is created)
add_lefs -src $lefs (the lef file is added)

The following commands are for executing the openlane flow.

run_synthesis
init_floorplan
magic -T ~/sky130A.tech lef read ~/merged.lef def read rvmyth_avsddac.floorplan.def
place_io
global_placement_or
detailed_placement
tap_decap_or
detailed_placement
magic -T ~/sky130A.tech lef read ~/merged.lef def read rvmyth_avsddac.placement.def
```

A major issue comes up in the synthesis phase for me because DAC uses `real` keyword and uses $itor function (which was discussed last week). These are not synthesizable verilog constructs. However, the new challenge now is that the .lib file (which was a workaround to fix this problem back in Week 4 & 5) is not read by yosys while going through the flow. As of now, I am going through the documentation to solve this issue.

![avsddac_lib](../Week%206/images/Capture3.PNG)

`LIB_SYNTH` is the environmental variable which contains the path to liberty files stored for synthesis and I've checked if the necessary lines exist in the trimmed .lib file.

![lib_synth](../Week%206/images/Capture4.PNG)

![trimmed_lib](../Week%206/images/Capture5.PNG)

## Conclusion

I am working with DAC-rvmyth interface for now as opposed to the entire system because if I get this specific part to work, since the same flow is valid for PLL as well, I can easily execute the flow for the entire SoC design. My work as of now will be to figure out another workaround to perform synthesis.
