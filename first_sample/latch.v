module rs_latch (input_a, input_b, output_value);

initial begin
    $display("*************************");
    $display("rs_latch");
    $display("*************************");
end

  input input_a;
  input input_b;
  output output_value;

  wire nor_a;
  wire nor_b;

  nor u1 (nor_a, input_a, nor_b);
  nor u2 (nor_b, input_b, nor_a);

  assign output_value = nor_a;


endmodule



