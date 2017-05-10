module addr (a, b, cin, count, sum);

initial begin
    $display("*************************");
    $display("adder");
    $display("*************************");
end

  input [2:0] a; 
  input [2:0] b; 
  input cin;
  output count; 
  output [2:0] sum;
  assign {count,sum} = a +b + cin; 

endmodule
