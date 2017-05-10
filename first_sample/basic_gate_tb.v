   `timescale 1ns/1ns  
    module test;  
      
        /*Make a reset that pulses once.*/  
        reg reset = 0;  
          
        initial  
            begin  
                #17 reset = 1;  
                #11 reset = 0;  
                #29 reset = 1;  
                #11 reset = 0;  
                #100 $stop;  
            end  
          
        /*Make a regular pulsing closk*/  
          
        reg clk = 0;  
        reg clk_double = 0;

        always #5 clk = !clk;
        always #10 clk_double = !clk_double;  
          
        wire not_value;  
        not_gate not_g (clk, not_value);

        wire and_value;
        and_gate and_g(clk, clk_double, and_value);  
          
        initial  
          begin
            $monitor("At time %t, and_value = %h (%0d), clk = %h(%0d)",$time, and_value, and_value, clk, clk);  
          end

				initial
						begin

							$dumpfile("gate_test.vcd");
							$dumpvars(0, not_g);
              $dumpvars(0, and_g);
						end

    endmodule  
    //test  

