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

Problem:

Verilog does not support two dimensional arrays as ports of modules. This feature is supported by SystemVerilog only.

The screen is initialize with a pattern. This screen is passed to the screen updater, that creates the next screen with the current screen.

The FSM for the screen updater is as follows:

States: IDLE, UPDATE_NEXT_SCREEN, OVERWRITE_CURRENT_SCREEN

Initial state: IDLE.

If it receives the first data point of the screen, go to UPDATE_NEXT_SCREEN state.

In UPDATE_NEXT_SCREEN state, fill next screen with appropriate data.
Once it receives the last data point of current screen, go to IDLE state.
When, while being IDLE, it receives the prescaler output, it goes to OVERWRITE_CURRENT_SCREEN state.

In OVERWRITE_CURRENT_SCREEN state, it overwrites screen matrix with the previously calculated next screen data.
Then it inconditionally goes to UPDATE_NEXT_SCREEN state.

How updating the next screen is done

Each time the screen updater receives a new screen, it begins to update the next screen matrix.

First, it has to find where are the 8 neighbours of this data point. 
For each data point, there is a different set of neighbours.
We want the screen to represent a sphere, so we join the corners together.

The effect is that we have 4 edge cases and 4 corner cases in terms of calculating the neighbours.
```

+---+----------------------------------------+---+
| 8 |                     1                  | 2 |
+---+----------------------------------------+---+
|   |                                        |   |
|   |                                        |   |
|   |                                        |   |
|   |                                        |   |
|   |                                        |   |
|   |                                        |   |
|   |                                        |   |
| 7 |                                        | 3 |
|   |                                        |   |
|   |                                        |   |
|   |                                        |   |
|   |                                        |   |
|   |                                        |   |
|   |                                        |   |
|   |                                        |   |
+---+----------------------------------------+---+
| 6 |                    5                   | 4 |
+---+----------------------------------------+---+

```

Normal case: 0
Edge cases: 1, 3, 5 and 7
Corner cases: 2, 4, 6 and 8

The 8 neighbouring cells are called:

Upper cell
Upper right cell
Right cell
Lower right cell
Lower cell
Lower left cell
Left cell
Upper left cell