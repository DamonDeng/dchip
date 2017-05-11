module cpu (clk, reset, from_memory, memory_operation, memory_address, to_memory);

initial begin
    $display("************** CPU **********");
end

  input clk;
  input reset;
  input [7:0] from_memory;

  output reg memory_operation;
  output reg [7:0] memory_address;
  output reg [7:0] to_memory;

  reg [7:0] instruction;
  reg [7:0] target;

  reg [7:0] status;
  reg [7:0] ip;

  reg [7:0] general_reg[7:0];

  always @(reset) begin
    status <= 0;
    ip <= 0;
    memory_operation <= 0;
    memory_address <= 0;
    to_memory <= 0;
  end

  always @(posedge clk) begin
      case(status)
        8'b00000000: begin
          $display("starting instruction process");
          memory_operation <= 0;
          memory_address <= ip;
          status <= status + 1;
        end
        8'b00000001: begin
          $display("copying instruction content");
          instruction <= from_memory;
          status <= status + 1;
        end
        8'b00000010: begin
          $display("reding target value ");
          memory_operation <= 0;
          memory_address <= ip + 1;
          status <= status + 1;
        end
        8'b00000011: begin
          $display("copying target value ");
          target <= from_memory;
          status <= status + 1;
        end
        8'b00000100: begin
          //moving the ip to next instruction:
          ip <= ip + 2;
          $display(" got the instruction: %b with target: %b (%0d)", instruction, target, target);
          case (instruction[7:4])
            4'b0001: begin
              $display("moving scalar data to reg");
              general_reg[instruction[3:0]] <= target;
              status <= 0;
            end
            4'b0010: begin
              $display("moving data from memory to from_memory reg");
              memory_operation <= 0 ;
              memory_address <= target;

              status <= status + 1;
            end
            4'b1111: begin
              $display("get exit signal from instruction");
              status <= 8'b11111111;
            end
           endcase
        end
        8'b00000101: begin
          case (instruction[7:4])
            4'b0010: begin
              $display("moving data from from_memory reg to target reg");
              $display("The value in from_memory is now %0d", from_memory);
              general_reg[instruction[3:0]] <= from_memory;
              status <= 0;
            end
          endcase
        end
        8'b11111111: begin
          $display("end of the program, nothing happen from now");
          $display("General Reg: %b  %b", general_reg[0], general_reg[1]);
        end
        default: begin
          $display("end of life, nothing happen");
        end
      endcase
    end
   
endmodule


