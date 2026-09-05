# Sovol SV08 and SV08-MAX Device Tree Support

This repository contains custom Device Tree Source Include (`.dtsi`) files and header configurations designed specifically for the original controller boards of the **Sovol SV08** and **Sovol SV08-MAX** 3D printers, powered by the **Allwinner H616** SoC (an eMMC-variant compatible with the BigTreeTech CB1 platform).

## Overview

The host systems for both the SV08 and SV08-MAX share architectural similarities with the BTT CB1-EMMC module, but require precise modifications to handle board-level layout differences, pin configurations, and peripheral timings across both original controller board variants. This project centralizes these adjustments into a clean, unified structure to facilitate stable compilation of device tree blobs (such as `sun50i-h616-sovol-emmc.dtb`).

## Key Technical Specifications & Fixes

* **Storage Configuration (`mmc2`):** Configured to account for vendor-validated eMMC operating parameters across the original controller hardware, adjusting maximum bus frequencies and bus widths to address design limitations.
* **Unified Bindings (`sv08.h`):** Consolidates necessary interrupt controllers, clock controllers, reset bindings, and hardware definitions into a single header file tailored for the SV08 and SV08-MAX mainboards.
* **UART and Toolboard Overlays:** Supports specific stock overlay requirements for toolboard communication and pin-control remapping across both original printer families.

## Repository Structure

* `sun50i-h616-sovol-sv08-xxx.dtsi`: The primary core device tree include detailing memory maps, pin controls, regulators, and peripheral status for the SV08 and SV08-MAX original host boards.
* `sv08.h`: Unified bindings header containing definitions for GIC interrupts, CCU clocks, reset lines, and input/LED codes.
* `sun50i-h616.dtsi`: Base Allwinner H616 SoC specifications and CPU operation points.

## Disclaimer

> **WARNING:** This work is provided as-is, with community-verified configurations for the original controller boards. Modifications to device tree source files, clock frequencies, or voltage regulators carry inherent risks of hardware instability or component failure. Use at your own risk.

  Sovol SV08 printer host family uses an Allwinner H616.                   
  A clone like of BTT-CB1-EMMC.                                       
                                                                           
  Electrically an eMMC-variant CB1, so it reuses the CB1 device tree and   
  u-boot. Board-level differences vs the CB1:                              
    - onboard eMMC part validated by the vendor at 45 MHz (the CB1 device  
      tree leaves mmc2 at the SoC default);                                
    - a toolboard UART is broken out; enable it with the stock             
  MAIN NOTICE :                                                            
    -SV08                                                                  
         sun50i-h616-uart3-pi overlay (DEFAULT_OVERLAYS                    
         in the board config).                                             
    - SV08-MAX                                                             
         sun50i-h616-uart4-pi overlay (DEFAULT_OVERLAYS                    
         in the board config).                                             
    - The main trick that Sovol and BTT uses to mantain compatiblity:      
    	  the overlays related to UART4 remap the PIN-CTRL and FLOW-CTL     
         over the UART3 masking all behaivor                               
    - SOVOL reduce the onboard eMMC max speed due a bad electrical desssign
  
  Community DTS: verified by DrDitto.                                
                                                                           
 
