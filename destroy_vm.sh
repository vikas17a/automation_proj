#this script destroy the generated VM's

date=$(date);

echo "***VM destruction started $date ***" >> logs/log.log

echo "Waiting for user to enter the number of VM's" >> logs/log.log

#reading the user input
read count;

echo "Operation started";

#storing the input for the future use;
to_dir=$count;

#action to perform
while [ $count -ne 0 ]
do
	cd v$count;
	echo "Destroying Virtual Machine $count" >> ../logs/log.log 
	vagrant destroy -f >> ../logs/log.log;
	sleep 8;
	echo "VM $count destroyed" >> ../logs/log.log;
	count=`expr $count - 1`;
	cd ..;
done

#to remove the directory created before
sh remove.sh $to_dir >> logs/log.log;

date=$(date);

echo "Destruction of VM's completed at $date" >> logs/log.log;
echo "*******Descrtuction Completed" >> logs/log.log;

echo "Operation Completed";
