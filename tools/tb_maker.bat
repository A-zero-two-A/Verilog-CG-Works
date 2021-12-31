echo "// %1 testbench\n \`timescale 1ps/1ps\nmodule %1_tb();\n	reg clk;\n	reg rst;\n	initial begin\n		\$dumpfile(\"wave.vcd\");        //生成的vcd文件名称\n    	\$dumpvars(0, %1_tb);     //tb模块名称\n    	\n	end\n	always #1 clk = ~clk;\n	%1 %1(/*Input Ports*/);\nendmodule" > .\%1_tb.v
echo "Done!"