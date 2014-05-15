#script to remove the directories
read count;
while [ $count -ne 0 ]
do
	rm -r v$count;
	count=`expr $count - 1`;
done
echo "Directories removed operation Completed ...."
