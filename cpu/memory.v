module memory (clk, input_address, operation, input_value, output_value);

initial begin
    $display("************** memory **********");
end

  input clk;
  input [7:0] input_address;
  input operation; 
  input [7:0] input_value;
  output reg [7:0] output_value;
  
  reg [7:0] mem[0:99];
 
  initial begin
   $readmemb ("ram.patt", mem); 
  end

  always @(negedge clk) begin
  
  if (operation) 
    mem[input_address] <= input_value;
  else
    output_value <= mem[input_address];

  end

 // begin
 //   if (operation == 'b0)
 //   begin
 //       output_value <= mem[0] ;
 //     end
 //   else
 //   begin
 //       mem[input_address] <= input_value; 
 //     end
 // end

endmodule


