echo "Cleaning..."
echo "Start simulation"
cd C:\iverilog\bin
iverilog -o C:\Projects\wave %*
cd C:\Projects\
C:\iverilog\bin\vvp -n C:\Projects\wave -lxt2
copy C:\Projects\wave.vcd C:\Projects\wave.lxt
cd C:\Projects\
C:\iverilog\gtkwave\bin\gtkwave wave.vcd
echo "Done!"