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
          
        wire latch_value;  
        rs_latch u_rs_latch(clk, clk_double, latch_value);
          
        initial  
          begin
            $monitor("At time %t, latch_value = %h (%0d), clk = %h(%0d)",$time, latch_value, latch_value, clk, clk);  
          end

				initial
						begin

							$dumpfile("latch_test.vcd");
							$dumpvars(0, u_rs_latch);
						end

    endmodule  
    //test  

