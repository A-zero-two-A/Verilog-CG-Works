# A verilog simulator on mac
# using iverilog, vvp, and GTKWave
echo "Cleaning"
trash ./wave*
echo "Start simulation"
iverilog -o wave $*
vvp -n wave -lxt2
cp wave.vcd wave.lxt
gtkwave wave.vcd
echo "Done!"
