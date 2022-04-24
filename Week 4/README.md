# Integrating PLL and RISC-V Core
This directory is dedicated to share my experiences in integrating PLL and RISC-V core.

## Table of Contents
* [Introduction]()
* [Pre-Synthesis Simulations]()
* [Synthesis]()
* [Post-Synthesis Simulation]()
* [Conclusion, Updates and References]()

## Introduction

> Our objective is to integrate PLL with rvmyth before proceeding onto DAC. Here, PLL serves as a clock multiplier and rvmyth is the RISC-V core. Since PLL is an analog block, it can't be written synthesizably in verilog. Hence, a functional verilog code is written to make it work. Opensource tools like iverilog, gtkwave and yosys are used.



