#!/bin/sh

rm top_tb.out top_tb.vcd top_tb.gtkw
iverilog top.v vga.v LifeGame.v top_tb.v -o top_tb.out
./top_tb.out
gtkwave top_tb.vcd top_tb.gtkw &

