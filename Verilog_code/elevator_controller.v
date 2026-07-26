`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/26/2026 10:53:31 AM
// Design Name: 
// Module Name: elevator_controller
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


module elevator_controller(
      input clk,
      input reset,
      input req_floor1,
      input req_floor2,
      input req_floor3,
      input door_close,
      
      output reg [1:0] current_floor,
      output reg [1:0] direction,
      output reg door_open,
      output reg moving
      
    );
    
    // Encoding the states
      
      localparam IDLE       = 3'b000;
      localparam MOVE_UP    = 3'b001;
      localparam MOVE_DOWN  = 3'b010;
      localparam DOOR_OPEN  = 3'b011;
      localparam DOOR_CLOSE = 3'b100;
      
   // Declaring internal registers
      reg [2:0] current_state, next_state;
      reg [1:0] target_floor;
      
   // State Register
     always @(posedge clk or posedge reset)
     begin
     if (reset)
        current_state <= IDLE;
     else
        current_state <= next_state;
     end
     
   // Next-State Logic
     always @(*)
       begin
          case(current_state)

         IDLE:
    begin
    if(req_floor1)
    begin
        if(current_floor > 2'b01)
            next_state = MOVE_DOWN;
        else
            next_state = DOOR_OPEN;
    end

    else if(req_floor2)
    begin
        if(current_floor < 2'b10)
            next_state = MOVE_UP;
        else if(current_floor > 2'b10)
            next_state = MOVE_DOWN;
        else
            next_state = DOOR_OPEN;
    end

    else if(req_floor3)
    begin
        if(current_floor < 2'b11)
            next_state = MOVE_UP;
        else
            next_state = DOOR_OPEN;
    end

    else
        next_state = IDLE;
   end
        MOVE_UP:
   begin
    if(current_floor < target_floor)
        next_state = MOVE_UP;
    else
        next_state = DOOR_OPEN;
    end

      MOVE_DOWN:
   begin
    if(current_floor > target_floor)
        next_state = MOVE_DOWN;
    else
        next_state = DOOR_OPEN;
   end

        DOOR_OPEN:
        begin
            if(door_close)
                next_state = DOOR_CLOSE;
            else
                next_state = DOOR_OPEN;
        end

        DOOR_CLOSE:
        begin
            next_state = IDLE;
        end

        default:
        begin
            next_state = IDLE;
        end

    endcase
   end

    // Current Floor Update Logic
    
    
   always @(posedge clk or posedge reset)
   begin
    if(reset)
    begin
        current_floor <= 2'b01;      // Start at Floor 1
    end

    else
    begin
        case(current_state)

            MOVE_UP:
            begin
                if(current_floor < target_floor)
                    current_floor <= current_floor + 1;
                else
                    current_floor <= current_floor;
            end

            MOVE_DOWN:
            begin
                if(current_floor > target_floor)
                    current_floor <= current_floor - 1;
                else
                    current_floor <= current_floor;
            end

            default:
    begin
    // Stay at current floor
     end
        endcase
      end
    end

   // Request Capture Logic
   
   
always @(posedge clk or posedge reset)
begin
    if(reset)
    begin
        target_floor <= 2'b01;   // Default Floor 1
    end

    else
    begin
        if(req_floor1)
            target_floor <= 2'b01;

        else if(req_floor2)
            target_floor <= 2'b10;

        else if(req_floor3)
            target_floor <= 2'b11;

        else
            target_floor <= target_floor;
    end
end
      // Output Logic
      
      
   always @(*)
   begin
    // Default Outputs
    direction = 2'b00;      // No Movement
    moving     = 1'b0;
    door_open  = 1'b0;

    case(current_state)

        IDLE:
        begin
            direction = 2'b00;
            moving    = 1'b0;
            door_open = 1'b0;
        end

        MOVE_UP:
        begin
            direction = 2'b01;
            moving    = 1'b1;
            door_open = 1'b0;
        end

        MOVE_DOWN:
        begin
            direction = 2'b10;
            moving    = 1'b1;
            door_open = 1'b0;
        end

        DOOR_OPEN:
        begin
            direction = 2'b00;
            moving    = 1'b0;
            door_open = 1'b1;
        end

        DOOR_CLOSE:
        begin
            direction = 2'b00;
            moving    = 1'b0;
            door_open = 1'b0;
        end

        default:
        begin
            direction = 2'b00;
            moving    = 1'b0;
            door_open = 1'b0;
        end

    endcase
end
endmodule
