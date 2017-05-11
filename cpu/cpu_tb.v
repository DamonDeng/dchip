    `timescale 1ns/1ns  
    module cpu_test;  
      
        /*Make a reset that pulses once.*/  
        reg reset = 0;  

         initial  
            begin  
                #1 reset = 1;  
                #2 reset = 0;  
                #400 $stop;  
            end  
     
          
        reg clk = 0;  
        always #5 clk = !clk;  
          
        wire [7:0] memory_value;  
        wire operation;
        wire [7:0] memory_address;
        wire [7:0] memory_input;

        memory u_memory (clk, memory_address, operation, memory_input, memory_value);  

        cpu u_cpu(clk, reset, memory_value, operation, memory_address, memory_input);
          
        initial  
            $monitor("At time %t, value = %h (%0d), clk = %h(%0d)",$time, memory_value, memory_value, clk, clk);  

				initial
						begin

							$dumpfile("cpu_test.vcd");
							$dumpvars(0, u_cpu);
						end

    endmodule  
    //test  

