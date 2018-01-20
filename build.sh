#!/bin/sh

rm top.blif top.bin top.txt
yosys -p "synth_ice40 -blif top.blif" top.v vga.v LifeGame.v 2>&1 | tee file.log
arachne-pnr -d 1k -p top.pcf top.blif -o top.txt 2>&1 | tee -a file.log
icepack top.txt top.bin 2>&1 | tee -a file.log
iceprog top.bin 2>&1 | tee -a file.log

