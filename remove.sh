#script to remove the directories
count=$1;
while [ $count -ne 0 ]
do
	rm -r v$count;
	count=`expr $count - 1`;
done
echo "Directories removed operation Completed ....";
