#!/bin/bash
cpp -nostdinc -undef -x assembler-with-cpp -I. sun50i-h616-sovol-sv08-xxx.dtsi > preprocessed.dts
dtc -I dts -O dtb -o sun50i-h616-sovol-sv08-xxx.dtb preprocessed.dts
