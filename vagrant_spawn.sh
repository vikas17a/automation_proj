#scripts to spawn new VM and make them Up and running
read count;
par_for_work=$count;
while [ $count -ne 0 ]
do
	mkdir v$count;
	echo "Directory v$count created ...."
	cd v$count;
	echo "Initializing the vagrant machine $count envoirnment ....."
	vagrant init lucid32;
	sleep 3;
	echo "Vagrant machine $count enviornment initialized ......"
	echo "Vagrant machine $count is goint up now ......"
	vagrant up;
	sleep 25;
	echo "Vagrant Machine $count is Up and Running .....";
	cd ..;
	count=`expr $count - 1`;
done
echo "All the VM's are spawned and running and UP";
sh worker.sh $par_for_work;
