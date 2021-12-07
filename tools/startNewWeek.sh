# Init a new dir with ${2} .v files which named ${1}
mkdir Week${1}
cd Week${1}
for ((i=1;i<=$2;i++))
do
	echo endmodule > ${i}.v
done
echo Completed!
