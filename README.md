4:1 Multiplexer (MUX) Design and Verification
Project Overview
This project is a 4:1 multiplexer (MUX) implemented in SystemVerilog. The multiplexer has four 4-bit input lines, one 4-bit output line, and a 2-bit select line that determines which input is forwarded to the output. Along with the design, a verification testbench is implemented to validate the functionality of the multiplexer using SystemVerilog and Universal Verification Methodology (UVM).

Key Features:
4:1 MUX with 4-bit inputs: Allows selection between four different 4-bit inputs.
Parameterizable design: Easily scalable to different input or data widths.
Comprehensive verification: The testbench covers various functional scenarios to ensure correct operation.

1. Design Specifications

Design Details
Input Ports:
A - 4-bit input ([3:0])
B - 4-bit input ([3:0])
C - 4-bit input ([3:0])
D - 4-bit input ([3:0])
Select Line:
Sel - 2-bit input ([1:0]), used to select one of the four inputs.
Output Port:
Y - 4-bit output ([3:0]), forwards the selected input.
Truth Table
Sel	Output Y
00	A
01	B
10	C
11	D

2. Verification Environment
The verification environment is implemented in SystemVerilog and follows a layered UVM approach. The goal is to verify that the MUX behaves correctly for all possible input conditions and select lines.

Testbench Components
Interface (mux_if): Defines the signals used in the design and connects them to the testbench.

Transaction: Defines the input signals (4-bit inputs A, B, C, D, and 2-bit Sel).

Driver: Drives the input stimulus to the design.

Monitor: Monitors the output Y and captures transactions for functional coverage.

Scoreboard: Compares the actual output of the MUX with the expected output.

Test Scenarios
Basic Functionality Test: Verifies that each input (A, B, C, D) is selected correctly based on the Sel value.
Corner Case Test: Tests edge cases, such as all-zero and all-one inputs.
Randomized Test: Generates random combinations of inputs and Sel values to cover a wide range of scenarios.
