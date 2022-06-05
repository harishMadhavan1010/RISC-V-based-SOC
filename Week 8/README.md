## Resolved Problems:

The problems concerning tools like Yosys and OpenSTA have now been resolved. The following are the design principles one should consider to solve the problems. Credit goes to "Arman Avetisyan".

> 1. For a mixed signal chip development, I need to write functional verilog only for simulations' sake and it should be dropped while performing synthesis.
> 2. GDS files (and LEF files) of the analog blocks are obtained using magic vlsi.
> 3. Also, blackboxes are used while performing synthesis with Yosys.
> 4. Optionally, have .lib files or have .sdc files to specify the drive strength.
> 5. Use openlane with EXTRA_GDS and EXTRA_LEF parameters specified.
> 6. Design the top component. For simulation, use the simulation models.  For openlane, replace the analog modules with blackboxes.

The following figure contains the issue I had been facing.

![STA_issue](../Week%208/images/Capture4.PNG)

## Current Problems:

While trying to close timing on rvmyth and to create a .gds and .lef file out of that, I am facing some hold time violations and several (49999) DRC errors. I haven't figured a way to automatically correct the DRC errors. To resolve hold time violations, I decided to do synthesis exploration to check what the least delay is. The following image showcases the STA report.

The following images contain the issue I am facing; the former two showcases the timing closure problems and the final one showcasing errors with the GDS file.

![hold_time_viol](../Week%208/images/Capture5.PNG)

![hold_time_viol](../Week%208/images/Capture3.PNG)

![drc_check](../Week%208/images/Capture6.PNG)

The following image is the result I got out of synthesis exploration.

![synth_explore](../Week%208/images/Capture1.PNG)
