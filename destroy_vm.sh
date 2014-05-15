#this script destroy the generated VM's
read count;
while [ $count -ne 0 ]
do
	cd v$count;
	echo "Destroying Virtual Machine $count";
	vagrant destroy -f;
	sleep 8;
	echo "VM $count destroyed ......"
	count=`expr $count - 1`;
	cd ..
done
