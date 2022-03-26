# Week 2: Designing a PLL
This directory is dedicated to explaining/reporting my design of PLL.

## Table of Contents
* [Day 1: Theory + Required Tools](https://github.com/harishMadhavan1010/RISC-V-based-SOC/blob/main/Week%202/README.md#day-1)
  - [PLL Overview](https://github.com/harishMadhavan1010/RISC-V-based-SOC/blob/main/Week%202/README.md#pll-overview)
  - [PLL Component Description](https://github.com/harishMadhavan1010/RISC-V-based-SOC/blob/main/Week%202/README.md#pll-component-description)
  - [Required Tools](https://github.com/harishMadhavan1010/RISC-V-based-SOC/blob/main/Week%202/README.md#required-tools)
  - [Setup](https://github.com/harishMadhavan1010/RISC-V-based-SOC/blob/main/Week%202/README.md#setup)
* [Day 2: Design + Simulations](https://github.com/harishMadhavan1010/RISC-V-based-SOC/blob/main/Week%202/README.md#day-2)
* [Credits](https://github.com/harishMadhavan1010/RISC-V-based-SOC/blob/main/Week%202/README.md#credits)
* [References](https://github.com/harishMadhavan1010/RISC-V-based-SOC/blob/main/Week%202/README.md#references)

## Day 1
  ### PLL Overview
  PLLs are used to mimic a reference signal such that the resulting signal has a frequency same as that of or a multiple of the frequency of the reference signal and a constant phase difference.
  
  ![PLL Block Diagram](../Week%202/images/Capture2.PNG)
  
  We use PLL mainly to obtain a precise clock signal without any frequency or phase noise while at the same time, running at our desired frequency. While Quartz Crystals alone have superior spectral purity, they aren't flexible. While Voltage-Controlled Oscillators alone are flexible with respect to their frequency, they don't have favourable noise characteristics.
 
  ![Magnitude Spectrum](../Week%202/images/Capture1.PNG)

  `Note: Spectral Purity implies an absence of frequency or phase noise i.e. clock edges are launched/latched at the right time.`
    
  ### PLL Components Description
  
  This section discusses the various components specified in the block diagram in detail.
  
  <ins>**Phase Frequency Detector:**</ins>
  
  Phase Frequency Detector takes in the reference and the output signal and checks if there is a phase difference and tells us whether the output signal is leading/lagging (represented as DOWN/UP respectively). The following are the state diagram representation and the circuit diagram respectively.
  
  ![FSM Representation](../Week%202/images/Capture4.PNG)
  
  ![Circuit Diagram](../Week%202/images/Capture3.PNG)
  
  `NOTE 1: All PFDs are vulnerable to dead zone i.e. they take time to act if there is a difference in phase and if the difference is minute, the DOWN/UP signal might be noisy.`
  
  `NOTE 2: Our design is able to detect differences in frequency as well. DOWN/UP corresponds to output having higher/lower frequency than the reference.`
  
  <ins>**Charge Pump:**</ins>
  
  Charge Pump is used to convert the digital measure of phase/frequency different to an analog representation to control the VCO. This is implemented using the current-steering circuit (backed up by a LPF) whose transistor-level implementation is given below:
  
  ![Current Steering](../Week%202/images/Capture5.PNG)
  
  We use a Low Pass Filter as well to remove any fluctuations and to keep the output stable.
  
  <ins>**Voltage Controlled Oscillator:**</ins>
  
  Voltage Controlled Oscillator creates a periodic output signal whose frequency corresponds to the voltage supplied as the input. The transistor-level of VCO is given below.
  
  ![VCO](../Week%202/images/Capture6.PNG)
  
  <ins>**Frequency Divider:**</ins>
  
  Frequency Divider (by N) lets us multiply the output signal (by N). The circuit diagram for Frequency Divider (by 2) is shown below.
  
  ![Freq Div](../Week%202/images/Capture7.PNG)
  
  `NOTE: For obtaining 8x multiplier, we need 3 Flip Flops as opposed to just 1.`
  
  ### Required Tools
  
  
  
  ### Setup
  

## Day 2


## Credits


## References

