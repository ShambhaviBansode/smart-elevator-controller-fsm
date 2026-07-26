`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/26/2026 12:26:19 PM
// Design Name: 
// Module Name: tb_elevator_controller
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module tb_elevator_controller;

      // Input Signals
        
reg clk;
reg reset;
reg req_floor1;
reg req_floor2;
reg req_floor3;
reg door_close;

     // Output Signals

wire [1:0] current_floor;
wire [1:0] direction;
wire moving;
wire door_open;

  // DUT (Design Under Test) Instantiation
  
  
elevator_controller uut (
    .clk(clk),
    .reset(reset),
    .req_floor1(req_floor1),
    .req_floor2(req_floor2),
    .req_floor3(req_floor3),
    .door_close(door_close),
    .current_floor(current_floor),
    .direction(direction),
    .moving(moving),
    .door_open(door_open)
);

    initial
    begin
    clk = 0;
    end

always
    #5 clk = ~clk;
    
    // Test Stimulus
initial
begin
    // Initialize Inputs
    reset = 1;
    req_floor1 = 0;
    req_floor2 = 0;
    req_floor3 = 0;
    door_close = 0;

    // Hold reset for 20 ns
    #20;
    reset = 0;

    
    // Test Case 1 : Floor 1 -> Floor 3
    // Hold request for one clock cycle
    
    $display("Test Case 1 : Move from Floor 1 to Floor 3");
   
    #10;
    req_floor3 = 1;

    #10;
    req_floor3 = 0;

    // Wait until elevator reaches Floor 3
    #100;

    // Passenger closes the door
    door_close = 1;

    #10;
    door_close = 0;

  
    // Test Case 2 : Floor 3 -> Floor 1
    // Hold request for one clock cycle
        
   
    #30;
    $display("Test Case 2 : Move from Floor 3 to Floor 1");
    req_floor1 = 1;

    #10;
    req_floor1 = 0;

    // Wait until elevator reaches Floor 1
    #100;

    door_close = 1;

    #10;
    door_close = 0;

    
    // Test Case 3 : Floor 1 -> Floor 2
    // Hold request for one clock cycle

    #30;
     $display("Test Case 3 : Move from Floor 1 to Floor 2");
    req_floor2 = 1;

    #10;
    req_floor2 = 0;

    // Wait until elevator reaches Floor 2
    #80;

    door_close = 1;

    #10;
    door_close = 0;
    
    
      // End Simulation
   #20;
   $display("Simulation Completed Successfully");
   $finish;
end


endmodule
