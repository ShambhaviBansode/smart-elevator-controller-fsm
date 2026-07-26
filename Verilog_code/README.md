# Verilog RTL Code

This folder contains the Verilog HDL implementation of the 3-floor elevator controller.

The `elevator_controller` module is designed using a Finite State Machine (FSM) with five states:

- `IDLE`
- `MOVE_UP`
- `MOVE_DOWN`
- `DOOR_OPEN`
- `DOOR_CLOSE`

The module accepts floor requests for Floors 1, 2, and 3 and controls the elevator's current floor, direction, movement status, and door operation.

### Inputs

- Clock
- Reset
- Floor 1, Floor 2, and Floor 3 requests
- Door close signal

### Outputs

- Current floor
- Elevator direction
- Moving indicator
- Door open indicator

The elevator starts at Floor 1 after reset and moves one floor per clock cycle toward the requested destination.
