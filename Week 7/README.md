# Advanced Physical Design using Openlane

This week summarizes my experience learning advanced physical design using Openlane

## Table of Contents

   - [Day 1: Openlane and Sky130 PDK]()
   - [Day 2: Floorplanning and library cells]()
   - [Day 3: ngspice characterization and Magic Layout]()
   - [Day 4: Timing Analysis and Clock Tree Synthesis]()
   - [Day 5: Routing, DRC and Power Distribution Network]()

## Openlane and Sky130 PDK

   Let's first consider a QFN-48 package (Quad Flats No-leads with 48 pins); the chip itself is towards the middle of the package which is connected to the pins by wire bonds. Pads allow the transmission of signals from inside the chip to outside of the chip and vice versa. The core of the chip basically contains all the logic required and a die is a small block of semiconducting material on which a given functional circuit is fabricated. The following image helps in visualizing what is mentioned so far.
   
   IMG Cap1
   
   The following image considers an example (RISC-V core with DAC, ADC, SPI, PLL, etc.) to demonstrate the concept of Macros and IPs. Here, DAC, ADC, SPI and PLL are IPs (Intellectual Properties) because these designs arose out of some specific creative techniques used in the foundries. Macros are reusable assets (which are also IPs) to keep up with the project schedule.
   
   IMG Cap2
   
   **What is a PDK?**
   
   A PDK is Process Design Kit which to put simply is an interface between the fab and the designers. It is a collection of tools used to model a fabrication process for EDA tools to design an IC like Process Design Rules (DRC, LVS, PEX), Device Models, Digital Standard Cell Libraries, I/O Libraries, etc.
   
   ### Simplified ASIC Design Flow
   
   The following images shows the simplified version of the ASIC Design Flow.
   
   IMG Cap3
   
   **Synthesis:** Synthesis converts RTL code to a gate-level netlist (circuit made out of components from the Standard Cell Library). Standard Cells have a regular layout; each of them has different models/views such as electrical, HDL, SPICE and Layout.
   
   **Floorplanning:** The objective here is to plan the silicon area and create a robust power distribution network for powering up the circuit. In chip floorplanning, the chip die is partitioned between different system building blocks and I/O pads are placed. In macro floorplanning, the macro dimensions and it's pin locations are defined. Also, the rows and routing tracks are defined. The following images show chip and macro floorplanning respectively.
   
   IMG Cap4
   
   IMG Cap5
   
   **Power Planning:** The power distribution network is constructed. Typically, the chip is powered by multiple VDD and GND pins. The power pins are connected to all components through rings and horizontal and vertical metal straps. Such parallel structures are meant to reduce resistance (IR Drop) and to address electromigration problem. Typically, the PDNs use upper metal layers instead of lower metal ones because they are thicker.
   
   IMG Cap6
   
   **Placement:** The cells are placed in the floorplanning rows aligned with the sites (close to each other to minimize interconnect delay and to enable successful routing). There are two steps: Global Placement and Detailed Placement. Global Placement finds optimal positioning for the whole cells. Such positioning are not necessarily needed and cells may overlap or go offcourse as a result. In Detailed Placement, the positions of cells obtained on the Global Placement are minimally altered to make them sufficient. The following images show Global and Detailed Placement respectively.
   
   IMG Cap7
   
   IMG Cap8
   
   **Clock Tree Synthesis:** The objective here is to create a Clock Distribution Network to route the clock. We thereby can deliver the clock to power 
