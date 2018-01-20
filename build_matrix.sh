#!/bin/sh

rm top_matrix.blif top_matrix.bin top_matrix.txt
yosys -p "synth_ice40 -blif top_matrix.blif" top_matrix.v vga.v matrix.v 2>&1 | tee file_matrix.log
arachne-pnr -d 1k -p top_matrix.pcf top_matrix.blif -o top_matrix.txt 2>&1 | tee -a file_matrix.log
icepack top_matrix.txt top_matrix.bin 2>&1 | tee -a file_matrix.log
iceprog top_matrix.bin 2>&1 | tee -a file_matrix.log

