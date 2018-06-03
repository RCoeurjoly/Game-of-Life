# Game-of-Life
Game of life in Verilog

This is a work in progress.

## Especifications:

1. Life should be, ideally, updated with a 85Hz frequency. 
1.1 First we are going to use a prescaler and update the screen each second approximatelly
2. The size of a cell should be as small as possible given the FPGA resources. Ideally that would be a pixel.
2.1 To begin with we are going to do it with sprites of 32 x 32 pixels.
3. From Wikipedia:

    Any live cell with fewer than two live neighbours dies, as if caused by underpopulation.
    Any live cell with two or three live neighbours lives on to the next generation.
    Any live cell with more than three live neighbours dies, as if by overpopulation.
    Any dead cell with exactly three live neighbours becomes a live cell, as if by reproduction.

## Implementation:

TODO