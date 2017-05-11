    `timescale 1ns/1ns  
    module test;  
      
        /*Make a reset that pulses once.*/  
        reg reset = 0;  
        reg [7:0] input_address = 9;
        reg operation = 0;
        reg [7:0] input_value = 12;
          
        initial  
            begin  
    //            #1 operation = 1;
     //           #2 input_value = 13;
                #10 operation = 0;

                //#19 operation = 0;
                #28 operation = 1;
                #29 input_value = 7;

                #35 operation = 0;

                #58 operation = 1;
                #59 input_value = 8;

                #69 operation = 0;

                #100 $stop;  
            end  
          
        /*Make a regular pulsing closk*/  
          
        reg clk = 0;  
        always #5 clk = !clk;  
          
        wire [7:0] value;  
        memory u_memory (clk, input_address, operation, input_value, value);  
          
        initial  
            $monitor("At time %t, value = %h (%0d), clk = %h(%0d)",$time, value, value, clk, clk);  

				initial
						begin

							$dumpfile("memory_test.vcd");
							$dumpvars(0, u_memory);
						end

    endmodule  
    //test  

