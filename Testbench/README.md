# Testbench

This folder contains the Verilog testbench used to simulate and verify the functionality of the 3-floor elevator controller.

The testbench instantiates the `elevator_controller` module as the Design Under Test (DUT), generates a clock signal, applies reset, and provides different floor requests.

## Verification Performed

The following test cases are simulated:

1. **Floor 1 → Floor 3**
   - Verifies upward movement.
   - Checks the elevator reaches Floor 3.
   - Verifies door closing operation.

2. **Floor 3 → Floor 1**
   - Verifies downward movement.
   - Checks the elevator reaches Floor 1.
   - Verifies door closing operation.

3. **Floor 1 → Floor 2**
   - Verifies upward movement by one floor.
   - Checks the elevator reaches Floor 2.
   - Verifies door closing operation.

## Testbench Features

- Generates a clock with a 10 ns time period.
- Applies reset for 20 ns.
- Generates floor request signals.
- Controls the `door_close` signal.
- Uses `$display` statements to show test-case progress.
- Terminates the simulation using `$finish`.

The testbench is used to verify FSM state transitions, elevator floor movement, direction control, and door operation.
