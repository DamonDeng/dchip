module not_gate (input_value, output_value);

initial begin
    $display("*************************");
    $display("not_gate");
    $display("*************************");
end

  input input_value;
  output output_value;
  
  assign output_value = !input_value ;

endmodule


module and_gate (input_a, input_b, output_value);

initial begin
    $display("*************************");
    $display("and_gate");
    $display("*************************");
end

  input input_a;
  input input_b;
  output output_value;

  // assign output_value = input_a & input_b;
  and u_and (output_value, input_a, input_b);

endmodule


  
