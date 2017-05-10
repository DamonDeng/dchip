iverilog -o $1_design  $1_tb.v $1.v

vvp -n $1_design

