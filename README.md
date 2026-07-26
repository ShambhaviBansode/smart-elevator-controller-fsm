# Smart Elevator Controller Using Finite State Machine (FSM)

A 3-floor elevator controller designed using **Verilog HDL** and a **Finite State Machine (FSM)**. This project demonstrates the complete digital design flow from RTL implementation and testbench development to functional simulation, waveform analysis, and RTL synthesis.

---

## Objective

Design and verify a digital controller for a 3-floor elevator using a Finite State Machine.

The controller is designed to:

- Accept requests for Floor 1, Floor 2, and Floor 3
- Determine the correct direction of movement
- Move the elevator between floors
- Update the current floor
- Open the door after reaching the requested floor
- Wait for the door-close signal
- Return to the idle state after completing the operation

The project follows a complete RTL-based digital design flow:

```text
RTL Design
    ↓
Testbench Development
    ↓
Functional Simulation
    ↓
Waveform Analysis
    ↓
RTL Synthesis
    ↓
Synthesized Schematic
