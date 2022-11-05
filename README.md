iverilog -o arm_multi.out -c arm_multi.txt
vvp .\arm_multi.out
gtkwave arm_multi.vcd