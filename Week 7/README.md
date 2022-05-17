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
