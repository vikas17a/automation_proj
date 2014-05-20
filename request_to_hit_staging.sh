#####################################################
## Script to create request from the parsing result #
#####################################################
#
#   SCRIPT Require parsed_output.txt
#   FILE named with work should be empty
# 
#####################################################

if [ -f "parsed_output.txt" ]
then
	echo "Processing the parsed_output";
else
	echo "parsed_output.txt doesnot exists";
	exit 1;
fi

if [ -f "work" ]
then
	rm work;
else
	echo "Processing the work";
fi

while read line
do
	req=`echo $line | awk '{ print $1 }'`;
	num=`echo $line | awk '{ print $2 }'`;
	echo "num=0;" >> work
	echo "while [ \$num -ne $num ]" >> work
	echo "do" >> work
	echo "	ab -n $1 -c $1 $req" >> work
	echo "	sleep 1;" >> work
	echo "	num=\`expr \$num - 1\`;" >> work
	echo "done" >> work

done < parsed_output.txt

echo "Done !!!";
